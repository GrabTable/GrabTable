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
        self.naver_avg_rating = 0
        self.kakao_avg_rating = 0
    

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
        self.place_name = response['basicInfo']['placenamefull']
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

    def generate_db_seed_file(self, store_id, review_start_id):
        store_query = f"""
        INSERT INTO STORE (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url, category, status)
        VALUES ({store_id}, NULL, NULL, NULL, NULL, '{self.place_name}', NULL, 'KOREAN', 'VALID');
        """

        review_queries = []
        for review in self.naver_reviews:
            review_queries.append(f"""
            INSERT INTO REVIEW (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
            VALUES ({review_start_id}, NULL, NULL, '{review['content']}', NULL, {store_id}, NULL, 'NAVER', 'VALID');
            """)
            review_start_id += 1
        for review in self.kakao_reviews:
            review_queries.append(f"""
            INSERT INTO REVIEW (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
            VALUES ({review_start_id}, NULL, NULL, '{review['content']}', {review['rating']}, {store_id}, NULL, 'KAKAO', 'VALID');
            """)
            review_start_id += 1

        seed_content = store_query + '\n'.join(review_queries)
        print(len(seed_content))
        file_name = f'{self.place_name}.sql'
        with open(file_name, 'w', encoding="utf-8") as f:
            f.write(seed_content)


if __name__ == '__main__':
    #사용 예시
    crawler = Crawler()
    crawler.fetch_naver_reviews('137557009')
    print("Fetched Naver Reviews")
    crawler.fetch_kakao_reviews('532875978')
    print("Fetched Kakao Reviews")
    crawler.generate_db_seed_file(3, 621)










