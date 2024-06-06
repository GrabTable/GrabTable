from selenium.webdriver.common.by import By
from urllib3.util.retry import Retry
from requests.adapters import HTTPAdapter
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import re
from selenium.webdriver.common.keys import Keys
import time
import requests

class Crawler:
    def __init__(self):
        self.place_name = ''
        self.naver_reviews = []
        self.kakao_reviews = []
        self.menus = []
        self.latitude = 0.0
        self.longitude = 0.0
        self.naver_avg_rating = 0
        self.kakao_avg_rating = 0
    
    def fetch_store_info_with_naver_code(self, place_code: str):
        url = f'https://map.naver.com/p/api/place/summary/{place_code}'
        headers = {
            'Accept': 'application/json, text/plain, */*',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
        }
        response = requests.get(url, headers=headers).json()
        self.place_name = response['name']
        self.latitude = response['y']
        self.longitude = response['x']

    def fetch_naver_reviews(self, place_code: str):
        url = f'https://m.place.naver.com/restaurant/{place_code}/review/visitor?entry=ple&reviewSort=recent'
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        options.add_argument('disable-gpu')
        options.add_argument('lang=ko_KR')
        options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3')

        driver = webdriver.Chrome(service = Service(ChromeDriverManager().install()), options=options)
        driver.get(url)
        time.sleep(3)

        try:
            self.naver_avg_rating = driver.find_element(By.XPATH, '/html/body/div[3]/div/div/div/div[6]/div[2]/div[1]/div/div/div[3]/span[1]/em').text
        except:
            self.naver_avg_rating = 0

        try:
            while True:
                driver.find_element(By.XPATH, '//*[@id="app-root"]/div/div/div/div[6]/div[2]/div[3]/div[2]/div/a').click()
                time.sleep(0.4)
        except Exception as e:
            print('finish loading')
        

        review_elements = driver.find_elements(By.CSS_SELECTOR, '#app-root > div > div > div > div:nth-child(6) > div:nth-child(2) > div.place_section.k1QQ5 > div > ul > li')
        for i, _ in enumerate(review_elements):
            try: 
                content = driver.find_element(By.CSS_SELECTOR, f"#app-root > div > div > div > div:nth-child(6) > div:nth-child(2) > div.place_section.k1QQ5 > div > ul > li:nth-child({i+1}) > div > div.vg7Fp.CyA_N > a > span")
                created_at = driver.find_element(By.CSS_SELECTOR, f"#app-root > div > div > div > div:nth-child(6) > div:nth-child(2) > div.place_section.k1QQ5 > div > ul > li:nth-child({i+1}) > div > div.jxc2b > div.D40bm > span:nth-child(1) > span:nth-child(3)")
                self.naver_reviews.append(dict(
                    content = content.text,
                    created_at = created_at.text
                ))
            except:
                continue
        driver.quit()

    def fetch_kakao_reviews(self, place_code: str):

        url = f'https://place.map.kakao.com/main/v/{place_code}'
        headers = {
            'Accept': 'application/json, text/plain, */*',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
        }

        response = requests.get(url, headers=headers).json()
        self.kakao_avg_rating = round(response['comment']['scoresum'] / response['comment']['scorecnt'], 2)

        comments = response['comment']['list']
        while True:
            has_next = response['comment']['hasNext']            
            for comment in comments:
                try:
                    content = comment['contents']
                except:
                    content = ''
                created_at = comment['date']
                rating = comment['point']
                self.kakao_reviews.append(dict(
                    content = content,
                    created_at = created_at,
                    rating = rating
                ))

            if has_next:
                last_comment_id = comments[-1]['commentid']
                next_url = f"https://place.map.kakao.com/commentlist/v/{place_code}/{last_comment_id}"
                response = requests.get(next_url, headers=headers).json()
                comments = response['comment']['list']
            else:
                break

    def fetch_menus(self, kakao_place_code: str):
        url = f'https://place.map.kakao.com/main/v/{kakao_place_code}'
        headers = {
            'Accept': 'application/json, text/plain, */*',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
        }

        response = requests.get(url, headers=headers).json()
        menus = response['menuInfo']['menuList']
        self.menus = menus
        
    def send_data(self, generator, category):
        generator.add_store_query(self.place_name, category, self.latitude, self.longitude)
        for review in self.naver_reviews:
            generator.add_review_query(review['content'], None, 'NAVER')
        for review in self.kakao_reviews:
            generator.add_review_query(review['content'], review['rating'], 'KAKAO')
        for m in self.menus:
            generator.add_menu_query(m['menu'], m['price'])

    def clear(self):
        self.place_name = ''
        self.naver_reviews = []
        self.kakao_reviews = []
        self.menus = []
        self.naver_avg_rating = 0
        self.kakao_avg_rating = 0

    def execute(self, generator, category, naver_place_code, kakao_place_code):
        self.fetch_store_info_with_naver_code(naver_place_code)
        self.fetch_naver_reviews(naver_place_code)
        self.fetch_kakao_reviews(kakao_place_code)
        self.fetch_menus(kakao_place_code)
        self.send_data(generator, category)
        self.clear()

class SeedGenerator:
    def __init__(self):
        self.store_queries = []
        self.review_queries = []
        self.menu_queries = []
        self.store_id = 0
        self.review_start_id = 0
        self.menu_id = 0

    def add_store_query(self, place_name, category, latitude, longitude):
        self.store_id += 1
        store_query = f"""
        INSERT INTO store (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url, category, status, latitude, longitude)
        VALUES ({self.store_id}, NULL, NULL, NULL, NULL, NULL, '{place_name}', NULL, '{category}', 'VALID', '{latitude}', '{longitude}');
        """
        self.store_queries.append(store_query)

    def add_review_query(self, content, rating, platform):
        self.review_start_id += 1
        review_query = f"""
        INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
        VALUES ({self.review_start_id}, NULL, NULL, '{content}', {rating}, {self.store_id}, NULL, '{platform}', 'VALID');
        """
        self.review_queries.append(review_query)

    def add_menu_query(self, menu_name, price):
        self.menu_id += 1
        price = price.replace(',', '')
        menu_query = f"""
        INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
        VALUES ({self.menu_id}, NULL, NULL, '{menu_name}', NULL, {price}, {self.store_id}, 'VALID');
        """
        self.menu_queries.append(menu_query)

    def generate_db_seed_files(self):
        store_content = '\n'.join(self.store_queries)
        review_content = '\n'.join(self.review_queries)
        menu_content = '\n'.join(self.menu_queries)

        store_file_name = f'stores.sql'
        review_file_name = f'reviews.sql'
        menu_file_name = f'menus.sql'

        with open(store_file_name, 'w', encoding="utf-8") as f:
            f.write(store_content)
        with open(review_file_name, 'w', encoding="utf-8") as f:
            f.write(review_content)
        with open(menu_file_name, 'w', encoding="utf-8") as f:
            f.write(menu_content)

if __name__ == '__main__':
    #사용 예시
    crawler = Crawler()
    generator = SeedGenerator()
    crawler.execute(generator, 'KOREAN', '137557009', '532875978') #먹깨비김밥
    crawler.execute(generator, 'KOREAN', '36827045', '22282335') #봉수육
    crawler.execute(generator, 'KOREAN', '1048385575', '824423309') #모수밀면
    crawler.execute(generator, 'KOREAN', '11701094', '11823509') #본찌돈가스
    crawler.execute(generator, 'JAPANESE', '37620144', '1224099552') #미가라멘
    crawler.execute(generator, 'ASIAN', '36988941', '21540583') #쟈스민
    generator.generate_db_seed_files()










