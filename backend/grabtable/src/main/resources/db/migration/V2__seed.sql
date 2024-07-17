INSERT INTO users (id, created_at, last_modified_at, social_login_id, username, password, email, phone,
                   profile_image_url)
VALUES (1, NULL, NULL, '123', 'testuser#123', NULL, 'test@gmail.com', '01011111111',
        'http://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R640x640');

INSERT INTO users (id, created_at, last_modified_at, social_login_id, username, password, email, phone,
                   profile_image_url)
VALUES (2, NULL, NULL, '1234', 'testuser2#1234', NULL, 'test2@gmail.com', '01011111111',
        'http://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R640x640');

INSERT INTO users (id, created_at, last_modified_at, social_login_id, username, password, email, phone,
                   profile_image_url)
VALUES (3, NULL, NULL, '124', 'testuser3#124', NULL, 'test3@gmail.com', '01011111111',
        'http://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R640x640');


INSERT INTO store (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url,
                   category, status, latitude, longitude)
VALUES (1, NULL, NULL, '경기 수원시 장안구 서부로 2129-1', NULL, '031-293-3369', '먹깨비김밥',
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w250&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20170116_64%2F1484534222608mtU3F_JPEG%2F186066516722_0.jpg',
        'KOREAN', 'VALID', '37.2987099', '126.9713822');


INSERT INTO store (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url,
                   category, status, latitude, longitude)
VALUES (2, NULL, NULL, '경기 수원시 장안구 율전로108번길 11 1층', NULL, '0507-1460-0903', '봉수육',
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w250&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F%2F20170607_114%2F1496834895537QbEYi_JPEG%2FIMG_0230.JPG',
        'KOREAN', 'VALID', '37.2989374', '126.9699545');


INSERT INTO store (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url,
                   category, status, latitude, longitude)
VALUES (3, NULL, NULL, '경기 수원시 장안구 율전로107번길 5 해생빌딩 1층', NULL, '031-278-7978', '모수밀면',
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w250&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190413_43%2F1555089469003VU8pB_JPEG%2Fv0TDKciSBFbadH2jiM0pb3LE.jpg',
        'KOREAN', 'VALID', '37.2989049', '126.968774');


INSERT INTO store (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url,
                   category, status, latitude, longitude)
VALUES (4, NULL, NULL, '경기 수원시 장안구 서부로2106번길 22', NULL, '031-297-1001', '본찌돈까스 성대점',
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w250&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190130_16%2F1548826127514reaQ2_JPEG%2FaNFGeTi0PXFver8zzBr5slHC.jpeg.jpg',
        'KOREAN', 'VALID', '37.2972027', '126.971513');


INSERT INTO store (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url,
                   category, status, latitude, longitude)
VALUES (5, NULL, NULL, '경기 수원시 장안구 서부로2106번길 38-2 1층', NULL, '0507-1404-3375', '미가라멘 성대본점',
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w250&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240120_62%2F17057444905973g8av_JPEG%2FIMG_2633.jpeg',
        'JAPANESE', 'VALID', '37.2977479', '126.9719088');


INSERT INTO store (id, created_at, last_modified_at, address, description, phone, store_name, store_picture_url,
                   category, status, latitude, longitude)
VALUES (6, NULL, NULL, '경기 수원시 장안구 화산로213번길 9-3', NULL, '031-278-9886', '쟈스민',
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w250&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20170517_187%2F1494996538129zNUMG_JPEG%2F186467537877215_0.jpg',
        'ASIAN', 'VALID', '37.2992904', '126.9730366');

INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (1, NULL, NULL, '고기만두', NULL, 5000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (2, NULL, NULL, '김치만두', NULL, 5000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (3, NULL, NULL, '찹쌀순대', NULL, 4000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (4, NULL, NULL, '야채김밥', NULL, 2500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (5, NULL, NULL, '참치김밥', NULL, 3500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (6, NULL, NULL, '떡볶이 1인분', NULL, 1500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (7, NULL, NULL, '치즈김밥', NULL, 3000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (8, NULL, NULL, '김치주먹밥', NULL, 1500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (9, NULL, NULL, '참치주먹밥', NULL, 1500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (10, NULL, NULL, '핫도그', NULL, 1500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (11, NULL, NULL, '오뎅 1개', NULL, 500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (12, NULL, NULL, '튀김만두', NULL, 5500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (13, NULL, NULL, '모듬튀김 4개 (오징어/김말이/만두/야채/고구마)', NULL, 3000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (14, NULL, NULL, '새우튀김 3개', NULL, 3000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (15, NULL, NULL, '스팸치즈김밥', NULL, 3500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (16, NULL, NULL, '소고기김밥', NULL, 3500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (17, NULL, NULL, '땡초소고기김밥', NULL, 4000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (18, NULL, NULL, '치즈소고기김밥', NULL, 4000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (19, NULL, NULL, '치킨바', NULL, 2500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (20, NULL, NULL, '음료 355ml (콜라/사이다/환타)', NULL, 1500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (21, NULL, NULL, '식혜 900ml', NULL, 3500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (22, NULL, NULL, '떡볶이 1팩 포장', NULL, 3000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (23, NULL, NULL, '새우튀김 1개', NULL, 1000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (24, NULL, NULL, '야채핫바', NULL, 1500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (25, NULL, NULL, '고추핫바', NULL, 1500, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (26, NULL, NULL, '불고기소세지핫바', NULL, 2000, 1, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (27, NULL, NULL, '수육나베', NULL, 21000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (28, NULL, NULL, '고추말이', NULL, 12000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (29, NULL, NULL, '고추말이 (1/2)', NULL, 6000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (30, NULL, NULL, '수육', NULL, 14000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (31, NULL, NULL, '참이슬', NULL, 5000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (32, NULL, NULL, '처음처럼', NULL, 5000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (33, NULL, NULL, '진로', NULL, 5000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (34, NULL, NULL, '청하', NULL, 5500, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (35, NULL, NULL, '맥주 (카스,테라)', NULL, 5000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (36, NULL, NULL, '센노유메', NULL, 39000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (37, NULL, NULL, '마쯔리텐구', NULL, 32000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (38, NULL, NULL, '간바레오또상', NULL, 33000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (39, NULL, NULL, '마루', NULL, 32000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (40, NULL, NULL, '음료 (콜라,사이다)', NULL, 2000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (41, NULL, NULL, '도쿠리', NULL, 7000, 2, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (42, NULL, NULL, '물밀면', NULL, 9000, 3, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (43, NULL, NULL, '물곱배기', NULL, 11000, 3, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (44, NULL, NULL, '비빔밀면', NULL, 9500, 3, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (45, NULL, NULL, '비빔곱배기', NULL, 11500, 3, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (46, NULL, NULL, '고기만두 (8개)', NULL, 5500, 3, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (47, NULL, NULL, '김치만두 (8개)', NULL, 5500, 3, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (48, NULL, NULL, '음료수 (콜라,사이다)', NULL, 2000, 3, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (49, NULL, NULL, '돈까스', NULL, 9000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (50, NULL, NULL, '치킨까스', NULL, 9000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (51, NULL, NULL, '생선까스', NULL, 9000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (52, NULL, NULL, '콤비까스 (돈까스,치킨까스,생선까스 중 2가지 선택)', NULL, 10000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (53, NULL, NULL, '카레까스', NULL, 9500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (54, NULL, NULL, '치즈까스', NULL, 13000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (55, NULL, NULL, '카레라이스', NULL, 6500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (56, NULL, NULL, '돈까스덮밥', NULL, 8500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (57, NULL, NULL, '치킨까스덮밥', NULL, 8500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (58, NULL, NULL, '치킨돈까스덮밥', NULL, 9000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (59, NULL, NULL, '치즈돈까스덮밥', NULL, 9000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (60, NULL, NULL, '우동', NULL, 5500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (61, NULL, NULL, '메밀소바', NULL, 5500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (62, NULL, NULL, '치즈치킨까스덮밥', NULL, 9000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (63, NULL, NULL, '스페셜까스 (돈까스+치킨까스+생선까스)', NULL, 12000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (64, NULL, NULL, '우동정식 (우동+돈까스+공기밥)', NULL, 9000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (65, NULL, NULL, '메밀정식 (메밀소바+돈까스+공기밥)', NULL, 9500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (66, NULL, NULL, '우동 (소)', NULL, 2500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (67, NULL, NULL, '공기밥', NULL, 1000, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (68, NULL, NULL, '음료수', NULL, 1500, 4, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (69, NULL, NULL, '미가돈코츠라멘', NULL, 7500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (70, NULL, NULL, '정통돈코츠라멘', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (71, NULL, NULL, '쇼유라멘', NULL, 7500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (72, NULL, NULL, '미소라멘', NULL, 8500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (73, NULL, NULL, '카라미소라멘', NULL, 8500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (74, NULL, NULL, '시오버터라멘', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (75, NULL, NULL, '얼큰짬뽕', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (76, NULL, NULL, '나가사끼짬뽕', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (77, NULL, NULL, '냉라멘', NULL, 8500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (78, NULL, NULL, '냉모밀', NULL, 9000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (79, NULL, NULL, '규동', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (80, NULL, NULL, '규동 (특대)', NULL, 10000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (81, NULL, NULL, '차슈동', NULL, 7000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (82, NULL, NULL, '차슈동 (특대)', NULL, 9000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (83, NULL, NULL, '가츠동', NULL, 7500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (84, NULL, NULL, '가츠동 (특대)', NULL, 9500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (85, NULL, NULL, '에비동', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (86, NULL, NULL, '에비동 (특대)', NULL, 10000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (87, NULL, NULL, '치킨가라아게동', NULL, 7500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (88, NULL, NULL, '치킨가라아게동 (특대)', NULL, 9500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (89, NULL, NULL, '돈까스김치나베', NULL, 8500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (90, NULL, NULL, '사케동', NULL, 12000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (91, NULL, NULL, '치킨가라아게 (사이드)', NULL, 5000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (92, NULL, NULL, '오꼬노미야끼', NULL, 10000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (93, NULL, NULL, '감자고로케', NULL, 5000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (94, NULL, NULL, '새우튀김', NULL, 5000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (95, NULL, NULL, '얼큰짬뽕탕', NULL, 12000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (96, NULL, NULL, '나가사끼짬뽕탕', NULL, 12000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (97, NULL, NULL, '오뎅탕', NULL, 15000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (98, NULL, NULL, '우삼겹숙주볶음', NULL, 15000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (99, NULL, NULL, '오돌뼈볶음', NULL, 13000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (100, NULL, NULL, '불닭볶음', NULL, 13000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (101, NULL, NULL, '낙지볶음', NULL, 13000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (102, NULL, NULL, '치킨가라아게', NULL, 15000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (103, NULL, NULL, '새우튀김 (12P)', NULL, 12000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (104, NULL, NULL, '통문어가라아게', NULL, 15000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (105, NULL, NULL, '생연어샐러드', NULL, 18000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (106, NULL, NULL, '타코와사비', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (107, NULL, NULL, '소주 (후레쉬/처음처럼/진로이즈백/새로)', NULL, 4500, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (108, NULL, NULL, '청하', NULL, 5000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (109, NULL, NULL, '병맥주 (카스)', NULL, 4000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (110, NULL, NULL, '병맥주 (테라)', NULL, 4000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (111, NULL, NULL, '병맥주 (아사히)', NULL, 6000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (112, NULL, NULL, '병맥주 (하이네켄 실버)', NULL, 6000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (113, NULL, NULL, '생맥주 (카스)', NULL, 4000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (114, NULL, NULL, '생맥주 (에델바이스)', NULL, 6000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (115, NULL, NULL, '하이네켄', NULL, 5000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (116, NULL, NULL, '도쿠리 (냉/온)', NULL, 8000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (117, NULL, NULL, '잔술사케 (냉/온)', NULL, 5000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (118, NULL, NULL, '짐빔하이볼', NULL, 7000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (119, NULL, NULL, '준마이팩', NULL, 30000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (120, NULL, NULL, '준마이 750', NULL, 30000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (121, NULL, NULL, '간바레오또상', NULL, 32000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (122, NULL, NULL, '준마이다이긴죠', NULL, 65000, 5, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (123, NULL, NULL, '월남쌈 (2인 세트)', NULL, 24000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (124, NULL, NULL, '월남쌈 (3인 세트)', NULL, 36000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (125, NULL, NULL, '월남쌈 (4인 세트)', NULL, 48000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (126, NULL, NULL, '월남쌈 (5인 세트)', NULL, 60000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (127, NULL, NULL, '월남쌈 (2인) (포장)', NULL, 18000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (128, NULL, NULL, '월남쌈 (3인) (포장)', NULL, 27000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (129, NULL, NULL, '월남쌈 (4인) (포장)', NULL, 36000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (130, NULL, NULL, '월남쌈 (5인) (포장)', NULL, 45000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (131, NULL, NULL, '사이다', NULL, 2000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (132, NULL, NULL, '콜라', NULL, 2000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (133, NULL, NULL, '고기추가', NULL, 4000, 6, 'VALID');


INSERT INTO menu (id, created_at, last_modified_at, menu_name, menu_picture_url, price, store_id, status)
VALUES (134, NULL, NULL, '야채추가', NULL, 8000, 6, 'VALID');

INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (2, NULL, NULL, '저렴하고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (3, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (4, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (5, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (6, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (7, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (8, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (9, NULL, NULL, '가성비가 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (10, NULL, NULL, '김밥 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (11, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (12, NULL, NULL, '아침 시간에도 김밥 빨리 만들어주시고, 타 분식집 대비 김밥 저렴하고 맛있어요 :)', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (13, NULL, NULL, '맛은있는데.... 참....', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (14, NULL, NULL, '여기 맛은있는데 좀 네가지없음 ㅋㅋ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (15, NULL, NULL, '저렴해서 좋아요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (16, NULL, NULL, '엄청 친절하시고, 가격도 타 분식집에 비해 저렴합니다👍 출근시간대에도 사람들이 꽤 있었는데, 김밥 포장 빨라서 좋았어요 :)', NULL, 1, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (17, NULL, NULL, '떡볶이 순대 조합 배부르고 맛있어요!
저렴하고 수원페이도 되네요!
안에는 서서 먹을수 있도록 되어있는데 깔끔해요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (18, NULL, NULL, '김밥이 정말 맛잇어요 가격이 너무 쌉니다 오뎅도 맛잇어요 재방문의사100%입니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (19, NULL, NULL, '성대역 2출 앞 율전동 분식집. 먹깨비김밥 저렴한 가격에 분식 먹을 수 있고 떡볶이 포장은 2인분부터 가능하다 하나도 안 매움 (신
라면의 반의반??) 의외로 참치 주먹밥이 실함 👍🏻 앉아서 먹을공간 없이 실외 3-4 실내 6-7명 정도 서서 먹을 공간 있음 지역화폐
가능!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (20, NULL, NULL, '싸고 맛있네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (21, NULL, NULL, '김밥 떡볶이 순대 어묵 포장주문', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (22, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (23, NULL, NULL, '김밥 맛집입니다
속도 알차게 꽉꽉 채워 넣었네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (24, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (25, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (26, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (27, NULL, NULL, '여기 ㄴㄴ 별로!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (28, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (29, NULL, NULL, '우리동네 싸게 맛있는 집 24시간 영업이라 언제든 먹을수 있어 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (30, NULL, NULL, '가끔 생각이 나서 사먹어요 중독성있는 떡볶이와 순대가 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (31, NULL, NULL, '여러분 여기 만두 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (32, NULL, NULL, '싸고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (33, NULL, NULL, '가성비 굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (34, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (35, NULL, NULL, '우리 엄마는 여기 김밥을 그렇게 좋아하시네요. 엄마 취향저격!! 가격도 착하고 맛도 좋다고.. 아이들 줄 핫도그도 사고 만원의 쇼핑!', NULL, 1, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (36, NULL, NULL, '참치김밥이 특히 맛잇어요
가격이 싸요
가성비가 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (37, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (38, NULL, NULL, '주차가 조금 힘들지만 만두는 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (39, NULL, NULL, '가격이 또 500원씩 올랐네요ㅜ 넘 비싸요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (40, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (41, NULL, NULL, '가격이 저렴해서 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (42, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (43, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (44, NULL, NULL, '위생이 좀 그렇네요.
아무렇지도 않게 손으로 포장음식 양념 닦으시고', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (45, NULL, NULL, '1500원 떡볶이 양도 1500원 맛도 1500원...500원정도 시세보다 싼듯 그냥 제값받고 맛있는데를 추천', NULL, 1, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (46, NULL, NULL, '맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (47, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (48, NULL, NULL, 'ㄱ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (49, NULL, NULL, '굳', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (50, NULL, NULL, '나만의 순대 맛집', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (51, NULL, NULL, '맛있네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (52, NULL, NULL, '맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (53, NULL, NULL, '율전동에 먹깨비김밥보다 가성비 좋고 맛있는 분식집이 있다면 나오보라고해.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (54, NULL, NULL, '그저그래요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (55, NULL, NULL, '음식도 맛있고 직원분들도 친절하십니다 튀김 포장시 튀김용 간장도 주시면 더 좋을것 같습니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (56, NULL, NULL, '가성비 최고', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (57, NULL, NULL, '먹깨비김밥 24시간한다니 한밤중에 오뎅 먹고 싶으면 여기로 와야겠어요. 김밥 가격도 저렴하네요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (58, NULL, NULL, '가격이 매우매우매우 착해요 20년 넘게 산 동네인데 첨 먹어본 집.. 앞으루 자주 애용할게요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (59, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (60, NULL, NULL, 'ㅡㅡ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (61, NULL, NULL, '새벽에 분식먹고싶을때 종종 이용하고 있어요 가성비최고입니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (62, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (63, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (64, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (65, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (66, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (67, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (68, NULL, NULL, '맛있어요 가성비 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (69, NULL, NULL, '조아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (70, NULL, NULL, '참치김밥 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (71, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (72, NULL, NULL, '자주방문합니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (73, NULL, NULL, '가격이 타 식당에 비해 저렴하고, 혼밥하기 좋아요! 분식 메뉴도 다양합니다👍👍', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (74, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (75, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (76, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (77, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (78, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (79, NULL, NULL, '저렴하고 맛있고', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (80, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (81, NULL, NULL, '좋아요. 가성비도 좋고 맛도 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (82, NULL, NULL, '좋아요^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (83, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (84, NULL, NULL, '싸고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (85, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (86, NULL, NULL, '어묵맛집!!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (87, NULL, NULL, '가성비 킹왕짱이면서도 맛 잃지 않는 곳 영원히 장사해주세요🥹🤤', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (88, NULL, NULL, '맛있고! 양이 엄청 많아요! 이렇게 많을줄 모르고 5500원어치 시켰는데 배불러서 조금 남겼어요 주먹밥 1500 순대 4000 주먹밥
하나로도 든든할 정도.. 번창하세욤', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (89, NULL, NULL, '맛있지만 양은 조긍 적어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (90, NULL, NULL, 'ㆍ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (91, NULL, NULL, '여기 매번 줄서있어서 가봤는데 맛있어요~~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (92, NULL, NULL, '김밥 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (93, NULL, NULL, '👍🏻', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (94, NULL, NULL, '참치김밥속에 들은 오이가 아삭하니 씹혀서 더 맛있어요.~^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (95, NULL, NULL, '올만에 순대 먹었어요!ㅎㅎ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (96, NULL, NULL, '그저그래요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (97, NULL, NULL, '친절해용', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (98, NULL, NULL, '자주 이용하는 김밥집이예요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (99, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (100, NULL, NULL, 'ok', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (101, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (102, NULL, NULL, '친절하시고, 24시간이라 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (103, NULL, NULL, '맛있고 가성비 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (104, NULL, NULL, 'ok', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (105, NULL, NULL, 'ㄱ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (106, NULL, NULL, 'ㆍ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (107, NULL, NULL, '성대 주변 분들이라면 누구나 아는 분식집 먹깨비 김밥~! 맛은 기본으로 맛있고, 가격도 저렴하고 24시간 연중무휴로 운영한다는 점
도 놀라운 장소에요. 총 만 원도 안 되는 7천 원으로 행복한 시간이었습니다.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (108, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (109, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (110, NULL, NULL, '좋아요~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (111, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (112, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (113, NULL, NULL, '맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (114, NULL, NULL, '분식은 무조건 여기죠! :)', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (115, NULL, NULL, 'ㅇ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (116, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (117, NULL, NULL, '김밥 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (118, NULL, NULL, '매번 맛있는 떡볶이, 튀김, 어묵 같이 먹으면 가성비 좋게 한 끼 식사 할 수 있어서 너무 좋아요^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (119, NULL, NULL, '먹깨비에서 떡볶이와 김밥/ 순대', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (120, NULL, NULL, 'ㆍ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (121, NULL, NULL, '맛 없어요. 튀김 딱딱하고 순대 식감 별로고 잡내 나요. 떡볶이도 텁텁, 떡 불어터짐. 가성비도 별로에요.', NULL, 1, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (122, NULL, NULL, '', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (123, NULL, NULL, '마싯다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (124, NULL, NULL, '친절하고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (125, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (126, NULL, NULL, '친절하시고 음식도 맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (127, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (128, NULL, NULL, '순대가 맛잇어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (129, NULL, NULL, '24시간 분식집이예요 가성비 갑입니다.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (130, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (131, NULL, NULL, '메뉴들 가성비도 율전동에서 제일 좋고, 갈 때마다 매번 사장님께서 너무 친절하셔서 더 기분 좋게 식사할 수 있는 것 같아요!
무엇보다 떡볶이가 추억의 맛인데 너무 맛있어서 자주 가고 포장도 종종 해요 :-)', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (132, NULL, NULL, '깔끔하고 지나다가 먹고가기 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (133, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (134, NULL, NULL, '저렴해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (135, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (136, NULL, NULL, '친절하고 가성비 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (137, NULL, NULL, '조아요 조아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (138, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (139, NULL, NULL,
        '김밥사러갔다가 막 나온 통통한 떡볶이 어떻게 참아요 못참아ㅋ일인분 먹고 갔네요 넘 맛있어요><친절하세요 참치김밥은 집에서 먹어봤는데 제 입맛에는 좀 짜네요 그래도 맛잇엇욧', NULL, 1,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (140, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (141, NULL, NULL,
        '처음에 여러 메뉴를 주문했는데 결제금액이 너무 적길래 메뉴 떡볶이 순대 만두 김밥 들어간거 맞냐고 물어봤더니 이모님이 순대가 결제 안됬다함 그래서 다시 결제하고 만두는 들어간거 맞냐고 물어봤더니 남자직원인지 사장인지가 하고있잖아요 라는식으로 말함 리뷰 보니까 불친절한 태도가 하루이틀이 아닌거같던데 그럴거면 손님 응대하지마세요;',
        NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (142, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (143, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (144, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (145, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (146, NULL, NULL, '집하고가깝고가성ㅂ 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (147, NULL, NULL, '정말 오랜만에 방문 김치 만두 맛이 여전하네요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (148, NULL, NULL, '순대가 맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (149, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (150, NULL, NULL, '가격도저렴하고 가성비좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (151, NULL, NULL, '가성비 있고 든든하게 먹기 좋아요. 길거리 포장마차를 재현한 듯 익숙하고 그리운 맛이에요. 저는 튀김이 제일 맛있더라구요!', NULL, 1, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (152, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (153, NULL, NULL, '가성비가좋고신선합니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (154, NULL, NULL, '친절하세요. 맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (155, NULL, NULL, '율전동 최고의 분식집 24시간이예요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (156, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (157, NULL, NULL, '굿~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (158, NULL, NULL, '가성비 굳', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (159, NULL, NULL, '자주갑니당 친절하고 맛있어요 간단분식먹기 좋아요~~~!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (160, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (161, NULL, NULL, '저렴하고 양많아요. 맛도 있고요. 푸짐하게 분식먹고 싶을 때마다 찾아갑니다!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (162, NULL, NULL, '김밥 맛있어요. 떡볶이보다 김밥을 더 맛있게 먹었습니다.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (163, NULL, NULL, '떡볶이 생각날때 가끔 포장해다 먹는곳이예요 떡볶이가 익숙한 맛인데 은근 중독성 있어요 순대에 포함된 간과 내장류도 신선해서 맛있어요', NULL, 1, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (164, NULL, NULL, '좋아요~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (165, NULL, NULL, '여기 참치김밥 찐이요.. 가성비도 가성빈데
참치 엄청 많이 넣어주심 !!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (166, NULL, NULL, '괜찮은 분식집.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (167, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (168, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (169, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (170, NULL, NULL, '맛있어요^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (171, NULL, NULL, '친절하고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (172, NULL, NULL, '깨끗 저렴 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (173, NULL, NULL, '가격대비 맛있고거리가가까워요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (174, NULL, NULL, '가격대비맛있고깔끔합니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (175, NULL, NULL, '맛있고 저렴해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (176, NULL, NULL, '저렴해요.맛도찮고요.저렴해서 그런지 친절하지는 않네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (177, NULL, NULL, '매번 갈때마다 친절하십니다 그리고 떡볶이랑 오징어튀김 너무 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (178, NULL, NULL, '떡볶이도 맛있지만 수제핫바 진짜 맛있어요!!!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (179, NULL, NULL, '저렴해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (180, NULL, NULL, '떡볶이랑 어묵맛있오요 가격도 저렴해서 너무좋아요!!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (181, NULL, NULL, '퇴근후 사람 많은곳~ 혼밥하기 좋아요 굿!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (182, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (183, NULL, NULL, '굿 👍', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (184, NULL, NULL, '매일먹어도 맛있어요!!!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (185, NULL, NULL, '맛나요ㆍ특히 만두는 최고ㆍ친절ㆍ청결 좋아요~^^♡', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (186, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (187, NULL, NULL, '가성비 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (188, NULL, NULL, '가성비 좋고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (189, NULL, NULL, '오뎅 가격이 착해요.ㅎㅎ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (190, NULL, NULL, '맛있지만 사장님이 너무 불친절해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (191, NULL, NULL, '분식 생각날때 종종 가는데 전반적으로 맛있는 편이에요. 종류별로 다 구매해도 금액부담없고 지역화폐도 되고요~', NULL, 1, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (192, NULL, NULL, '푸짐하고 맛도 좋아요~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (193, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (194, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (195, NULL, NULL, '맛은 그다지~별로였어요^^ 규모에 비해 직원은 많지만 불친절했어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (196, NULL, NULL, '김밥ㆍ만두. 짱 맛나요ㆍ친절하구 가격대비ㆍ양 많아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (197, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (198, NULL, NULL, '김밥이 너무 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (199, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (200, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (201, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (202, NULL, NULL, '김밥 요근처에서 젤 맛나요. 소고기김밥, 치즈김밥 맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (203, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (204, NULL, NULL, '김밥하고 오뎅 샀습니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (205, NULL, NULL, '김밥 왕 맛있어요~!
포장 주문하면 바로 말아주세요~~!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (206, NULL, NULL, '저렴하고 너무 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (207, NULL, NULL, '맛있어여', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (208, NULL, NULL, '맛있고 친절해요~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (209, NULL, NULL, '친절하고 밋있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (210, NULL, NULL, '먹깨비 분식에서 간단하게', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (211, NULL, NULL, '간만에 순대 떡복이 가성비좋고 맛도 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (212, NULL, NULL, '호', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (213, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (214, NULL, NULL, '오징어튀김 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (215, NULL, NULL, '싸고 맛있어요! 진짜 리얼 맛집!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (216, NULL, NULL, '가성비좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (217, NULL, NULL,
        '남자 사장인지 알바인지 싸갈쓰가 바갈쓰. 함께 일하시는 이모님들 손맛 아니면 절대 네버 안 먹어요 나이 한참 많은 주방 이모한테도 싸가지가 없네요. 사장님이시면 진짜 고쳐야할듯;;;;;;;;',
        NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (218, NULL, NULL, '참치김밥, 떡볶이, 순대, 어묵 자주 먹어요~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (219, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (220, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (221, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (222, NULL, NULL, '성대 근처 다니다 보면 한번씩은 다 가보는 곳', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (223, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (224, NULL, NULL, '좋아요bb', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (225, NULL, NULL, '차타고 25분 걸려도 일부러 포장하러 가게 되는 떡볶기.순대 맛집ㅎ~ 주차하기 불편해도 친절하시고 많이 주시고 맛있기까지 해서
굿!! 약간 메워도 순대 찍먹하니까 괜춘 항상 건강하세요~^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (226, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (227, NULL, NULL, '가성비좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (228, NULL, NULL, '맛있어요
가격도 착하고 재료도 신선해요
특히 순대가 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (229, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (230, NULL, NULL, '음식이 맛있었는데 오늘은 밥이 딱딱하고 너무짭니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (231, NULL, NULL, '오징어튀김 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (232, NULL, NULL, '자주 이용해요^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (233, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (234, NULL, NULL, '맛있고 친절해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (235, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (236, NULL, NULL, '저렴해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (237, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (238, NULL, NULL, '김밥 맛있어요
간만에 순대도 먹어봅니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (239, NULL, NULL, '뜨끈한 오뎅국물과 순대가 생각 날때 찾는 장소에요. 와이프는 퇴근길에 혼자서 간단하게 오뎅 몇개씩 집어 먹고 오는 장소 이기도
해요 혼밥하기도 좋고 순대도간도 참 맛있어요. 떡볶이도 즐겨 먹는데 이날은 피자를 미리 주문해서 패스 했어요. 분식을 좋아하는
분들에게 추천 드려요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (240, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (241, NULL, NULL, '떡볶이. 김밥. 맛있어요~~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (242, NULL, NULL, '졸아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (243, NULL, NULL, '순대가 젤 맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (244, NULL, NULL, '먹느라 사진을 제대로 못 찍었는데ㅠ 떡볶이 양 많고 있습니다! 맛이 밍밍할거라 생각했는데 일반적인 떡볶이 맛이에요🥰', NULL, 1, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (245, NULL, NULL, '김치만두 맛있어요~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (246, NULL, NULL, '순대 ₩4,000 떡볶이 ₩1,500 오징어튀김 (4개) ₩3,000 오뎅2개 ₩1,000', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (247, NULL, NULL, '떡볶이, 순대맛은 괜찮았고, 참치김밥 맛있어요 :) 튀김은 별로였어요ㅎㅎ 거의 다 포장 손님인 것 같아요! 일하시는 분들이 손님이
 몰릴 시간이라 정신없으셨는지 주문내용을 세 번이나 물어보신거 말고는 맛은 괜찮았어요~~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (248, NULL, NULL,
        '왠만한 어묵 다른곳은 다 700~1,000원으로 올랐는데 여기는 500원이에요! 서서먹기에 좋아요! 안에서 앉아서 먹을수도 있어요! 2,000원 이상부터 카드결제가 가능해요!', NULL, 1,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (249, NULL, NULL, '성균관대역쪽에 먹깨비 👍👍👍
양도많고 가격도 저렴하고 맛도좋고!
맛집하나 추가요~~~😘', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (250, NULL, NULL, '싸고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (251, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (252, NULL, NULL, '좋아요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (253, NULL, NULL, '분식 다양하고 가격,맛 다 좋아요
분식생각나면 여기서 포장', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (254, NULL, NULL, '맛 쏘쏘.
여러면에서 가성비 좋음.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (255, NULL, NULL, '존맛이예요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (256, NULL, NULL, '저녁 11시 반.. 막차 손님들일까 손딤들이 많았다 여기 소고기김밥 맛있어서 자주사먹는데 바빠서긍가 김밥 두줄은 옆구리가 터져있
고 급하게 싼 느낌이 맛에서도 느껴짐 운전중인 남편이 받아먹다가 “음 이게 맛있네~”한다 네줄다 소고기김밥 지금먹은건 안터진김
밥ㅋ 나도 안터진 김밥이 맛있다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (257, NULL, NULL, '오징어튀김이 식어도 바삭하고 맛있네요 방문할 때마다 직원분들 모두 친절하십니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (258, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (259, NULL, NULL, '싸고 맛있어요~~ 의자없이 서서 먹는곳', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (260, NULL, NULL, '순대 떡볶이 어묵 포장 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (261, NULL, NULL, '가격이 저렴하고 맛있어요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (262, NULL, NULL, '오뎅 사랑해!!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (263, NULL, NULL, '오뎅국물 존맛', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (264, NULL, NULL, '초등부터 노인까지 입맛에 맞구요. 가성비 좋고 포장깔끔해요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (265, NULL, NULL, '분식 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (266, NULL, NULL, '너무 맛있어서 사진 찍는 걸 깜빡했어요ㅠ
순대랑 내장도 많이 주시고 오징어 튀김도 빠삭하니 맛있고 떡뽁기도 맛있는데...어묵이 3개만 들어있어서 좀 아쉬움.다음에는 3개 더 담아달라 해야겠어요^^', NULL, 1, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (267, NULL, NULL, '떡볶이 랑 튀김 먹었어여,,', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (268, NULL, NULL, '순대 ₩4,000', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (269, NULL, NULL, '불친절', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (270, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (271, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (272, NULL, NULL, '매번 줄서있는지 알겠어요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (273, NULL, NULL, 'ㅇㅇ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (274, NULL, NULL, '순대에 땅콩이 들어간것 같아 그건 좀 별로입니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (275, NULL, NULL, '조아', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (276, NULL, NULL, '싸고 맵고 맛나다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (277, NULL, NULL, '조아', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (278, NULL, NULL, '음식맛나고 가성비좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (279, NULL, NULL, '가성비가 조아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (280, NULL, NULL, '조아', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (281, NULL, NULL, '가족들이 다 맛있게 먹었어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (282, NULL, NULL, '잘 다녀왔습니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (283, NULL, NULL, '끼니 떼우기 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (284, NULL, NULL, '소고기땡초김밥, 어묵, 순대 다맛있고 양많아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (285, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (286, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (287, NULL, NULL, '여기 맘에 들어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (288, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (289, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (290, NULL, NULL, '굿 가성비', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (291, NULL, NULL, '굳', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (292, NULL, NULL, '친절하고 맛있어요 떡볶이 양념잘베어있어서 맛나뇨', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (293, NULL, NULL, '조아', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (294, NULL, NULL, '야채김밥!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (295, NULL, NULL, '친절해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (296, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (297, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (298, NULL, NULL, '김밥 잘 말아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (299, NULL, NULL, '김밥 좋아요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (300, NULL, NULL, ',', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (301, NULL, NULL, '', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (302, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (303, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (304, NULL, NULL, '김밥 맛있네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (305, NULL, NULL, '싸고 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (306, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (307, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (308, NULL, NULL, '좋아요 :)', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (309, NULL, NULL, '김밥이 진짜 맛있어요 계속 생각나는 맛,,,', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (310, NULL, NULL, '가격도 맛도 너무 좋아요
왜 이제알았지', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (311, NULL, NULL, '맛있고 가격도 싸고 너무 좋음', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (312, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (313, NULL, NULL, '맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (314, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (315, NULL, NULL, '항상 친절하세요.
음식도 맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (316, NULL, NULL, '오뎅맛나요ㅎㅎ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (317, NULL, NULL, '굯', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (318, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (319, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (320, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (321, NULL, NULL, '조아', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (322, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (323, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (324, NULL, NULL, 'ㅇ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (325, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (326, NULL, NULL, '참치김밥 맛있어요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (327, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (328, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (329, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (330, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (331, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (332, NULL, NULL, '참치김밥 맛남', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (333, NULL, NULL, '맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (334, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (335, NULL, NULL, '굿굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (336, NULL, NULL, '가성비 진짜 좋아요. 떡볶이도 옛날에 먹던 그맛! 맛있어요 :)', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (337, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (338, NULL, NULL, '가볍게 분식먹기 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (339, NULL, NULL, '저렴하고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (340, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (341, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (342, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (343, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (344, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (345, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (346, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (347, NULL, NULL, '맛있어요~!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (348, NULL, NULL, '친절해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (349, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (350, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (351, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (352, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (353, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (354, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (355, NULL, NULL, '떡볶이 와 튀김 김밥이 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (356, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (357, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (358, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (359, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (360, NULL, NULL, '주변 김밥집중에 제일 맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (361, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (362, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (363, NULL, NULL, '맛있어용', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (364, NULL, NULL, '진짜 맛있게 잘먹었어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (365, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (366, NULL, NULL, '만두가 진짜 존맛', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (367, NULL, NULL, '자주가요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (368, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (369, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (370, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (371, NULL, NULL, '맛있고, 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (372, NULL, NULL, '맛있어서 자주가요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (373, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (374, NULL, NULL, '맛있고 가격도 착해요
새우튀김 머리부터 꼬리까지 튀겨주는데 바닷가 보다 맛나요~
순대도 다른데랑 좀 다르게 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (375, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (376, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (377, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (378, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (379, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (380, NULL, NULL, '......', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (381, NULL, NULL, '떡볶이 양이 적어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (382, NULL, NULL, '가성비 맛집 이라더니? 일단 양은 적은 편 이에요 맛은.. 떡볶이 진짜.. 아무맛도 안나는데 뭐가 맛있다는건지 의문 재방문의사 없어
요. 그리고 카드결제보단 현금 달라고 써있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (383, NULL, NULL, '가성비좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (384, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (385, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (386, NULL, NULL, '김밥 먹고싶어서 샀어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (387, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (388, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (389, NULL, NULL, '소고기김밥이 생각보다 맛있었어요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (390, NULL, NULL, '와 가성비 최강 가격대비 최고인듯
조금더 달라 했더니 엄청 친절히 주심^^
새해 맛집 발견', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (391, NULL, NULL, '순대맛집', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (392, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (393, NULL, NULL, '너무 맛있어여', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (394, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (395, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (396, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (397, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (398, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (399, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (400, NULL, NULL, 'ᆢ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (401, NULL, NULL, 'ᆢ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (402, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (403, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (404, NULL, NULL, '집에서 만든 김밥같아요.
맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (405, NULL, NULL, '맛있고 가격도좋아요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (406, NULL, NULL, '굿굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (407, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (408, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (409, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (410, NULL, NULL, '😊', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (411, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (412, NULL, NULL, '친절하시고 좋아요
참치김밥 종종 사먹는데 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (413, NULL, NULL, '친절하시고 즐거우시고~~~^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (414, NULL, NULL, '긋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (415, NULL, NULL, '자주 애용해요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (416, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (417, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (418, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (419, NULL, NULL, '떡볶이 맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (420, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (421, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (422, NULL, NULL, '가성비좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (423, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (424, NULL, NULL, '맛있어요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (425, NULL, NULL, '가성비 좋습니다.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (426, NULL, NULL, '친절해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (427, NULL, NULL, '이 근방 저렴 분식 최고존엄', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (428, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (429, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (430, NULL, NULL, '맛잇어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (431, NULL, NULL, '가성비 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (432, NULL, NULL, '가성비 짱', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (433, NULL, NULL, '그럭저럭 괜찮아요~ 떡볶이가 약간 시큼한 맛이나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (434, NULL, NULL, '굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (435, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (436, NULL, NULL, '김밥 맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (437, NULL, NULL, '맛있는 먹깨비김밥집 24시간이라 단체주문해서 새벽에 찾기도 좋았어요 집가까이 이런 곳있어서 좋아욥', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (438, NULL, NULL, '맛나요~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (439, NULL, NULL, '감칠맛이 안 느껴지는 떡볶이... 아쉽네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (440, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (441, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (442, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (443, NULL, NULL, '고추장맛나는 옛날 떡볶이랑 들어갈 건 다 들어있는 야채김밥 가성비 좋아요! 원래 시험기간에 밤새고 야식 먹으러 오는게 국룰이었
는데ㅠㅠㅠㅠ', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (444, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (445, NULL, NULL, '맛있어요~~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (446, NULL, NULL, '저렴저렴', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (447, NULL, NULL, '김밥, 만두, 순대, 튀김 14,000원
가성비 굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (448, NULL, NULL, '여기 맛있고 양도 풍성하고 항상 잘 먹고 있습니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (449, NULL, NULL, '떡볶이랑 순대가 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (450, NULL, NULL, '밤에는 안친절한분 계셔요 낮에만 갑니다', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (451, NULL, NULL, '양이 많네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (452, NULL, NULL, '좋', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (453, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (454, NULL, NULL, '믿고 먹는 가성비 좋은 분식집^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (455, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (456, NULL, NULL, '맛', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (457, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (458, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (459, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (460, NULL, NULL, '.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (461, NULL, NULL, '주먹밥 좋아요😍😍😍', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (462, NULL, NULL, '저렴!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (463, NULL, NULL, '가성비 최고에요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (464, NULL, NULL, '율전동대표 맛나여', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (465, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (466, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (467, NULL, NULL, '친절하고 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (468, NULL, NULL, '친절하고 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (469, NULL, NULL, '굿 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (470, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (471, NULL, NULL, '맛있는 먹깨비 김밥', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (472, NULL, NULL, '김밥 맛있네요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (473, NULL, NULL, '심야시간대는 별로네요.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (474, NULL, NULL, '순대가 엊그제 해놓으신건지..냄새가 너무 많이 나서 그냥 버렸어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (475, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (476, NULL, NULL, '좋아용 맛있어요 24시간이라', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (477, NULL, NULL, '김밥이 항상 신선해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (478, NULL, NULL, '좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (479, NULL, NULL, '완전 맛나고 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (480, NULL, NULL, '맛있고 친절해요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (481, NULL, NULL, '굿굿', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (482, NULL, NULL, '맛있습니다.', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (483, NULL, NULL, '가격은 저렴해요 버스기다리면서 먹기 좋은거 같아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (484, NULL, NULL, '전체적으로 다 맛있어요 삼각주먹밥은 애들이 좋아하고.. 만두 맛나요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (485, NULL, NULL, '언제나 맛있어요!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (486, NULL, NULL, '집나갔던 김치만두맛이 돌아왔어요 만두는
성대 먹깨비입니다..!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (487, NULL, NULL, '가성비 굿!!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (488, NULL, NULL, '가성비 좋아요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (489, NULL, NULL, '김치만두가 정말 정말 맛있어요! 최고입니다 최고의 만두맛집', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (490, NULL, NULL, '가격도 완전 저렴하고 맛있어요~!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (491, NULL, NULL, '떡볶이가 약간 맵긴한데.. 가격도 저렴하고 맛도 굿!!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (492, NULL, NULL, '언제나 맛나는 분식~^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (493, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (494, NULL, NULL, '떡볶이 김말이 만두 김밥 오뎅 순대 다 맛있음 핫도그도 맛있다고 함.
사장님 얼굴이 요일별/시간대별로 바뀌는데 밤시간대에 계시는 아나운서 김성주 닮은 사장님이 좀 기분파임.(나긋나긋한날 반/인사도안받는화난날반) 처음엔 진짜 빡쳤는데 이제는 적응되서 그러려니 합니다 껄껄 ㅋㅋㅋ 맛있고 싸니까요!',
        NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (495, NULL, NULL, '맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (496, NULL, NULL, '항상이용요 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (497, NULL, NULL, '떡볶이.튀김.오뎅 다 맛있어요', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (498, NULL, NULL, '매번맛있습니다.
주먹밥.떡볶이.매운오뎅까지 생겼네요^^', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (499, NULL, NULL, '먹깨비 좋아하는데 수원갈일있어서 먹었어요 ㅎㅎㅎ 역시 맛있습니다~', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (500, NULL, NULL, '수원 성균관대 근처 먹깨비 김밥 입니다. 떡복이 순대 김밥을 보고 그냥 지나칠 수 없겠죠? 서서 먹는 재미도 있고 포장해서 드셔되
요. 떡볶이 소스에 김밥과 순대를 찍어 먹는 센스! 고기만두도 맛있어요. 성균관대 분식 맛집은 바로 먹깨비 김밥!', NULL, 1, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (501, NULL, NULL, '맛있게 먹고 있었는데 오뎅국물에서 발견한 나방파리&hellip;ㅠㅠ', 2, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (502, NULL, NULL, '급할 때 가볍게 먹기 좋다
가성비가 모든 것을 이기지만
살짝 눈치 보인다', 3, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (503, NULL, NULL, '가격은 참한데 양은 더 적어진 기분이네요~ ', 5, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (504, NULL, NULL, '올때마다 너무 불친절해서 이제 다시는 안와야겠다고 다짐한다.
세번째 왔는데 밥먹으러 왔다가 셋다 기분 잡쳐서
돌아감.24시간 영업하는 거 제외하면 솔직히 그렇게 싼것도 아니고, 맛도 그냥 평범함.
떡볶이만 저렴함. 네X버 리뷰는 친절하다 양많다 하는데 양이 많은것도 아님. 남자사장은 장사하기 싫은 건지 맨날 열받은표정으로 퉁명스럽게 주문받고 손님한테 지시하듯이 이래라 저래라 하는게 한마디 하려다 겨우 참음. 장사의 기본 마인드자체가 없음.아무튼 다시는 안감. 별0개가없어서 1개준건데 1개도 아까움',
        1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (505, NULL, NULL, '안에서 뭐먹을지 고르고 있는데 대뜸 남자 사장이
&ldquo;주문 하세요&rdquo;이러시더라구여 무슨 깡패인줄 알았어요
성격이 원래 저러나 하고 넘기고
먹고나서 주방으로 달라해서 보는데 아무리 봐도 퇴식구가 없어서 만두찜 앞에 자리 있길래 놓았더니
안에 일하시는 아주머니가 &ldquo;주방에다 놔야죠&rdquo; 굉장히 거슬리는 말투로 말하시네요.
퇴식구를 따로 만들던가 왜이리 짜증섞인 말투로 말씀하시나요?
손님이 왕은 아니지만 서로간의 예의는 지키셔야죠.
할맥 옆에 수제 김말이 분식집 추천입니다 여러분', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (506, NULL, NULL, '이게 1만원어치입니다.
예전이랑다르게 양도 줄고 가격은올렸읍죠.
매장포장이었는데 사람이줄어든거보고 깜짝놀랐는데
그 이유를알겠더군요. 다른곳을 가시는걸 추천합니다', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (507, NULL, NULL, '장사할 마음이 없으신듯...
', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (508, NULL, NULL, '말도안되는 가격과 맛', 5, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (509, NULL, NULL, '진짜 서비스 최악.. 맛과 가격을 떠나서
남자 사장분때문에 절대 안 갈듯
가까운데에 성대 왕 김말이 있는데
훨씬 맛있고 싸고 친절하심', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (510, NULL, NULL, '', 4, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (511, NULL, NULL, '가끔 안 매운 떡볶이랑 오뎅이 땡길 때 가는 곳. 하도 별점테러한 후기들이 많아 후기 남김.
24시간 운영이라 안 매운 떡볶이 또는 오뎅이 땡길 때 먹으러 감. 튀김은 개인적으로는 오징어가 가장 맘에 들고 새우튀김은 껍질채 튀긴거라 극혐. 예전에는 5000-6000원으로 배부른 한끼 가능했지만, 지금은 가격이 올라 7-8천은 써야 배부르지만 요즘 500원 오뎅 찾아보기 힘드니 감사할 따름. 현금 잘 안 쓰지만 여기는 가게가 안 망하길 기원하는 마음에서 가급적이면 현금결제함. 퇴근 후 들러보면 학생 뿐만 아니라 나 같은 직딩들도 자주 보임.',
        4, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (512, NULL, NULL, '불친절
플라스틱주걱 상시 가열 중', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (513, NULL, NULL, '사장님 불친절하긴 한데 싼 가격에 이것저것 먹기 좋아요', 4, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (514, NULL, NULL,
        '십원짜리는 돈이 아닌가요? 정직하게 대한민국에서 유통되는 화폐로 가격에 맞춰지불했건만 우리는 십원짜리는 안받아요가 왠말인가요. 참나...그 십원으로 곤욕을 겪을수도 있음을 바로 아세요.', 1, 1,
        NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (515, NULL, NULL, '전에 싼맛으로 자주 포장해서 먹었는데 저녁에 계신 아재가 좀 불친절함. 대체 가능한 다른 분식집 있으니 여긴 안가려고 합니다.', 1, 1, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (516, NULL, NULL, '맛있는 순대랑 김밥
멋없는 사장님 서비스 정신', 4, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (517, NULL, NULL, '불어터진 떡볶이. 진심 이렇게 맛대가리 없는 떡볶이는 교회 달란트 행사 이후로 첨임.
대로변에 있고 항시 개방이라 가게안 구석구석 먼지도 장난 아님.. 현금유도 심함', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (518, NULL, NULL, '밋있어요', 5, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (519, NULL, NULL, '떡볶이는 그냥 그런데, 새우튀김이 유독 맛이 없네요. 겉은 바삭하지 않고, 속은 말도 못하게 질겼어요.', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (520, NULL, NULL, '불친절..', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (521, NULL, NULL, '아저씨 불진철 ', 3, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (522, NULL, NULL, '색깔이 빨간데에 비해 이렇게 떡에 양념이 하나도 안 밴 밍밍하고 싱거운 떡볶이는 태어나서 처음 먹어봤음
그리고 남자 사장님 불친절하고 서비스 정신이라는 게 보이지 않음
성대에 살면서 딱 한번 가봤고 이번을 마지막으로 재방문 의사 없음', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (523, NULL, NULL, '야간 조선족으로 보이는 아주머니 몰상식, 불친절', 1, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (524, NULL, NULL, '가격 싸고 맛도 평균 이상인듯. 개인적으로 좋아하는 스타일의 만두

단점은 밤에 일하는 남자분 엄청 불친절... 오뎅 얼마냐고 물어봤더니 정색하면서 뒤에 메뉴판 눈으로만 깔짝댐. 첨엔 원래 시크한 사람인가 했는데 오래 다녀보니 그냥 불친절한 사람임. 지금은 나도 그러려니 하지만 새로오는 손님들은 다 느낄듯',
        4, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (525, NULL, NULL, '가격이 맘에 듭니다
맛도 나쁘지 않습니다
.
.
.
이 가게 유일한 단점은
저녁때 일하시는 안경 쓴 사장님
불친절하다는 이야기가 많이 나옵니다
사장님 성격이 원래 그런 건 알겠지만
좀 웃으세요 웃으려고 노력하세요
다들 사장님 무서워서 불친절 해서 가기 싫대요
.
제가 2년 동안 다니면서
저한테는 물론 다른 분들에게도
사장님이 어서오세요 하는 이야기
거의 들어본 적 없습니다.
갈 때도 항상 제가 인사하고 갑니다
-수고하세요 많이 파세요-
무표정 뭐 드릴까요
무표정 카드 3,000원이하는 돼요
물론 저는 100% 현금으로 먹습니다
저뿐만 아니라 다른 손님 분들에게
웃는 거 한번 못 봤습니다
주변 분들에게 먹깨비김밥 추천 했는데
사장님 무서워서 가기 싫대요
-가격이 싸다고 서비스도 싸면 안 됩니다-
맛 가격 다 맘에 듭니다
하지만 싸기만하다고 손님이 오지는 않습니다
힘들더라도 사장님이 좀만 더 친절 했으면 좋겠습니다', 4, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (526, NULL, NULL, '맛이 제입맛에 별로였어요', 2, 1, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (527, NULL, NULL, '가볍게 한잔하기 너무 좋은곳', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (528, NULL, NULL, '드디어 와봤네요 !! 친구들이 오픈런 안하면 줄 서야한대서 일찍갔어요ㅎㅎ 3인분이고 수육 양은 꽤나 많아요
끓고나니 국물 칼칼하니 술 안주하기 딱 좋구요.
고추튀김도 맛있어요 :)', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (529, NULL, NULL, '가게 분위기도 좋고 음식도 맛있어요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (530, NULL, NULL, '맛있어요!! 방문한 당일 비도왔는데 앞에 4팀이나 있어서 한시간 정도 앞에서 대기하다가 들어갔네요 테이블링 캐치테이블 같이 카
페에서 대기할수 있도록 해주셨음 좋겠습니다 앞에서 대기해야만 먹을수있는게 불편하지만 그만큼 맛집입니다!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (531, NULL, NULL, '수육 야들야들하고 술도 술술들어가고, 성대 최고맛집이에요 ㅠㅠㅠㅠㅠㅠ 10년만에 와도 맛있어요..🧡 웨이팅이 긴게 단점이에요
ㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (532, NULL, NULL, '성대맛집 발견~ ☆', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (533, NULL, NULL, '오랜만에 먹었는데 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (534, NULL, NULL, '저녁 7시 넘었는데 대기가 10팀이 넘고. 40분 기다려서 먹을만 해요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (535, NULL, NULL, '맛있는데 대기 많아요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (536, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (537, NULL, NULL, '맛있었어요 수육이 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (538, NULL, NULL, '역시 여기 수육은 줄서서 먹을만 함', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (539, NULL, NULL, '맛집이라고 해서 기다려서 먹었는데
맛있네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (540, NULL, NULL, '늘 대기가 많아서 궁금했던 음식점인데 이 시간에가도 대기가 있더라구요 웨이팅걸어놓고 10분정도 있다 들어왔어요. 맛은 진짜 좋
았는데 맵찔이들한테는 살짝 난이도가 있네요😭 혹시 다음에 방문하게 된다면 덜 맵게가 가능한지 여쭤보려구요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (541, NULL, NULL,
        '율전 찐 맛집 봉수육❤️ 평일 6시 15분에 왔는데 50분 웨이팅했어요🥲 수육 2인 시키면 처음에 나베로 변경되어 나와요 (첫 주문시에만) 진짜 수육 잡내없이 살코기 비율 완벽하고... 국물도 얼큰한게 진짜 맛있습니다😋 주말, 평일 꼭 오픈런하세요👍🏻',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (542, NULL, NULL, '사람이 많아서 항상 포장해서 이용해요 ㅎㅎ
먹느라 사진을 못찍었는데 맛있어요 ㅎㅎ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (543, NULL, NULL, '포장해도 똑같이 맛나요...♥', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (544, NULL, NULL, '수육 레알 찐맛 전골에 소주가 술술', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (545, NULL, NULL, '고기 부드럽고 ~ 국물도 얼큰히고 밥도 맛있고 분위기까지 너무 좋습니다👍👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (546, NULL, NULL, '성대 졸업생한테 맛집 몇개 내놓으라고 해서 여기랑 양철통 옥집 세군데 추천받았어요 그래도 학생가니까 뭐 얼마나 맛있겠어 했는데 미친 짱맛이네요 완전 잘먹음', NULL,
        2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (547, NULL, NULL, '토요일 5시 10분에 갔다가 한시간 반정도 웨이팅했어요🥲 주차할곳도 없습니다🥹 하지만 진짜 맛있어요,,라면사리까지 꼭 드셔야
합이다😋 고추튀김 반개정도 시켜서 맛보는 것도 추천합니다😋💙', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (548, NULL, NULL, '맛있어요 맛있어요~
항상 웨이팅있는데 오늘은 대기 많이 없이 왔네요 ~!!!굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (549, NULL, NULL, '봉수육 믿고 먹어요~ 너무 맛있어요~~짱짱', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (550, NULL, NULL, '추운 날 최고', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (551, NULL, NULL, '정말 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (552, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (553, NULL, NULL, '예전에 진짜 맛있게 먹어서 웨이팅도 길게하고 먹었는데.
수육 냄새도 안나고 부드럽고 국물도 칼칼하고 좋았는데..그동네 사는 친구도 예전과 같지않다고 하길래 혹시나 하고 가봤는데..아쉽네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (554, NULL, NULL, '봉수육 부드럽고 맛있게 먹었습니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (555, NULL, NULL, '완전 맛돌이. 30분 대기하고도 먹을 맛.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (556, NULL, NULL, '왜 줄서서 먹는지 알겠어요...또갈거에요!!!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (557, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (558, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (559, NULL, NULL, '매번 웨이팅 하다가 드디어 오는데 역시는 역시네요..!
너무 맛있습니다🙃', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (560, NULL, NULL, '봉수육,, 오랜만에 웨이팅없어서 좋았어요🥹', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (561, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (562, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (563, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (564, NULL, NULL, '인생 수육 맛집입니다. 부드러운 고기에 시원칼칼한 나베 국물까지! 고추튀김도 갓 튀겨 나오니까 정말 맛있게 먹었어요!', NULL, 2, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (565, NULL, NULL, '고기가 냄새 없고 부드러워요
친절해요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (566, NULL, NULL, '고기 완전 야들야들 입에 넣자마자 녹아요 고추튀김은 밀가루맛이 좀 느껴졌지만 매콤하니 양도 많고 맛있었어요 진짜 봉수육은 사
랑입니다ㅠㅠ💙', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (567, NULL, NULL, '포장해서 먹었는데 맛있네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (568, NULL, NULL, '수육이 부드럽고 맛있어요
평일이지만 거의 50분 웨이팅했어요 ㅜ
식사시간보다 좀 일찍 가는거 추천', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (569, NULL, NULL, '봉수육나베♥️🩷♥️🩷', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (570, NULL, NULL, '한 시간 조금 넘게 웨이팅하고 들어갔습니다.
여유롭게 오시거나 사람 빠지고 2차로 오시면 될 것 같아요.
수육은 기다린 시간이 아깝지 않게 정말 맛있었어요!! 고추튀김도 나쁘지 않습니다.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (571, NULL, NULL, '고기가 부드럽고 맛있어요.
김치랑 고기랑 싸먹으니 더 맛있네요.
라면사리는 덤으로 먹으니 양도 많고 양껏 먹고왔어요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (572, NULL, NULL, '웨이팅있지만 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (573, NULL, NULL, '앱을 활용한 대기를 하면 더 좋을거 같아요~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (574, NULL, NULL, '👍🏻', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (575, NULL, NULL, '수육나베에 청양고추 두개 썰어넣으니 더 맛나요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (576, NULL, NULL,
        '성대역에 오는 이유. 봉수육. 고기의 부드러움은 날마다 약간의 복불복이 있음. 그러나 맛있다. 웨이팅이 너무 길어서 힘들다 ㅠ.ㅜ 보통 술과 먹기 때문에 갈때마다 기본 웨이팅은 40분 이상.',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (577, NULL, NULL, '된장베이스의 봉수육 다먹고 라면사리도 꼭 드세요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (578, NULL, NULL, '맛있게 잘 먹었습니다 ㅎㅎ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (579, NULL, NULL, '신랑이랑 둘이서 핫한 술집에서 데이트~~~ 너무 맛있어요~ 이른시간에도 만석~ 좀만 늦었더라도 기다려야했을것 같아요 술안주로
도 최고고 밥집으로도 최고예요^^', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (580, NULL, NULL, '맛도 좋고 분위기도 좋아요! 소주술술☺️👍🏼', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (581, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (582, NULL, NULL, '웨이팅해서 먹어본지가 진짜 오래됐는데 저녁시간이 겹쳐 2시간이나 웨이팅하고 먹엇네용 😅ㅋㅋㅋㅋ 수육이 아주 야들야들해서
맛있었구, 나베듀 아주 별미더라두요! 거기에 고추말이까지!!!! 아주 맛있게 먹구왔습니다!👍🏻 담엔 저녁피크시간은 피해서 가는걸
류~~~~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (583, NULL, NULL, '수육나베... 말모..👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (584, NULL, NULL, '수원 최강맛집이에요,, 국이 얼큰하고 야채도 푸짐해요!! 다 먹고나면 라면사리도 무료로 먹을수있으니 꼭 드세여! 토요일 4시 40분
쯤 갔는데 40분 이상 대기했습니다 ㅠ 하지만 그만한 가치있는 웨이팅이였어용👍😋', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (585, NULL, NULL, '포장했는데 담번엔 가서 먹어보겠슴당', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (586, NULL, NULL, '수육나벶와 고추 튀김은 그냥 근접불가 입니다.대박', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (587, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (588, NULL, NULL, '성대가면 꼭 먹는 봉수육 말안해도 추천', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (589, NULL, NULL, '알바분 불친절', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (590, NULL, NULL, '감사합니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (591, NULL, NULL, '고기가 부드러워요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (592, NULL, NULL, '들어가기 전부터 줄을서기 시작했네요. 잠시 기다리다가 들어가긴 했지만 먹을만 하네요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (593, NULL, NULL, '맛', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (594, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (595, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (596, NULL, NULL, '고기가 야들야들하고 ..육수가 술을 부르는 맛이라 육수 한입먹고 바로 이슬이 시켰습니다..구웃..', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (597, NULL, NULL, '수육나베 고추튀김 강추', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (598, NULL, NULL, '포장해서 집에서 먹었어요
직원분들 친절하시고 맛있어요~
밥보다는 완전 술안주에요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (599, NULL, NULL, 'ㅋ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (600, NULL, NULL, 'ㄹㅇ 존맛탱', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (601, NULL, NULL, '진짜 찐맛딥,, 포장했는데 라면사리 까먹고 안주심 ㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (602, NULL, NULL, '봉수육은 언제 먹어도 정말 최강인듯 합니다.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (603, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (604, NULL, NULL, '포장해서 먹어봤는데.. 매장에서 먹는게 훨씬 맛있네요ㅎㅎ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (605, NULL, NULL, '느무느무 맛있어요~~♡', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (606, NULL, NULL, '수육나베. 맛나요. 소주. 맥주안주 하기 다 좋아요. 단일 메뉴라 더 좋아요. ^^', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (607, NULL, NULL, '양도 푸짐하고 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (608, NULL, NULL, '국물이 뜨끈하고 음식 맛은 특별 하지도, 맛이 없지도 않지만 덩치 있으신 여자 알바생이신지 직원분이 주문할때마다 대답을 안 하시고 고개를 끄덕여서 좀 황당했어요;',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (609, NULL, NULL, '수육이 부드럽고 고추튀김은 바삭하고 너무 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (610, NULL, NULL, '역시 봉수육이니다. 나베 국물 시원하구요. 소주 마구들어 갑니다.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (611, NULL, NULL, '그냥 수육집이었음..', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (612, NULL, NULL, '수원사람은 다 아는 봉수육 소문대로 맛있어요 5시반에 갔는데도 5분이상 웨이팅할 정도로 이미 만석이었어요 6시 이후오시면 기본
1시간 이상 기다리셔야되니 일찍 미리오세요 수육은 말할것도 없고 고추튀김 진짜 맛있네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (613, NULL, NULL, '고기가 야들야들하고 비린내가 하나도 안납니다 웨이팅이 어마어마한데 기다림을 불사할만큼 맛집👍👍👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (614, NULL, NULL, '픽업도 대기시간이 길어요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (615, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (616, NULL, NULL, '맛은 있어요
2번째 방문인데 남직원이 굉장히 불친절해요
재방문 의사는 없습니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (617, NULL, NULL, '직원들의 불친절함이 너무 별로에요 바쁜건 알겠지만 손님도 웨이팅해서 들어간거고 돈내고 먹는건데도 더 있기 싫어서 얼른 나왔어
요 고기 자체는 맛있지만 맛에 비례하게 직원들의 서비스가 높아졌으면 좋겠네요 재방문의사는 없습니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (618, NULL, NULL, '또 먹을 맛집은 아닌데 맛은 있음. 시끄러움 외부음료 안된다하면서 옆테이블에는 외부음료 마시고 있음 라면은 무제한인데 육수만
주고 양념은 주지않아서 맛이 싱거워짐', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (619, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (620, NULL, NULL, '웨이팅이 길어서 진짜 힘들었지만, 한 입 먹는 순간 웨이팅 한 보람이 느껴짐👍🏻', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (621, NULL, NULL, '집에서 포장해다 먹어두 맛있었어요 🥺❤️
반찬 리필 안 되는 건 쩜 아쉽지만
명불허전', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (622, NULL, NULL, '맛집입니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (623, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (624, NULL, NULL, '고추튀김도 수육도 너무 맛있어요 :-)
1시간 웨이팅 보람 있는 맛집', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (625, NULL, NULL, '집에 포장해서 그릇째 보글바글 율전동맛 그대로 먹으면 되니 좋지 가성비는 가게 안에서 먹는게 더 좋은듯', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (626, NULL, NULL,
        '너무 맛있고 직원분들 늘 친절하신데 웨이팅 할 때마다 흡연자들 때문에 힘이듭니다 웨이팅 모여있는 사람들 쪽에서 흡연을 해서 냄새가 웨이팅 하는 의자로 다 와요 이것만 어떻게 해결해주시면 더 좋을것 같습니다',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (627, NULL, NULL, '👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (628, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (629, NULL, NULL, '너무 맛있어서 수육 찍는걸 깜빡했네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (630, NULL, NULL, '수육이 부드럽고 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (631, NULL, NULL, '왜 인기 많은지 알겠네요~ 고기도 맛있고 국물이 끝내줘요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (632, NULL, NULL, '덜덜 떨면서 기다렸지만,, 맛있으니까 가넝💝', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (633, NULL, NULL, '또가고싶은. 맛!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (634, NULL, NULL,
        '추위에 떨며 1시간 반을 기다린보람있는 맛집입니다. 부드러운 고기와 칼칼한 국물에 술이 술술들어가요 그리고 수제비사리에 라면사리 안넣었으면 후회했을뻔했는데 다행히 뒤늦게라도 넣어먹어서 배부르고 든든하게 먹고나왔습니다',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (635, NULL, NULL, '너무너무 맛있고 가성비 좋아요!!
웨이팅까지는 잘 모르겠네요😂', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (636, NULL, NULL, '오픈런 아니면 무조건 웨이팅! 기다릴가치가 있다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (637, NULL, NULL, '변했어 너... (3년 단골)', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (638, NULL, NULL, 'ㅎ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (639, NULL, NULL,
        '풍자가 수원에 다시 오면 또간집으로 여기 꼭 소개해주고 싶어요... 수원 2년 살면서 5번 밖에 못와봐서 죄송할 정도..😭🔥❤️ 수육 너무x1000 부드럽고 고추안좋아 하는 저도 이 집 고추말이는 사랑함여..🥹🫶🏻 데려오는 사람마다 맛있다고 해서 또 뿌듯한 그런 곳.. 메뉴 딱 3개.. 메뉴판 간결한 곳이 찐 맛집이잖아요.. 이집이 그래.. 오늘 갔는데 또 가고 싶어요.. 짱맛🤤',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (640, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (641, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (642, NULL, NULL, '수육 좐맛탱~~! 술이 술술 들어갑니다..♥️
평일에도 웨이팅있는 대박 맛집! 오픈 시간 맞춰서 가셔용', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (643, NULL, NULL,
        '직원분들의 손님 응대나 웨이팅 관리 요령 다시 배우셨음 합니다 추운 날씨에 밖에서 잠자코 기다리는데 테이블 제대로 치우시지도 않고 그렇다고 설명도 없고 겨우 기다려서 들어가니 제대로 뭐 가져다 주시지도 않고 서빙하시는거 힘드신건 아시겠는데 먹기 힘들고 불쾌하네요 맛은 괜찮았어요 근데 재방문 의사는 없습니다',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (644, NULL, NULL, '웨이팅 긴데 맛남', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (645, NULL, NULL, '👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (646, NULL, NULL, '봉수육은 몇 번을 와도 질리지가 않네요ㅠㅠ
너무 맛있고, 오픈하기 전부터 웨이팅 줄만 봐도 맛집이에요🥲👍🏻 조만간 또 갈 예정입니다🤍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (647, NULL, NULL, '가까이있았면 자주 갓을거에요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (648, NULL, NULL, '모임굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (649, NULL, NULL, '봉수육………….. 본점 미만 잡
하지만 겨울엔 웨이링 너무추워요……', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (650, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (651, NULL, NULL, '수육나베 미쳐써요ㅠㅍㅍㅍ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (652, NULL, NULL, '특별한 수육나베 넘', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (653, NULL, NULL, '나베로 되어 있어서 수육이 식지 않아 좋고
맛도 있고 나중에 라면사리까지 넣어서 먹으면
굿이에요~~👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (654, NULL, NULL, '수육2인분 주문 시 나베가 서비스로 나오니까 처음 방문하실때 기억하세요! 주말 저녁시간에 가서 웨이팅 1시간 정도했어요. 고추튀김 바삭하고 속도 맛있었어요', NULL,
        2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (655, NULL, NULL, '웨이팅이 너무 긴 거 때문에 재방문은 고민되지만 음식 너무 맛있어요 사람 너무 많이 오더라구요ㅠㅠㅠㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (656, NULL, NULL, '굳굳', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (657, NULL, NULL, '포장도 굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (658, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (659, NULL, NULL, '주문후 음식이 너무늦게나오고
웨이팅심하네요ㅜㅜ
회전율이 안좋은편ㅜㅜ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (660, NULL, NULL,
        '맛있어용 국문도 얼큰하고 약간 얼큰된장베이스 맛? 샤브샤브느낌도 나고 그런데 무조건 수육2인 시켜야될것같아요 그냥 수육전골?은 수육이 1인분양이라서 수육2인으로 유도 권유? 하시더라고요?? 이럴거면 그냥 기본을 2인으로 하고 2인 가격을 받으시는게..낚인기분이 좀 들어요ㅋㅋ',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (661, NULL, NULL, '평일 5시쯤 갔는데도 웨이팅은 있었어요 수육이 수육이지... 생각했는데 너무 맛있어요 곁들여진 반찬들이랑 같이 먹으면 환상이에
여 고추튀김도 맛있어요,,,', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (662, NULL, NULL, '항정살 수육 맛있어요!! 수육 아주 부드럽고 신김치 대박이네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (663, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (664, NULL, NULL, '이런 음식이 세상에 존재했다니..30년 헛살았네', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (665, NULL, NULL, '흐,,주변에 지인이 놀러올 때 무조건 소개하는 곳.언제 먹어도 맛이', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (666, NULL, NULL, '항상 잘 먹고 갑니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (667, NULL, NULL, '이번에도 한시간 대기해서 먹었어요.
그래도 맛있으니 큰일이네요..ㅎㅎ
대기없이 먹고싶어요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (668, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (669, NULL, NULL, '다른 곳에서 못 먹어본 새로운 메뉴! 맛도 좋고 플레이팅도 이뻐서 데이트하기 좋은 곳입니다!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (670, NULL, NULL, '한시간 반 기다려서 먹었어요. 맛있긴 하네요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (671, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (672, NULL, NULL, '진짜 맛있어요!
물에빠진 고기 안좋아하는데 봉수육은 매번 감동하고 가는 맛입니다ㅠㅠ
늦은시간에 가서 웨이팅없이 잘 먹고갑니다😉', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (673, NULL, NULL, '믿고 먹는 봉수육! 맛있어요~~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (674, NULL, NULL, '조아요?', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (675, NULL, NULL, '너무 맛나요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (676, NULL, NULL, '술먹기 아주 좋은맛입니당', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (677, NULL, NULL, '고추튀김 수육모두 맛남', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (678, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (679, NULL, NULL, '맛있음', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (680, NULL, NULL, '평일 한시간 웨이팅 하고 들어갔어요. 기다린 보람이있어요. 너무 맛있어요!!! 수육이 부들부들~국물도 끝내줬어요. 기본반찬도 맛있어요.', NULL, 2, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (681, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (682, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (683, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (684, NULL, NULL, '웨이팅이 있지만 존맛탱', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (685, NULL, NULL, '웨이팅이 진짜 한시간반이었지만 맜은 있었어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (686, NULL, NULL, '봉수육 너무 맛있어요.
수육 2인분 이상 시키면 나베가 공짜로 나옵니다!
웨이팅은 피할 수 없지만, 그걸 기다리더라도 먹어야해요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (687, NULL, NULL, '진짜 매일 가고 싶어요ㅠㅠㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (688, NULL, NULL, '너무맛있어서 깜짝놀랐어요
매장은 작아서 포장해서 먹으니 좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (689, NULL, NULL, '수육 진짜 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (690, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (691, NULL, NULL, '자주오는 동네 맛집', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (692, NULL, NULL, '맛있음', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (693, NULL, NULL,
        '4시반가서 웨이팅1시간하고들어갔어요. 중간에10팀있었는데 대기안하는팀들도많더라구요. 고기가 엄청부드러워서맛있어요. 국물도 너무시원하구요~ 근데 담엔 날씨좋을때아니면.. 포장해가서 먹을거같아요^^',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (694, NULL, NULL, '가브리살수육. 식감 좋아요. 고기 먹은 후 국물에 야채넣고 라면넣고~~!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (695, NULL, NULL,
        '진짜 맛있습니다 다른덴 잘 없는 메뉴라서 특별하구요! 근데 4시 5분 정도에 도착했는데 이미 자리 다 차있어서 밖에서 웨이팅 했는데 너무 더웠어요ㅠㅠㅋㅋㅋ 웨이팅 시스템 생기면 좋을 거 같아요!',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (696, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (697, NULL, NULL, '이건 먹는 중의 사진이라 이런데 아무튼 더 푸짐하고 2인 여성이 먹기에 살짝 넉넉하고 아주 좋음 맛집임', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (698, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (699, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (700, NULL, NULL, '더운날 웨이팅 자신없어서 포장해와서 먹었어요
정말 맛있네용😋', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (701, NULL, NULL, '4인 냄비가 넘작어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (702, NULL, NULL, '양이 줄어든 것 같아요 맛있습니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (703, NULL, NULL, '크흐..언제나 맛있는 봉슈육. 이거 먹고 취하고 이걸로 해장하고 싶은 맛', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (704, NULL, NULL, '아주부드럽고맛나요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (705, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (706, NULL, NULL, '소주안주 술마시는 사람들이 가기 좋은 곳 같습니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (707, NULL, NULL, '고기가 보들보들~~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (708, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (709, NULL, NULL, '고기 잡내없이 부드럽고 맛있어요. 고기가 기름기가 있는부위라 먹고난뒤 헤비하게 느껴지긴 했어요. 주말 저녁이긴하지만 대기가
어마어마해요 테이블도 많지 않은데다 . 술집이라 회전율이 떨어져요. 웨이팅할수있는 앱 시스템도 없어서 가게 앞에서 무작정 기다
려야해요. 참 오랜만에 무작정 기다렸네요. 1시간 좀 넘게 기다린듯해요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (710, NULL, NULL, '수육2인분 주문하면 나베를 서비스로 주세요
웨이팅이 길어서 포장주문해서 먹어보았는데 정말 맛있네요 ㅎㅎ 앞으로 자주 먹어야겠어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (711, NULL, NULL,
        '첫 사진은 6/11 방문이고 두번째 사진은 4/30 방문 사진 입니다. 수육이 1인분에 천원 올랐는데 고기 두께는 얇아지고 양도 적어지고 기름이 많은 부위가 나와서 아쉬웠습니다', NULL, 2,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (712, NULL, NULL, '맛있긴헌데 비싸요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (713, NULL, NULL, '수육 너무 부드럽고 맛있어용👍🥰', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (714, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (715, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (716, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (717, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (718, NULL, NULL, '포장으로먹어봣는데 너무맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (719, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (720, NULL, NULL, '수육으로 먹을때도 맛있고 나베로 끓여먹을때에도 너무 맛있어요!! 양념추가가 안되는것만 살짝 아쉬움..ㅎㅎ 재방문의사 있음!!', NULL, 2, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (721, NULL, NULL, '1시간 웨이팅해서 가봤어요!!
맛있게먹고갑니다~~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (722, NULL, NULL, '맛있어요 맛있어요 맛있어요!!!!!
수육도 맛있고 나베도 육수도 다 맛있습니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (723, NULL, NULL, '진심 존맛탱 ㅠㅠㅠㅠ 웨이팅길긴하지만 맛있어서 가요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (724, NULL, NULL, '수육이 부드럽고 맛있어요. 나베는 매콤해요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (725, NULL, NULL, '율전동 찐맛집👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (726, NULL, NULL,
        '파란옷 입은 여자 직원님 너무 친절하셨어요 핸드폰 두고 나온거 알고 얼른 뛰어가는데 그분도 뛰어서 가져오고 계시더라고요 계산 할때도 친절하시다 느꼈어요 그리고 밥 먹다가 중간에 술취한 남자가 들어와서 약간 분위기 험악해졌는데 어떤 여자 직원이 응대하면서 난처해 하는데도 남자직원 한명이 봤으면서도 바로 안 도와주던데 그건 좀 별로였어요',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (727, NULL, NULL, 'ㅎㅎ1시간30분 기다려서 먹었네요ㅎㅎ맛나요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (728, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (729, NULL, NULL, '조아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (730, NULL, NULL, '대기가 많아서 쉽게 먹을 수 없지만,
그럼에도 불구하고 기다려서 먹을만한 곳.
특히나 일하시는 모든 분들이 진짜진짜 친절하세요.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (731, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (732, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (733, NULL, NULL, '수육이 야들야들하고 평범한 삼겹살이 아닌 갈매기살이라는것이 이집의 매력
고추튀김이 매우 중독적 반개시켰다가 반개한번 더 시키는 맛
소주 잘들어갑니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (734, NULL, NULL, '웨이팅이 길어서 포장해서 먹었어요 ㅎㅎ 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (735, NULL, NULL, '엄청 맛있어요~양은 조금 적은듯 하기도 합니다~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (736, NULL, NULL, '넘 맛나요!!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (737, NULL, NULL, '맛잇어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (738, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (739, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (740, NULL, NULL, '굳', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (741, NULL, NULL, '수육을 좋아하지 않는데 고기가 엄청 부드럽고 맛있네요 전골과 수육의 조합이 너무 좋았어요 고추말이는 별미 입니다', NULL, 2, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (742, NULL, NULL, '미쳤어요…진짜 대존맛ㅜㅜ 한시간 반을 기다려도 아깝지 않을 맛!!!!! 가성비 갑에 소주가 홀짝홀짝 넘어가부려요', NULL, 2, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (743, NULL, NULL, '수육 맛있어요!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (744, NULL, NULL, '맛있고 가성비도 괜찮긴 한데 두시간 넘게 웨이팅해서 먹기엔ㅜㅜ두번은 어려울 것 같고 다음엔 포장해서 먹어야겠어용', NULL, 2, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (745, NULL, NULL, '수육도 너무 부드럽고 맛있어요❗️', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (746, NULL, NULL, '맛있어용', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (747, NULL, NULL, '너무너무맛있어요!!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (748, NULL, NULL, '좋아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (749, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (750, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (751, NULL, NULL, '맛있네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (752, NULL, NULL, '맛있어요 !
오픈시간대에도 사람이많네욤', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (753, NULL, NULL, '👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (754, NULL, NULL, '한입 먹어보자마자 알았습니다🙋🏻‍♀️
왜 이렇게 웨이팅이 많은지🤤', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (755, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (756, NULL, NULL, '포장', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (757, NULL, NULL, '몇년만에 다시 왔는데 언제 확장을 했는지 언제 또 이렇게 웨이팅이 더 많아졌는지 허허 수육맛집 👍🏻', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (758, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (759, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (760, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (761, NULL, NULL, '맛나요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (762, NULL, NULL, '웨이팅 긴 것 빼곤 정말 맛있어요 배달도 됐으면 ㅜㅜ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (763, NULL, NULL, '야들야들 넘 맛있어요 구욷👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (764, NULL, NULL, '맛은있는데 화장실이너무더러움..포장이나음', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (765, NULL, NULL, '항상 맛있게 먹어요 ㅎㅎ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (766, NULL, NULL, '수육나베 국물도 얼큰하니 맛있고
수육도 너무 맛있어요!
고추튀김은 특별한 맛은 아닌데 그래도 맛있어요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (767, NULL, NULL, '맛있어요!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (768, NULL, NULL, '맛있네...', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (769, NULL, NULL, '맛있어요 대기가 긴것만 빼면', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (770, NULL, NULL, '개존맛! 오픈시간 맞춰가서 줄 안 섰어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (771, NULL, NULL, '맛있어요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (772, NULL, NULL, '포장해와서 잘먹었어요 맛있어요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (773, NULL, NULL, '수육이 쫀득쫀득하고 진짜 맛있어요 ㅎ 이런 수육 첨 먹어보는듯 ㅎㅎ 국물도 살짝 매콤하니 진짜 좋았어요! 차 안가져갔으면 소주 2병은 마셨을듯 ㅎㅎ', NULL, 2,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (774, NULL, NULL, '너무 맛있어요~~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (775, NULL, NULL, '와이프 데리고 갔는데 맛있네요:) 처음엔 수육먹다가 살짝 칼칼한 나베 👍', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (776, NULL, NULL, '웨이팅 2시간..음식 나오는 모양이 예뻐서 줄이 긴 거 같아요 엄청 특이한 맛은 아닌데 수육 나베는 흔치 않아서 관심이 갔던 거 같아요', NULL, 2, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (777, NULL, NULL, '맛있어요~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (778, NULL, NULL, '여기 진짜 맛있어요 ㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (779, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (780, NULL, NULL, '맛나댜', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (781, NULL, NULL, '맛있고 특이했다 생각합니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (782, NULL, NULL, '정말 맛있어요❗️', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (783, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (784, NULL, NULL, '친절해용 1시간 반 기다렸는데도 맛있게 먹었습니다!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (785, NULL, NULL, '키크고 잘생긴 알바생 진짜 친절해요.. 친절한걸 넘어서 다정함….. 또가야지', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (786, NULL, NULL, '배 많이 고파서 3인분 시켰는데 2인분과 양 차이가 별로 없던것 같아 아쉬웠어요ㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (787, NULL, NULL, '맛집 맛집
맛집이라 웨이팅 좀 있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (788, NULL, NULL, '조아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (789, NULL, NULL, '맛잇어요~ 맛집인정', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (790, NULL, NULL,
        '수육 2인분 이상 시키면 나베로 되어서 나오는데 진짜 맛있어요!! 뭔가 어울릴까? 싶었는데 어울리고 맛나요!! 고기만 먹다 질리려나 싶을때 국물이랑 같이 먹으면👍🏻 다들 반주로 많이 드시던데 저희처럼 그냥 식사하러 가셔도 좋을 것 같습니다!!',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (791, NULL, NULL, '너무 맛있게 잘 먹었습니다:)
시그니처 메뉴도 있고 직원분들도 친절해요👍🏻', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (792, NULL, NULL, '맛있어요 ❤', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (793, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (794, NULL, NULL, '정말 맛있어요! 라면 사리 넣을때 김치랑 같이 나온 고추를 넣어도 존맛입니다
당면이 제일 맛있어요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (795, NULL, NULL, '키크고 잘생긴 알바생 진짜 친절해요.. 친절한걸 넘어서 다정함….. 또가야지', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (796, NULL, NULL, '배 많이 고파서 3인분 시켰는데 2인분과 양 차이가 별로 없던것 같아 아쉬웠어요ㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (797, NULL, NULL, '맛집 맛집
맛집이라 웨이팅 좀 있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (798, NULL, NULL, '조아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (799, NULL, NULL, '맛잇어요~ 맛집인정', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (800, NULL, NULL,
        '수육 2인분 이상 시키면 나베로 되어서 나오는데 진짜 맛있어요!! 뭔가 어울릴까? 싶었는데 어울리고 맛나요!! 고기만 먹다 질리려나 싶을때 국물이랑 같이 먹으면👍🏻 다들 반주로 많이 드시던데 저희처럼 그냥 식사하러 가셔도 좋을 것 같습니다!!',
        NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (801, NULL, NULL, '너무 맛있게 잘 먹었습니다:)
시그니처 메뉴도 있고 직원분들도 친절해요👍🏻', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (802, NULL, NULL, '맛있어요 ❤', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (803, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (804, NULL, NULL, '정말 맛있어요! 라면 사리 넣을때 김치랑 같이 나온 고추를 넣어도 존맛입니다
당면이 제일 맛있어요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (805, NULL, NULL, '궂', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (806, NULL, NULL, '늘맛있게잘먹고있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (807, NULL, NULL, '봉수육은 사랑입니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (808, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (809, NULL, NULL, '율전동 맛집이쥬~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (810, NULL, NULL, '짱맛있어요 계속 흥하길!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (811, NULL, NULL, '항상 갈때마다 정말 맛있게 먹고있습니다!
맛집 ㅜ 웨이팅 길어서 일찍 가서 먹었는데 역시.. 맛있어요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (812, NULL, NULL, '맛있네요 일찍 갔는데도 사람이 많아요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (813, NULL, NULL, '따끈한 국물에 정말 맛있는 수육나베입니다 ㅎㅎ
직원분들도 친절하시구 다 먹은 후에 라면사리까지 추가해서 먹었어요 배부르고 행복하게 먹고 갑니다 !', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (814, NULL, NULL, '굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (815, NULL, NULL, '다녀옴', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (816, NULL, NULL, '괜춘', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (817, NULL, NULL, '괜춘', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (818, NULL, NULL, '수육나베 맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (819, NULL, NULL, '맛있어요ㅠㅠㅠㅠㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (820, NULL, NULL, '사람들많은데에는 이유가 있네요 존맛탱', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (821, NULL, NULL, '맛있었는데 웨이팅이 너무 길어서 조금 힘들었음..
그냥밥집이 아니고 술을 파는곳이라 테이블 회전이 빠르진 않아요~ 그래도 수육나베는 부드럽고 맛있었습니당! 무료로 제공되는 라면사리 넣어서 마무리했어요 ㅋ 된장라면맛남ㅎ', NULL, 2, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (822, NULL, NULL, '너무 맛나요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (823, NULL, NULL, '존맛탱', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (824, NULL, NULL, '후 존맛탱.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (825, NULL, NULL, '친절했고 맛있었고 사장님께 꼭 5개주고싶다고 이야기했는데 이런 음식점은 더 잘되셨으면 하는 바람으로 리뷰를 남깁니다. 더욱
번창하세요 ^#^', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (826, NULL, NULL, '추운날씨에 정말정말 맛있게 먹었습니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (827, NULL, NULL, '맛있음', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (828, NULL, NULL, '줄서먹을만큼아니구 양도너무적다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (829, NULL, NULL, '맛있고 무난합니다 굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (830, NULL, NULL, '맛 웨이팅 심함ㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (831, NULL, NULL, '성균관대 맛집', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (832, NULL, NULL, '맛있음', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (833, NULL, NULL, 'ㆍ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (834, NULL, NULL, '맛있어요~ 고추튀김도 존맛탱! 수육도 부드러워요!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (835, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (836, NULL, NULL, '굳', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (837, NULL, NULL, '#수원맛집 #수원수육맛집 #성균관대맛집 #성대맛집 한 시간 기다린 보람이 있어요 진짜 맛있음 수육 밑반찬 고추튀김 다 맛있어요
!!! 게다가 가격도 부담스럽지 않음 혜자로운 곳ㅠㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (838, NULL, NULL, '완전 강츄!
수육국물 진짜 찐입니다!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (839, NULL, NULL, '굿굿', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (840, NULL, NULL, '너무 맛나요 또 갈거에요~ㅎㅎ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (841, NULL, NULL, '사람이 항상 많아서 한시간정도 기다렸다가 들어가서 먹었네요 ㅠㅠ', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (842, NULL, NULL, '웨이팅 진짜길다 운좋아야 빨리들어간다ㅠㅠ 여기 맛집이다 찐이다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (843, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (844, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (845, NULL, NULL, '수육 얇아서 야들야들하고 육수도 진허니 제 입맛입니다 명이나물이랑 신김치 무말랭이도 맛있어요 사람많아서 웨이팅 하는거빼고는 괜찮아요 찐맛집!', NULL, 2,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (846, NULL, NULL, '소주한잔 하기에 좋네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (847, NULL, NULL, '첫방문은 언제나 행벅합니다!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (848, NULL, NULL, '맛으로만 보면 정말 맛있어요! 그렇지만 2시간씩이나 기다릴 정도는 아닌 것 같아요. 평일같은 한가로운 시간대에 가는걸 추천드립니다.', NULL, 2, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (849, NULL, NULL, '.', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (850, NULL, NULL, '', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (851, NULL, NULL, '고기 잡내 안나고 야들야들 정말 맛있어요! 맛있어서 고기추가해서 먹었네요ㅎㅎ 수육2인분 이상이면 나베가 나오는데 나베는 좀 저
희 입맛에는 싱거웠어요~ 담엔 신김치 많이 달라해서 넣어서 먹으면 맛있을 것같아 그렇게 먹을려고요! 맛있게 잘 먹었습니당❤', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (852, NULL, NULL, '맛나요^^', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (853, NULL, NULL, '맛있어요.
대기시간이 길어서 단점이네요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (854, NULL, NULL, '존맛 율전동 맛집', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (855, NULL, NULL, '맛있어요', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (856, NULL, NULL, '한시간 대기하고 드디어 처음 먹어봤어요. 수육도 수육이지만 나베가 정말 맛있었어요.~ 수육에 같이 나오는 김치도 정말 맛있고 위
생상태 깔끔하고 줄서는 맛집답네요~', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (857, NULL, NULL, '봉수육 보기에도 푸짐하고 예쁜것이 먹기에도 너무좋아요
주차가 아쉽지만 푸짐해서 종종 갑니다
분위기는 학교앞이라서 약간 시끄러워요 그래도 놀만합니다', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (858, NULL, NULL, '수육정말맛있어요 2인시키면 나베국물로 나와요 고추말이 6000원/12000원 꼭 같이 시켜서 드셔보세요! 마무리는 무한라면으로
깔끔히 마무리!! 기본대기 30분이니 서두르세요!!', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (859, NULL, NULL, '수육존맛', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (860, NULL, NULL, '가브리수육', NULL, 2, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (861, NULL, NULL, '', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (862, NULL, NULL, '-양 : 둘이먹긴 적고 혼자먹긴 많은편
-맛 : 나베 국물이 의외로...소주 한병 비울정도. 과하지는 않게 MSG를 사용한듯한 맛.
-가격 : 수육 양은 많지 않은데 당면과 버섯이 좀 들어가서.... 이 정도면 SoSo함
-친절 : 직원은 친절하긴 한데... 서비스가.. 아르바이트 경험이 많지는 않은듯
-ETC : 평일 저녁에는 사람이 많아서 6시 이후 방문은 피해야함.
', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (863, NULL, NULL, '웨이팅하면서까지 먹을 맛은 아닌듯. 존맛이라길래 기대했는데 기대가 큰 만큼 그저그랬음', 3, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (864, NULL, NULL, '', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (865, NULL, NULL, '', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (866, NULL, NULL, '', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (867, NULL, NULL, '웨이팅이 길어서 먹기 쉽지는 않지만 맛은 정말 있었고 웨이팅만 길지 않으면 다시 와보고싶다.', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (868, NULL, NULL, '', 3, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (869, NULL, NULL, '수육 너무 맛있어요! 물론 웨이팅은 너무너무 길지만.. ㅎㅎ
첫주문시 수육2인분 주문하면 나베가 무료로 제공됩니다! ', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (870, NULL, NULL, '맛있는데 화장실은 개선필요해보임', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (871, NULL, NULL, '웨이팅이 30분을 넘어간다면 안 갈집
하지만 30분 이하라면..... 가볼만함', 3, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (872, NULL, NULL, '예전만큼의 맛집이 아님
유명세타고 체인점 내더니 맛이 변함
수육은 부드럽고 국물이 칼칼해서 괜찮지만 웨이팅해가면서만큼 먹을 맛은 아님
고추튀김은 해놓은지 오래된건지 기름많이 먹고 눅눅함
몇 없는 특색있는 성대맛집 중 하나였지만 흔한 술집이 되어버림', 2, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (873, NULL, NULL, '', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (874, NULL, NULL, '이젠 아는 사람 모르는 사람 다 아는 맛집
가게가 넓은 편이 아니라 웨이팅도 길고 시끄럽기도 하지만 맛있어서 다시 갈 수밖에 없는 맛집', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (875, NULL, NULL, '', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (876, NULL, NULL, '웨이팅 1시간 ㅋㅋ
이거 빼고 모두 만족!!!
깔끔하고 맛나고 젊은이들 기도 받고 일석 삼조
수육 나베 ', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (877, NULL, NULL, '맛있음 약간 시끄러워서 아쉬웠음', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (878, NULL, NULL, '', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (879, NULL, NULL, '수육나베 너무 맛있어서 자주 가요!
캠핑 갈 때 포장해가서 먹으면 진짜 맛있어요', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (880, NULL, NULL, '진짜 맛있는데 웨이팅 하기 너무 괴로워요,,
저번에 두시간도 해봄 ^^... 테이블링이나 예약제든 웨이팅 방법에 변화가 필요해뇨~', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (881, NULL, NULL, 'ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (882, NULL, NULL, '비오는날 한시간넘게 웨이팅하면서 짜증났었는데, 한입먹고서는
한시간만에 먹게해주셔서 감사합니다로 바뀌었다.
지점은 못따라오는 감동이 있다', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (883, NULL, NULL, '푸짐하고 국물안주로 너무 깔끔
웨이팅 두세팀 정도는 기다려서 먹을만함
', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (884, NULL, NULL, '맛있딩 ㅠㅠㅠㅠㅠ 포장도 퀄리티 좋네
______
재방문해서 고추튀김 시켰을때 반죽 그대로 있어서
컴플레인 걸었더니 잘라져있는 그 고추튀김을 걍 튀김기에 다시 넣어서 튀겨줌. 그 이후로 안감', 2, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (885, NULL, NULL, '', 3, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (886, NULL, NULL, '맛난데 고추튀김은 비추예요 느글해요 기름짐
수육3인분 시키면 저렇게 나베에 올려서 나와요 국물 칼칼하니 계속 들어가요', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (887, NULL, NULL, '', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (888, NULL, NULL, '5시 전에 방문 필수
고추튀김 2개가 6000원
고기 양 엄청 줄었네요. 기름도 더 많아졌어요.
고기 먹으러 가는 곳은 아니고 전골 국물 먹으러 가는 곳.
라면사리 무료이니 꼭 드세요.
사장 및 직원분들 엄청 불친절하지만 가끔 갑니다.
사실 일반 샤브집이 더 가성비 좋긴해요 ㅋㅋ', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (889, NULL, NULL, '맛있긴 한데 이 정도 웨이팅하면서 가긴 굳이..??', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (890, NULL, NULL, '수육 진짜 맛 좋아요', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (891, NULL, NULL, '맛있어여', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (892, NULL, NULL, '', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (893, NULL, NULL, '맛은 평범한 깔끔 수육맛이었지만 직원들 태도가 하나같이 불친절했습니다. 장사 좀 된다고 이래도 되는걸까요?수육 ', 2, 2, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (894, NULL, NULL, '집근처라 4~5번정도 방문. 맛은 있으나..
웨이팅 이정도 할집은 아닌거같아요ㅎㅎ
여기 직원분들 원룸앞에서 계속 담배피시는데 그손으로 서빙해준다고 생각하면 좀 찝찝합니다.', 3, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (895, NULL, NULL, '정말 맛있고 양도 많아요', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (896, NULL, NULL, '', 3, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (897, NULL, NULL, '이정도는 아님', 3, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (898, NULL, NULL, '', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (899, NULL, NULL, '2명이서 나베 2인분 배터지게 먹음
맛있다 ㅎㅎㅎ 술 안마시는데 술 땡기는 맛
', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (900, NULL, NULL,
        '여기 방송에 나왔나요?? 걍 동네 가계였는데 어느 순간부터 줄서있더라는..ㅜㅜ 정말 맛있어요 아 진짜 맛있습니다. 수육이 진짜 레시피 숨치고 싶을 정도로 맛있어요. 그렇지만 줄이 너어어무 길어요...ㅜㅜ 저라면 20분까지는 기다릴 수 있겠습니다.',
        5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (901, NULL, NULL, '와 진짜 맛있어요 직원분들도 매우매우 친절하십니다 어쩜 이렇게 맛있됴 묵은지 김치도 끝내주고 국물이 진짜 시원하고 맛있어요!!!', 5, 2, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (902, NULL, NULL, '2시간 10분 기다림 맛없으면 부숴버려야지 했는데
ㅈㄴ 맛있음 김치도 맛있고 국물도 맛있고 걍 안먹으면 후회할맛임 모르고 지나치면 인생의 1퍼정도는 낭비일듯', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (903, NULL, NULL, '리뷰 왜 높은지 모르겠음 ', 1, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (904, NULL, NULL, '존맛탱 웨이팅 30분 정돈 얼마든지 참을 수 잇어요', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (905, NULL, NULL, '마시써용~&gt;&lt; 양도 꽤 많고 술도 술술술 들어가요~ 고기가 짱 부드러워용 글고 라면사리 추가해 먹으니까 짱 꿀맛이에여!!', 5, 2, NULL,
        'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (906, NULL, NULL, '안주 맛 괜찮은 술집', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (907, NULL, NULL, '가성비 내리고 고기도 육수도 정말 맛있어요!
다만 회전율 너무 안습ㅠㅠㅠㅠㅠ 오픈하고 한시간 정도 지난 후에 갔습니다. 다섯 팀 대기라 금방 빠지겠지 하고 기다리는데,,, 웬걸 다먹은 나베에 육수 추가해 가며 계속 심폐소생술하는 테이블, 반찬에 술만 계속 추가해가며 먹는 칭구들... 기다린 게 있으니..란 생각으로 기다린 게 대략 한시간 반 정도...ㅜㅜ 저희 밥 다먹고 나갈때에도 앉아있더라구요... 다음엔..오픈 시간에 맞춰 가렵니다,,',
        5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (908, NULL, NULL, '진심존맛', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (909, NULL, NULL, '맛있음 자리가별로없음 가격은좀나감 양많음 웨이팅심함', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (910, NULL, NULL, '집앞식당인데 매일 사람들 줄서서 먹길래 맛이 궁금하지만 기다리기는 싫어서 포장했어요(포장을 매장에서만 받는게 조금 아쉽긴 해요) 포장깔끔하게 잘해주셔서 그릇에 옮길 필요 없이 바로 데워서 먹으니 편하네요~
수육 부드럽고 냄새 안나고 맛있는건 기본이고 양도 좀 적은거 아닌가 싶었는데 남편이랑 둘이 먹는데 배 엄청 불렀습다. 앞으로 자주 이용하게 될거 같아요~ 직원분도 너무 친절해서 더 좋았습니다. ', 5, 2,
        NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (911, NULL, NULL, '웨이팅이많지만 찐 존맛탱집,,', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (912, NULL, NULL, '양이 예전에비해 적어짐', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (913, NULL, NULL, '수육2인분 주문
수육나베가 고기1인분 기준이래요
테이블이많지않아 웨이팅이 길 때가 많아요
근데 또 둘보단 여럿가기에 좋아보이네요?
둘이 2인은 또 양이많고 애매

막걸린안팝니다', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (914, NULL, NULL, '', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (915, NULL, NULL, '맛있는데 양이 좀 적은거같아요?
맛있어서 웨이팅이 있어요', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (916, NULL, NULL, '', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (917, NULL, NULL, '방송국놈들때문에 기다리는 시간이 길어졌다. 소주맛집', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (918, NULL, NULL, '고기 자체는 나쁜건 아닌데
돼지 특유 냄새가 많이 났음
바빠서 냄새를 잡지 못한 상태로 상에 올린것 같음
가격은 그럭저럭 임', 1, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (919, NULL, NULL, '깔끔. 맛남.', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (920, NULL, NULL, '사장님도 훈남이고 고기도 너무 맛있었어요^^', 5, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (921, NULL, NULL, '', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (922, NULL, NULL, '푸짐한 양에 맛도 좋음', 4, 2, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (923, NULL, NULL, '진짜 너무 맛있고요, 진짜 너무 친절하시고요, 저 밀면 위에 정성스런 고명들을 보십시오. 진짜 밀면받고 숨이 멎을 듯 했습니다. 너
무 맛있고, 좋았습니다. 5월부터는 저녁에도 하신대요. 더욱 번창하시길.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (924, NULL, NULL, '육수가 자꾸 생각나요~ 굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (925, NULL, NULL, '만족도: 🌕🌕🌕🌕🌕(5) -> 율전에서 밀면은 모수밀면!!!!!최고에요…!!! 꺅 돌아왔네요 모수밀면의 계절이~~ 원랜 겨울에도 생
각났는데 드디어 다녀왔어요,, 자꾸만 생각나는 모수밀면 육수ㅠ 남자친구와 너무 행복해하며 먹었어요ㅎㅎㅎ♥️ 만두도 반반되어
서 또 행복했어요ㅎㅎ♥️ 항상 친절하게 맞아주시는 사장님도 너무 감사하구요! 또 방문할께요~! ㅎㅎㅎ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (926, NULL, NULL, '시원한 물밀면에 김치만두 고기만두 반반... 아주 환상의 조합이네요. 서빙해 주시는 사장님도 아주 친절하시고 인상도 너무 좋으셔
서.. 좋은 마음으로 건강한 음식 잘 먹고 갑니다. 저도 함께한 식구 들도 머두 만족했어요. 강력 추천 꾹~~~ 누르고 갑니다. 더욱 번
창하세요^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (927, NULL, NULL, '여자 사장님 굉장히 친절하심. 물밀면은 조미료 없이 자극적이지 않고 담백함. 육전과 오이채가 있고 남자사장님께서 상당히 데코에
신경 쓰는 게 눈에 보임! 만두도 반반으로 먹어봤는데 만두는 피가 얇은 게 특징. 가끔씩 땡길 때 한 번 와서 먹음 좋을 듯 합니다.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (928, NULL, NULL, '', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (929, NULL, NULL, '', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (930, NULL, NULL, '추워도 생각나는 이곳! 내 최애 밀면집. 부산에서 한번도 성공한적 없는 밀면.. 수원에서 찾았어요ㅋㅋㅋ 겨울철엔 15시까지만 영업
하셔서 아쉽.. 겨울메뉴 육개장 드시러오시는 분들도 많더라구요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (931, NULL, NULL, '밀면도 맛있고요
 육개장맛도 정말정말 맛있어요
깍뚜기도 굿!!!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (932, NULL, NULL, '밀면 만두 모두 맛있고 친절하세요!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (933, NULL, NULL, '잘 먹었습니다.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (934, NULL, NULL, '밀면 양도 많고 육수도 맛있어요!김치만두는 매콤해서 맛있게 먹었어요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (935, NULL, NULL, '깔끔한 밀면집입니다.
면이 나오기전 따끈한 육수도 너무 좋네요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (936, NULL, NULL, '친절하세요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (937, NULL, NULL, '맛있었읍니다.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (938, NULL, NULL, '맛 잇어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (939, NULL, NULL, '언제나 맛있는 밀면!! 여름에 시원해서 진짜 매일 1밀면 하고싶어요!! 하지만 피부가 면을 거부해서 슬퍼요 그렇지만 감수하고 먹습니다 존맛!', NULL, 3,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (940, NULL, NULL, '흔히 아는 밀면이 아니라 약간 냉면과 비슷한 면을 사용하네요.
맛있네요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (941, NULL, NULL,
        '갓수밀면… 애정합니다! 여름엔 빨리 안가면 못먹어요 다팔려서!! 다들 어서 튀어가십쇼!! 맵찔이신분은 물밀면 시키시고 맵대장 친구불러서 비빔시키라해 반반 나눠 드십쇼!', NULL, 3, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (942, NULL, NULL, '동네에 밀면집이 있다는걸 최근알았네요! 국물담백하고 너무맛있어요!! 양도 너무 많아서 배불리 먹었어요! 만두는 감자피인데~쫄깃담백하니 맛있어요^^', NULL, 3,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (943, NULL, NULL, '최애 밀면입니다! 주기적으로 가는 곳이에요ㅋ 비오는 날도 어김없이 찾아가게 되네요^^;; 오늘도 역시 맛있어요ㅠㅠㅠㅠ 먹는 내
내 행복했어요~~~♡ 놓칠수가 없네요ㅠㅠㅠ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (944, NULL, NULL, '맛있어서 여기 추천드리고 싶네요~ 친절해요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (945, NULL, NULL, '너무 맛있고 사장님들도 너무 친절하세요 !!! 간단하게 먹기 너무 좋구요 :) 더운 여름 입맛이 돋습니다 !!! 마감시간에 가서 간단하게
 밀면에만 집중해서 먹었는데 담에는 만두도 시켜먹을래여 🥟', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (946, NULL, NULL, '부산밀면보다 더 맛있네요 👍', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (947, NULL, NULL, '달달한 육수네요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (948, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (949, NULL, NULL, '모수밀면ㆍ만두 맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (950, NULL, NULL,
        '에정하는 율전동 밀면집! 육수도 진하고 최고입니다!! 여름에 냉면보다 전 밀면 사랑하는데 진짜 집주변에 있어서 넘 감사합니다!! 여름에 여기 후기만 겁나 올릴듯합니다!(오이안먹어서 사진에 오이없음)',
        NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (951, NULL, NULL, '더울때 슴슴하니 생각나는 물밀면, 매콤한 비빔 😋', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (952, NULL, NULL, '건강한 맛이예요. 물밀면 첫 숟갈의 신선함 비빔밀면 매운기도 적당하고 만두는 예술이었어요. 온육수에서 정성이 느껴지는 곳이네
요. 밀면집 오래되면 거의 후추맛만 나는데 모수밀면 사장님은 꼭 고집부려서 지금의 맛을 지켜내주시기 바라네요. 첫방문이지만 단
골예약합니다. 건강한 맛이 그리운 날이면 바로바로 찾아갈게요.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (953, NULL, NULL, '여릉 에 시원한ㅇ비빔밀면 맛있고요
육수도 짱입니다요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (954, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (955, NULL, NULL, '부산가려다가 수원에서 해결한 밀면
너무 친절해서 놀라는 친절맛집!!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (956, NULL, NULL, '냉면이랑~만두가 맛있어요~^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (957, NULL, NULL, '슴슴하니 맛이 깔끔하고 여사장님 엄청 친절하십니다^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (958, NULL, NULL, '굿~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (959, NULL, NULL, '비빔메밀 물메밀 만두 다 맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (960, NULL, NULL, '엄청 친절하시고 양많고 맛있어요!!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (961, NULL, NULL, '항상 변함없이 맛있어요~~
번창하세요~^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (962, NULL, NULL,
        '항상 맛있는 밀면집!! 금요일 6시에 갔는데 제가 마지막 남은 밀면을 손에 넣었습니다! 비빔은 맵찔이에게는 맵습니다! 본인이 맵찔이라면 물을 시키고 상대방에게 비빔을 시키도록 해 뺏어드시는걸 추천드려요',
        NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (963, NULL, NULL, '리뷰를 제일 많이 하는것 같아요
너무 자주가요ㅋㅋ
최애 맛집입니다ㅠㅠ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (964, NULL, NULL, '왜 인제 이곳을 알았나 싶네요. 맛있어요!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (965, NULL, NULL, '여름에는 먹으니 더 맛있아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (966, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (967, NULL, NULL, '물밀면 육수 한약맛이 은근 나면서 구수해요~ 더웠을때 먹어서 시원하고 맛있네요😋 만두피 쫄깃!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (968, NULL, NULL, '유쾌하신 사장님과 맛있는 비빔밀면 덕분에 행복한 식사 하고 왔네요.ㆍ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (969, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (970, NULL, NULL, '김치만두가 젤 맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (971, NULL, NULL, '만두맛이 좋아요. 비빔면에 단맛은 좀 덜 했으면 합니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (972, NULL, NULL, '존맛', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (973, NULL, NULL, '모수밀면이 시원하고 맛있어요
만두도 굿~~^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (974, NULL, NULL, '맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (975, NULL, NULL, '물밀면과 고기만두 먹었는데 일단 맛있습니다. 물밀면은 물냉면과 냉모밀의 중간 맛 같은 느낌. 고기만두는 얇은 피에 가득찬 속이
완전 만족입니다. 사실 맛을 떠나서 여자 사장님 너무나도 친절하셔서 기분 좋고 행복한 식사 시간이었어요. 다음에도 또 방문할 예
정입니다.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (976, NULL, NULL, '여름에 생각나는 맛집요~~^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (977, NULL, NULL, '친절해요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (978, NULL, NULL, '맛나요~ 사람 많아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (979, NULL, NULL, '만두도 맛있고 육개장도 맛있어서 먹다보니 사진이 다먹은 사진만....', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (980, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (981, NULL, NULL, '맛있어서 기절해요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (982, NULL, NULL, '나만알고싶은 맛집ㅋ오늘도 완국', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (983, NULL, NULL, '#율전동맛집 #성대역맛집 #모수밀면
너무맛있어요! 언제나 친절하시고
냉면하고는 또다른 밀면~ 구수합니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (984, NULL, NULL, '밀면도 깔끔해서 자주 가는 집인데, 계절메뉴로 육개장 시작해서 가봤어요. 육개장도 건더기 충실하고 맛있네요.', NULL, 3, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (985, NULL, NULL, '존맛탱구리 만두도 존맛탱', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (986, NULL, NULL, '맛있어요 친절하십니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (987, NULL, NULL, 'ㅇㅂㅇ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (988, NULL, NULL, '사진을 못찍었지만 너무 맛있게 잘 먹었어요 재방문의사100프로입니다 만두는 김치만두 고기만두 반반해서 먹었는데 쫄깃하고 속
은 꽉 차있고 맛있네요 주차공간 네대? 정도 되는것 같아요 평일 낮에는 엄청 널널하네요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (989, NULL, NULL, '오늘도 맛있게 잘 먹고 가요 :)', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (990, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (991, NULL, NULL, '깔끔하고 맛있네요.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (992, NULL, NULL, 'ㅇㅇ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (993, NULL, NULL, '깔끔해요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (994, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (995, NULL, NULL, '정말 추천하고픈 밀면집', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (996, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (997, NULL, NULL, '맛있어요 친절하시고요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (998, NULL, NULL, '비빔 물 둘다 먹었는데 물이 슴슴하니 더 맛있음 비빔은 사실 다른데서도 먹을수있을것같음ㅋㅋ 본연의 맛을 느끼기인 물이 더 좋은
듯!! 사이드로 시킨 고기만두도 꽤 맛있더라~ ** 추천 받아서 왔는데 또 올 예정! 😊', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (999, NULL, NULL, '친절하시고 맛도 좋아요^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1000, NULL, NULL, '사골과 한약재 들어간 육수가 진하고 좋네요.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1001, NULL, NULL, '곱빼기양 적절하고 사장님이 매우 친절하십니다. 진짜 맛있습니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1002, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1003, NULL, NULL, '맛있어요 굿굿!♡
직원분 친절해서 감동', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1004, NULL, NULL,
        '밀면 처음먹어본건데 냉면. 막국수 이런것보다 맛있어요 ㅋ 자극적이지않아서 먹고나서 속도 편하구요 . 더욱더 좋았던건 여사장님이신지 너무 친절하셔서 제기분까지 다 좋아지더라구요 !! 조만간 또 방문하겠습니다 ~',
        NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1005, NULL, NULL, '맛나요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1006, NULL, NULL, '살얼음도별로없고 뼈속까지 안시원 육수도간장맛만나고 면은안쫄깃함 그냥면발로배채우는느낌', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1007, NULL, NULL, '밀면도 맛있고 면은 고구마랑 메밀 섞어서 만들어 향도 좋고 적당히 탄력있네여ㅎ
만두는 감자피로 얇게 만들어서 맛있습니다
와이프는 비빔밀면 주문했는데 많이 맵지 않아 먹고 나서 편하다고 하네요ㅎㅎ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1008, NULL, NULL, '너무맛있어요 육수맛 깔끔해요

먹고싶으면 또갑니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1009, NULL, NULL, '맛있어요ㅎㅎ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1010, NULL, NULL, '맛있고, 면이 특히 맛있어요ㅎㅎ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1011, NULL, NULL, '처음 먹어봤는데, 면자체가 정말 맛있어요ㅎㅎ육수도 맛있고, 양도 적당하고 가격도 저렴하고 좋아요ㅎㅎ앞으로 종종 방문하게 될것같아요~', NULL, 3, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1012, NULL, NULL, '밀면 위에 얇은 육전이 올러가요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1013, NULL, NULL, '찐맛집 리스트에 있는
최애 맛집!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1014, NULL, NULL, '맛있고 친절합니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1015, NULL, NULL, '대접받고 온 느낌', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1016, NULL, NULL, '진짜 수도권살면서 밀면 성공한적 없었는데 드디어 정착하네요. 부산 사람데리고왔는데 국물까지 싹싹먹고 감동했어요. 이제 여름은 모수밀면이에요!!!!', NULL, 3,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1017, NULL, NULL, '밀면 맛있어요.
양이 많진 않네요.
친절해요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1018, NULL, NULL, '밀면 맛있네요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1019, NULL, NULL, '더워지면 생각날 맛이에요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1020, NULL, NULL, '물냉면이 자극적이 아니라 좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1021, NULL, NULL, '물밀면, 비빔밀면, 김치만두 모두 맛있어요^^ 밀면맛집이라 종종 방문해야겠네요:) 친절하시고 가격도 좋아서 단골각입니다^^', NULL, 3, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1022, NULL, NULL, '꿀꺽', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1023, NULL, NULL, '갈만해요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1024, NULL, NULL, '맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1025, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1026, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1027, NULL, NULL, '맛있어요 친절하십니다
밀면맛집 맛있고 깨끗한 친절한', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1028, NULL, NULL, '직원분들 세상 최고 친절하고 맛있어서 겨우 다먹었지만 곱빼기 양 진짜 많아요!!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1029, NULL, NULL, '멀리서 봐도 주방이 깔끔해보야서 너무 좋았고 주문과 동시에 면 뽑는 소리가 나서 너무 신기했어요!!! 여기 만두 맛있으니까 꼭 시키
세요 ㄹㅇ 진짜 여기 해장됩니다 ㅠ 온육수 제가 한통 다 먹고가는것같네요.. 사장님 번창하셔서 제발 서울로 와주세요..', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1030, NULL, NULL, '오다가다 자주 보았지만, 방문은 처음인데, 반했어요. 깔끔하고 깨끗한 맛입니다. 또 먹고 싶어지네요.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1031, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1032, NULL, NULL, '', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1033, NULL, NULL, '매장이 조금 좁긴한데 그만큼 사람이 많이찾아서 그렇고 넘 맛있네요
시원하고 맛있어요👍🏻', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1034, NULL, NULL, 'ㅇ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1035, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1036, NULL, NULL, '물밀면에 양념장 넣어서 먹으면 칼칼하니 국물이 더 맛있어요~ 그리고 매장 직원분이 친절하셔서 더 기분 좋게 식사하고 왔어요!', NULL, 3, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1037, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1038, NULL, NULL, '밀면', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1039, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1040, NULL, NULL, '가까이 있는거 알면서도 얼마전 지인 소개로 첨 갔는데 너무 친절하시고 맛도있어요 먹고나서도 소화가잘되서 넘 좋아요 저희 요즘
자주가는편입니다 가끔은포장도하구요 포장하구 집에와서 먹는데 퍼지지 않고 쫄깃한게 좋았어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1041, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1042, NULL, NULL, '엄청 친절하시고 맛있습니다!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1043, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1044, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1045, NULL, NULL, '여자 사장님 엄청 친절하시고 고기만두 맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1046, NULL, NULL,
        '10번도 더 갔을거에요. 일단 청결해서 좋구 사장님분들도 좋은 분들 같아 음식에 믿음이 가요. 진짜 로컬 맛집이에요. 더 잘 되셨으면 좋겠어서 후기 남깁니다. 슴슴달달 물밀면 짱맛~~', NULL,
        3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1047, NULL, NULL, '수원에서 맛보는 부산밀면의 맛! 면과 육수가 더 업글되어있어 맛있네요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1048, NULL, NULL, '맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1049, NULL, NULL, '맛있어요.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1050, NULL, NULL, '물밀면 곱빼기!!!!!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1051, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1052, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1053, NULL, NULL, '맛있어😋', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1054, NULL, NULL, '사장님 친절하시고, 매장깔끔하고, 물밀면이 가장 맛있는 곳입니다. 물밀면 육수맛이 특별합니다. 사발을 들고 들이마실 정도로 맛있어요. 율전동 맛집 인정!', NULL,
        3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1055, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1056, NULL, NULL, '밀면보두 냉면에 가까운 면빨이지만, 사장님이 음식을 연구하시는 느낌이 듭니다. 사빙하시는 분도 너무 친절하시고. 곱빼기는 양도 많아요!', NULL, 3, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1057, NULL, NULL, '비빔면에 고기만두 싸먹으면 대존맛탱입니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1058, NULL, NULL, '엄청 친절하시고 좋아요~~~!! 만두가 넘 쫄깃하고 맛나용', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1059, NULL, NULL, '늘 맛있어요 깔끔합니다!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1060, NULL, NULL, '친절하시고 맛있고. 고기만두도 굿~!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1061, NULL, NULL, '수도권 지방에서 보기 힘든 밀면 맛집
자세한 후기는 네이버에서 먹돈버를 검색하세요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1062, NULL, NULL,
        '이번 여름은 여기로 정착.. 밀세권이라 행복해요 ㅠㅠ 자극적인 육수일줄알고 비빔시켰는데, 친구꺼 물냉 뺏어먹으니 너무맛있어서 놀랐어요 ! 슴슴하고 감칠맛 대박입니다.. 일주일에 한번씩 들릴 맛집이예요 사장님도 엄청 친절하셔요 bb',
        NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1063, NULL, NULL, '', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1064, NULL, NULL, '굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1065, NULL, NULL, '육수 너무 맛있었어요! 만두도 맛있음!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1066, NULL, NULL, '좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1067, NULL, NULL, '만두가 10개에 5000원인데 싸고 맛있습니다.
밀면 맛은 평범합니다.
주인분은 친절합니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1068, NULL, NULL, '만두 물밀면 다 맛있네요.
서빙 보시는 분들도 너무 친절하고 다음에는 부모님 모시고 가고 싶네요.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1069, NULL, NULL, '육수 간이 세지 않고 양념도 맵지 않아서 맛있어요 양도 많아요!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1070, NULL, NULL, '시원하게 먹었어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1071, NULL, NULL, '너무 맛있어서 싹싹긁어 먹었다능~^^
👍👍👍👍👍
최최고 입니다~~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1072, NULL, NULL, '넘넘 좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1073, NULL, NULL, '깔끔하고 맛도 좋고 사장님 및 직원분들도 다 친절하셔서 만족스러운 식사를 하고 왔습니다.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1074, NULL, NULL, '모수 밀면 맛있네요~~^^ 비빔먹고 냉유수 말아먹었어요~~^^맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1075, NULL, NULL, '맛있네요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1076, NULL, NULL, '맛있어요~~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1077, NULL, NULL, '맛있어용ㅎ', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1078, NULL, NULL, '리뷰보고 갔습니다. 리뷰대로 친절하시고 맛있었습니다. 밀면은 기본만주셔서 양념이랑 식초등은 기호에 맞게 직접 간을해야하는 곳
입니다. 만두는 겉이 투명하고 쫄깃한 피를 쓰는 곳입니다 단점은 역시 주차네요..', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1079, NULL, NULL, '자극적이지 않고 맛있는 물밀면 국물 & 적당히 매콤달콤한 비빔밀면 굿굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1080, NULL, NULL, '여기 정말 찐 맛집...', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1081, NULL, NULL, '맛있어요 특히 물밀면~ 최고입니다
친절은 덤', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1082, NULL, NULL, '정말 맛있습니다. 사장님도 너무 친절하신데
비빔밀면 물밀면도 과하지않고 정말 맛있어요
강추강추 곱배기 양 많아서 남자들 먹기 너무 좋아욤', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1083, NULL, NULL, '입짧은 우리딸 한겨울에도 찾는 밀면 짱!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1084, NULL, NULL, '양념과 육전이 어울러진 모수밀면 너무 맛있어요 ~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1085, NULL, NULL, '비빔밀면이랑 만두 진짜맛있고 친절하심 물밀면은 그냥그냥', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1086, NULL, NULL, '', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1087, NULL, NULL, '가격도착하구요 맛도 잇구요 사장님 친절하시구요~
먹다말구 생각나서 리뷰써요~ㅎ
최고네요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1088, NULL, NULL, '단골 맛집이에요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1089, NULL, NULL, '밀면 정말 깔끔합니다. 주인분의 음식 연구하는 게 느껴집니다.', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1090, NULL, NULL, '깔끔하고 맛있어요
인테리어도 깔끔해요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1091, NULL, NULL, '비빔밀면..진짜 미친맛', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1092, NULL, NULL, '맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1093, NULL, NULL, '맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1094, NULL, NULL, '굿굿', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1095, NULL, NULL, '#율전동맛집 #성대역맛집 #모수밀면 더운여름 시원한 여름음식 먹으려고 일주일에 한번씩 꼭 가는 집예요~ 오늘은 포장해서 먹었
는데 면도 그대로 탱탱하고 육수 정말 맛있어요~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1096, NULL, NULL, '수원율전동 최애맛집
사장님 자부심 넘침
맛이 별이 다섯개', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1097, NULL, NULL, '밀면 맛있어요, 간만에 맛집 찾았어요 ^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1098, NULL, NULL, '가격대비 맛잇어요. MSG맛 안나고 양도 푸짐해서 저는 당분간 냉면밀면집 정착이요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1099, NULL, NULL, '맛있어요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1100, NULL, NULL, '#수원율전동
밀면 맛있음. 직원들 엄청 친절함. 위생적으로 보임. 오픈키친. 백종원에게 칭찬받을 느낌남. 비빔물면 양념이 미친거같음. 물밀면만 두 개 시킨 나를 매우 친다.', NULL, 3, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1101, NULL, NULL, '육수가 맛나요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1102, NULL, NULL, '친절하고, 좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1103, NULL, NULL, '양념이 자극적이지않고 괜찬았어요 다만 포장해가서 그런지 살짝 면이 아쉽네요 다음엔 매장에서 꼭 먹어봐야겠어요', NULL, 3, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1104, NULL, NULL, '육수가 아주 끝내줍니다', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1105, NULL, NULL, '동네맛집!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1106, NULL, NULL, '친절하고, 좋아요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1107, NULL, NULL, '참~~~~~깔끔해요', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1108, NULL, NULL, '밀면도 맛나지만
진짜루 만두가 정말 맛있어요^^', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1109, NULL, NULL, '만두도 밀면도 맛있어요!!', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1110, NULL, NULL, 'I love this noodle. Nice quality of soup', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1111, NULL, NULL, '때되면 생각나는 성대 맛집👍', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1112, NULL, NULL, '맛있는 면집이오~~', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1113, NULL, NULL, '', NULL, 3, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1114, NULL, NULL, '수원 맛집 카페 글 보고 다녀왔어요 기가막힌다고 리뷰 쓰셨더라고요 부산 토박이인 제 입엔 쏘쏘했네요 아주 친절하셔서 좋았어요', NULL, 3, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1115, NULL, NULL,
        '마산야구장 앞 고메밀면에서 먹고 사장님께서 수원에 모수밀면이라고 비슷한 곳 있다고 하시길래 집 근처라서 먹었습니다. 야구 볼 땐 마산 가서 먹고 평소엔 모수밀면 와서 먹어야겠네요. 번창하세요.',
        5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1116, NULL, NULL, '엄청 기대하고 갔는데도 맛있었습니다 !! ㅎㅎ
감자만두도 그냥 딱 기본 만두 맛이긴 하지만 엄청 맛있었구요 ~~ 💕💕 재방문의사 있습니다!', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1117, NULL, NULL, '맛있게 잘 먹었습니다👍', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1118, NULL, NULL, '밀면은 처음 먹어봤는데 무난히 먹기 좋았고 만두도 좋아요', 4, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1119, NULL, NULL, '만두가 미쳤습니다
육개장도 미쳤고요
밀면은 한번 먹기에 나쁘지 않았습니다.
근데 만두가 너무 맛있어서 잊어버렸어요', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1120, NULL, NULL, '사장님 친절하시고 은은한 맛이 일품입니다', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1121, NULL, NULL, '맛도 좋지만 기분좋게 식사하고 나올 수 있는곳
그냥 지단아니고 고기 지단임
찐만두 땡길때 보영만두말고 여기와서 밀면 곁들어 먹을듯', 4, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1122, NULL, NULL, '물밀면,비빔면,만두 다 맛있어요..친절하시고요~', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1123, NULL, NULL, '날이 더워져서 간만에 시원한 밀면이 묵고 싶어집니다.
율전동에 있는 모수밀면에 갑니다.

두 가지 맛을 모두 맛 보고 싶어서
물밀면 8.5천냥
비빔밀면 9천냥
2종류를 주문합니다.

깔끔한 맛입니다.', 4, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1124, NULL, NULL, '율전동 10년 정도 살면서 단일식당으로 단기간에 가장 많이 방문한 곳이자, 다시 수원가게되면 첫번째로 생각나는 식당.
  개인적으로 냉면류에서는 여기가 가장 맛있다고 생각하고, 가장 좋아하는 곳입니다. 오픈때부터 여기는 무조건 성공해야한다, 잘됐으면 하는 마음이 컸었는데 역시 맛이 좋고 사장님분들이 정말 친절하셔서 어느새 줄서먹는 식당이 됐네요.
  물밀면 정말 추천합니다. (단 부산 밀면같은 스타일은 아니고 냉면같은데 육수는 평양냉면과 일반 냉면의 중간스타일로 자극적이지 않으면서 깊은 맛이라 정말 좋아합니다.)
  근데 자주가다보니 아쉬운 점이 생긴 것은 정말 가끔 물밀면의 육수의 농도에 따라서 맛이 다를때가 있습니다. 그 미세한 차이때문에 더 맛있을때 덜 맛있을때가 있긴 한데, 그 점을 감안해도 전반적으로 매우 만족하며 먹는 곳입니다.',
        5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1125, NULL, NULL, '시원하고 참 맛있음ㅎㅎㅎ', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1126, NULL, NULL,
        '허겁지겁 먹느라 사진을 못찍었어요 ! 사장님 진짜 친절하시고 처음 먹어봤는데 너무 맛있어서 깜짝 놀랐어요 ㅋㅋㅋ 동네에 이런맛집이 있다니.. 재고소진되는 이유가 있네요.. 최고 번창하세요 🫶🏻',
        5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1127, NULL, NULL, '밀면이랑 만두 다 너무맛있고 친절하세요!! ', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1128, NULL, NULL, '아주 맛있고 사장님 친절하세요

하지만 예전에 비해 육수가 좀 밍밍해진 감이 있어요', 4, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1129, NULL, NULL, '친절하고 맛있음. 아쉬운 점은 사람이 많은 시간대에 가면 가끔 면이 뭉쳐있다는 점..? 그래도 여전히 너무 맛있음. 만두가 진짜 맛있어요', 4, 3, NULL,
        'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1130, NULL, NULL, '밀면은 부산인데 여기도 맛있다.
그리고 사장님의 설날 잘 보내라는 말까지&hellip;. 감동
', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1131, NULL, NULL, '냉면에 가까운 맛이라 기대한 밀면 맛과는 달랐지만, 맛은 매우 좋았어요. 특히 비빔을 추천합니다', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1132, NULL, NULL,
        '비빔밀면 칭찬이 많은데요, 전 예상외로 물밀면을 너무너무 맛있게 먹었어요!! (실수로 물밀면 사진을 지워서 비빔 사진밖에 없네요ㅠㅠ) 슴슴한 닭육수에 감칠맛과 달큰한 맛이 정말 조화롭더라구요 아, 어떤 분이 냉면과 평냉의 중간이라고 하셨는데 딱 그 말이 맞는 것 같아요 다만 자극적인 냉면맛 좋아하시는 분들은 너무 슴슴하다고 느끼실수도 있을 것 같구요, 전 일반냉면집 가도 식초, 겨자 안뿌리고 기본 육수만 먹는거 좋아해서 그런 제 입맛에는 정말 맛있었습니다!! 물론 비빔밀면도 맛있었어요! 단 꽤 매워서 맵찔이들은 조심하세용',
        5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1133, NULL, NULL, '월요일휴무써있어서 멀리서 일요일에왔는데
임시휴무붙어있네요
', 1, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1134, NULL, NULL, '', 4, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1135, NULL, NULL, '맛있어요. 온육수 꼭 드세요', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1136, NULL, NULL, '제스타일은 아녔으나
사장님과 알바분들이 정말 친절하시고 열심이셔요
잘 되셨음 좋겠습니다', 3, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1137, NULL, NULL, '만두 꼭 시켜야함!!!! 존맛탱 만두탱구리 ㅜ
밀면도 넘 맛있고 근데 약간 매웠음 ㅎ', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1138, NULL, NULL, '', 4, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1139, NULL, NULL, '맛도 엄청나고 사장님 너무친절하심... 율전1티어 맛집', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1140, NULL, NULL, '사장님 넘 친절하시구 갈때마다 기분좋은 동네 맛집입니다 온육수도 맛있고 밀면은 양념장 넣어먹으면 더 맛나요 ㅎㅎ', 5, 3, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1141, NULL, NULL, '면이 그냥 냉면 면이에요
국물은 계피? 한약 맛 좀 나면서 호불호 있겠다 싶었는데 괜찮았고 온육수가 제일 맛있었어요', 3, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1142, NULL, NULL, '깔끔하고 자극적이지 않아서 너무 좋음.

지인한테 적극 추천할 수 있는 곳.', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1143, NULL, NULL, '', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1144, NULL, NULL, '사장님이 정말정말 친절하세요!!
기분좋게 식사할수있었습니다
만두도 쫄깃쫄깃하고 맛있었어요~
갠적으론 비빔밀면이 더 맛있었네요 ㅎㅎ
담에 또 방문할게용', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1145, NULL, NULL, '부산 당리 밀면 이후 밀면 투어 진행중임

-국물 4.5점 : 이 정도면 밀면 국물이다 할 수 있음. 조금만 더 진하게 우려낸 국물이였다면 좀더 좋았겠지만 살짝 싱거운게 나을 수도 있겠다 싶기도함

-면 2점 : 그냥 밀가루로 밀면하는게 나으실듯함. 메밀면을 직접 뽑는건 좋지만 찔김(기성품 냉면이 덜 삶아진듯함, 수제인데???) 그냥 밀가루 밀면을 추가해서 밀면과 메밀면 2개로 구분하셔 파시는게 나을듯합니다.

-만두 4점 : 가격이 많이 비싸지 않고 만두피와 내용물이 맛있음. 그리고 그냥 양조간장이 아니라 양념장을 사용해서 좋음

-친절함 5점 : 사장님과 알바생모두 정말 친절해서 기분좋음.

더 발전된 모습 기대하며 기회가 되신다면 부산 당리밀면, 가야밀면 등에 가셔서 작접 드셔보길 권해드립니다. 동네에 진짜 맛있는 밀면집이 되어주시길 기대합니다.', 4, 3, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1146, NULL, NULL, '저녁에 갈 때마다 닫겨있어서 연차낸 날 점심에 꼭 갑니다.', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1147, NULL, NULL, '주차할곳 괜찮은 편

주인아주머니 상당히 친절

따뜻한 육수 찐한편은 아니지만
나름 괜찮은편

1. 물밀면
시원한 육수도 괜찮은편

면 - 안괜찮음. 밀면 면이 아니라 냉면 면

고기 - 없음, 계란이랑 오이, 무가 전부

2. 만두
쫄깃하니 괜찮음.


냉면면 때문에 -2점..', 3, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1148, NULL, NULL, '저는 밀면을 엄청 좋아해요. 그래서 부산에서 살았을 땐 삼시세끼 밀면만 먹은 적도 있어요.

여기 밀면은.. 아주 특별하다고 생각되진 않지만, 밀면 먹고 싶을 때 한 번씩 생각나는 곳이에요. 물론 밀면 가게가 많지 않아서 선택지가 거의 없지만, 그걸 차치하더라도 괜찮은 가게예요.

왜냐하면, 내부는 깔끔하고 여자 사장님(?) 께서는 엄청 친절하세요. 사무적인 친절함보다는 밝아보이는 언행에서 나오는 친절함이라고 할까요. 부담되지 않고 정겨운 느낌을 주셔요.  가게 위치도 괜찮은데, 앞에 적당히 주차자리도 있어서 접근성도 정말 좋고요.

물론 다시 말하지만, 엄청 맛있어서 멀리서 차타고 올 정도는 아니라고 생각해요. 하지만 그럼에도 괜찮은 곳이라고 생각해요.', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1149, NULL, NULL, '육수 너무 자극적이지도 않고
포장도 깔끔하게 해주심
주인장님 친절하신편이며
오픈주방에 가게 내부도 청결한편.
납득할만한 가격에 괜찮은 구성
점심이나 먹을 저녁 없을때 자주 찾을듯', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1150, NULL, NULL, '메밀과 고구마전분으로 반죽한 밀면~! 맛있어요!!
 밀면 6,500원/ 비빔밀면 7,000원
*월요일 휴무', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1151, NULL, NULL, '', 4, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1152, NULL, NULL, '', 3, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1153, NULL, NULL, '이렇게 잦은 빈도로 가는 식당은 없었다.
 가격도 착한데 맛은 내가먹은 냉면 밀면중 최고였다.
  보통 냉면육수는 살짝 자극적인 짭자름한맛이고 국물을 다 마시기 어려운정도의 국수라면
여기는 평양냉면과 냉면의 중간정도? 심심한 듯 심심하지 않게 진한 맛으로 국물만 먹어도 물리지 않게 딱 적당하다.
  면도 정말 좋다.
  아는 사람무조건 한번은 데려가는 곳.', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1154, NULL, NULL, '맛있음', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1155, NULL, NULL, '딱 밀면의 맛
고향을 자주못가는데 덕분에 먹고싶엇던 밀면을 먹었네요
주인부부도 매우 친절하심', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1156, NULL, NULL, '가격대비 매우 좋습니다. 매장 상태도 깔끔한 편이고요
한 우물만 파겠다는 메뉴가 호불호가 있을 수 있을것 같은데..
이런 타입의 가게는 맛은 꾸준해서 나중에 가서 실망하는 일은 없을듯 하네요', 5, 3, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1157, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1158, NULL, NULL, '오랜만에 먹었는데 가격이 많이 올랐네요ㅜㅜ 맛있게 먹었습니다!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1159, NULL, NULL, '오랜만에 먹으니 진짜 배부르네요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1160, NULL, NULL, '주차 큰길가에 공영주차장에 대고 오세요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1161, NULL, NULL, '좋아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1162, NULL, NULL, '기름이랑 튀김 깨끗해요. 돈까스 맛있고 혼밥도 쌉가능ㅎㅎ', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1163, NULL, NULL, '굳', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1164, NULL, NULL, '굳', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1165, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1166, NULL, NULL, '식구 외식했어요.맛있고 싸고 친절해요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1167, NULL, NULL,
        '장소는 많이 협소해서 다닥다닥 앉아있는 느낌이지만, 괜찮습니다~ 예전에 생선까스도 먹어봤는데 고 친구보다는 치킨까스가 맛있네요! 치킨까스 맛집같은 느낌이더라구요..ㅎㅎ 양도 많아서 보통 일반적인 돈까스집보다는 더 배부르게 먹을 수 있는 양입니다!',
        NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1168, NULL, NULL, '조아요~~~^^', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1169, NULL, NULL, '모듬까스 아주아주 맛났어요
양+질 모두 !', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1170, NULL, NULL, '맛과 가성비 최고입니다', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1171, NULL, NULL, '본찌는 사랑입니다❤️❤️', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1172, NULL, NULL, '양 모르고 추가시켰다가 남기고옴...ㅠㅠ맛있었는데 집와서 생각남', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1173, NULL, NULL, '맛있어요!!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1174, NULL, NULL, '가성비가 좋음', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1175, NULL, NULL, '동네 수준을 넘어 왠만한 돈까스 집보다 맛있음. 튀김은 바삭하고 기름지지 않으며 간도 잘 되어있음.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1176, NULL, NULL, '성대역의 명물임', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1177, NULL, NULL, '학교 근처 돈까스 맛집', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1178, NULL, NULL, '쏘쏘', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1179, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1180, NULL, NULL, '자주 애용하는 수원 성대 맛집입니다.
돈까스 너무 맛있고 특히 치킨까스 너무 맛있어요. 덮밥류도 맛있어요. 아이들도 좋아합니다.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1181, NULL, NULL, '돈까스,생선까스 너무 맛있어요.
가게공간이 협소한거 빼면 아주 만족하는 곳입니다', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1182, NULL, NULL, '쏘쏘', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1183, NULL, NULL, '맛있어용', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1184, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1185, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1186, NULL, NULL, '너무 맛있게 잘 먹었어요!! 가성비도 너무 좋고 한결같이 맛있어요!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1187, NULL, NULL, '치킨까스 맛있어요!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1188, NULL, NULL, '치킨가스 맛있어요!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1189, NULL, NULL, '처음가봐서 양많은지 모르고 냉모밀까지 시켰는데 돈까스가 엄청 많이 나와서 당황했어요ㅋㅋㅋ 돈가스는 돼지냄새 안나고 맛있는데 생선까스는 쏘쏘예요 소스는 맛있어요!',
        NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1190, NULL, NULL, '마싯었어여,,,!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1191, NULL, NULL, '조아용~~', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1192, NULL, NULL, 'ㄱ', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1193, NULL, NULL, '조아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1194, NULL, NULL, '가게가 조금 협소하기는 해요 근데 음식 맛은 정말 맛있어요~ 가성비도 좋아요 양이 정말 많아요! 돈까스 8000원에 돈까스 2장 주는 집 요즘 정말 없잖아요 질도 좋구여!! 고기가 두툼하고 쫀쫀해요 다음에 또 가고싶운 집입니다
아 치즈돈까스덮밥은 치돈인줄 알았는데 돈까스 위에에 치즈가 덮여있는겁니다! 참고하세영', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1195, NULL, NULL, 'ㅎㅎ', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1196, NULL, NULL, '돈까스 먹음', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1197, NULL, NULL, '양이 정말 많아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1198, NULL, NULL, '굳굳', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1199, NULL, NULL, '맛나요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1200, NULL, NULL, '조아용~^^', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1201, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1202, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1203, NULL, NULL, '스윙스가 먹고갔대서 기대 했는데 핵존맛탱이네욤 카레돈까스도 맛있고 치킨까스도 맛있고 굿굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1204, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1205, NULL, NULL, '또 먹고 왔습니다. 치킨까스 너무 부드럽고 양도 많아요. 이번엔 치즈치킨까스덮밥 새로 도전했는데..이것도 맛있어요.', NULL, 4, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1206, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1207, NULL, NULL, '본찌돈까스 너무 맛있어요!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1208, NULL, NULL, '돈까스는 본찌', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1209, NULL, NULL, '돈까스는 항상 본찌돈까스에서만 먹어요.
돈까스는 기본적으로 맛있고, 전 항상 치킨까스를 너무 맛있게 먹고 있어요. 덮밥은 정말 너무 맛있고 오늘 특별히 카레 시켜 먹었는데 카레도 맛있네요. 사장님도 친절하시고 아이들도 항상 본찌돈까스만 찾아요.',
        NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1210, NULL, NULL, '푸짐하고 맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1211, NULL, NULL, '율전 돈까스의 최강자, 본찌(찌) 종강 기념 치돈 먹었는데 치즈가 투머치로 많아서 너무 좋았습니다... 본찌(찌) 최고!!!', NULL, 4, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1212, NULL, NULL, '돈생카스 먹었는데 고기랑 생선도 맛있지만튀김도 하나도 안 느끼하고 진짜 맛있어요.
튀기며 다 맛있긴 한데 여기는 진짜 찐맛!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1213, NULL, NULL, '돈가스는 항상 여기서만 먹어요.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1214, NULL, NULL, '수원성대이공대 기숙사옆 돈까스 양도 많고 바싹하니 맛있어요.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1215, NULL, NULL, '돈까스 +생선까스 랑 치즈까스 주문했는데 양도많고 바삭해서 너무 맛있게 잘먹었습니다~ 언제나 사람많더라구요 ! 본찌는 사랑입
니다 ~ ❤️', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1216, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1217, NULL, NULL, '율전동 돈까스 원탑', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1218, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1219, NULL, NULL, '양이많고 바삭해요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1220, NULL, NULL, '', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1221, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1222, NULL, NULL, '.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1223, NULL, NULL, '이 근방 돈까스 1티어', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1224, NULL, NULL, '양이 많아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1225, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1226, NULL, NULL, '성대학생들이 왜 줄서는지 알겠어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1227, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1228, NULL, NULL, '맛있엉ᆢㄷ', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1229, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1230, NULL, NULL, '맛있어요 성대맛집
친절하셔요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1231, NULL, NULL, '좋아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1232, NULL, NULL, '치킨까스 넘 맛있었어요~', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1233, NULL, NULL, '카놀라유로 튀기네요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1234, NULL, NULL, '최고입니다', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1235, NULL, NULL, '이 근방 돈까스집 최고. 튀김과 고기 두께 등의 조화가 완벽에 가까움. 동네 최고 맛집으로 항상 타지사람 초대함.', NULL, 4, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1236, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1237, NULL, NULL, '단 느끼해요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1238, NULL, NULL, '살면서 먹어 본 치킨까스 중 최고입니다..!!!!! 첫 입으로 입에 넣자마자 파사삭하며 녹아 내리는 치킨의 식감이 리뷰를 쓰는 지금도
생각이 납니다... 양도 성인 남성이 먹기에 부족함이 없는, 아니 많은 양입니다! 가게 외관은 낡았어도 음식들이 전체적으로 가격대도
 훌륭하고 깔끔해서 오래 잘 되는 집은 이유가 있다는 것을 느끼게 되는 한 끼 였습니다.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1239, NULL, NULL, '굿', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1240, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1241, NULL, NULL,
        '미쳐따 진짜 치킨까스에 무슨 짓을 하신거예요;; ㄹㅇ 입에서 살살 녹는다는 표현이 관용표현이 아님을 알게됨 이런 치킨까스 첨먹어봤어요 돈까스 맛있는건 알았지만 치킨까스도 존맛탱이네요ㅠ', NULL,
        4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1242, NULL, NULL, '존맛!!!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1243, NULL, NULL, 'ㅇㅇ', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1244, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1245, NULL, NULL, '좋아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1246, NULL, NULL, '좋아요!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1247, NULL, NULL, '좋아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1248, NULL, NULL, 'ㄱ', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1249, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1250, NULL, NULL, '아이들이 좋아해요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1251, NULL, NULL, '귯', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1252, NULL, NULL, '성대에 밥 먹을 만 한곳이 그닥없는데 작은식당이지만 한끼 괜찮아요.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1253, NULL, NULL, '성대생 추천 가성비 맛집이였어용! 앉아서 먹고있는데 성대후문이라 그런지 정말 자주 오더라구요! 점심시간대에 가면 웨이팅있다고 하네요:)', NULL, 4, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1254, NULL, NULL, '😀', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1255, NULL, NULL, '짱존맛 성대 맛집', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1256, NULL, NULL, '돈까스에 들어가는 치즈가 엄청나게 부드럽고 맛있어요.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1257, NULL, NULL, '맛있어용', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1258, NULL, NULL, '👍', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1259, NULL, NULL, '전맛탱', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1260, NULL, NULL,
        '주문 잘못받은 미니우동을 손님한테 부담시키는 집. 식당 아주머니! "제가 주문 잘못받은건 맞는데 이미 드셨으니 계산하라"는 말 진짜 당황스럽네요. 미니우동이란 메뉴가 있는지도 몰랐는데 장사 그런식으로 하지마세요. 서비스 최악이었습니다',
        NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1261, NULL, NULL, '저아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1262, NULL, NULL, '진짜 맛있어용', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1263, NULL, NULL, '', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1264, NULL, NULL, '최고의 돈까스집입니다', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1265, NULL, NULL, '양 많구 괜차나여', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1266, NULL, NULL, '양도 많고 맛있어요~', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1267, NULL, NULL, '학생 때 너무 좋아해서 취직 하고 먹었더니 그래도 맛있고 결혼하고 또 왔더니 그래도 맛있네 싸고 맛있고...우리집 근처에 있으면 좋
겠네요 최고!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1268, NULL, NULL, '가성비갑! 맛집이에요~', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1269, NULL, NULL, '맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1270, NULL, NULL, '줄 길게만 보다가 처음 가봤는데 굳뜨굳뜨였어용', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1271, NULL, NULL, '맛있어요.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1272, NULL, NULL, '언제 먹어도 맛있는 돈까스
어제는 만석에 줄 선 사람도 있었네요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1273, NULL, NULL, '맛집인정!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1274, NULL, NULL, '돈까스 맛집!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1275, NULL, NULL, '열번먹으면 열번 다 만족합니다
바삭하고 촉촉해요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1276, NULL, NULL, '좋아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1277, NULL, NULL, '본찌 체공,,!!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1278, NULL, NULL, '성대역 연돈', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1279, NULL, NULL, '가성비 맛집', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1280, NULL, NULL, '완존 마싯숨,,,,,', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1281, NULL, NULL, '좋아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1282, NULL, NULL, '율최맛', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1283, NULL, NULL, '직원분들이 친절하시고 가격도 저렴한데 맛있었어요.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1284, NULL, NULL, '맛있어요.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1285, NULL, NULL, '좋아요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1286, NULL, NULL, '맛있음 모두 다', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1287, NULL, NULL, '바삭바삭한 식감 좋아하시는 분들은 돈까스덮밥보다는 돈까스가 나아요
치즈돈까스덮밥엔 양파는 많이 없고 정말 치즈 밥 돈까스 먹는 느낌이라 좀 별로였어요
그래도 가성비는 너무 좋습니다', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1288, NULL, NULL, '기대안하고 갔는데 얻어걸린 맛집. 돈까스 튀김부분이 바삭하고 안에 고기는 쫀득해요. 양도 2줄 가득 나와서 가성비가 좋아요. 단점
은 메밀이 맛이 없어요. 슈퍼에서 파는 인스턴트 느낌.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1289, NULL, NULL, '맛있어요^.^ 푸짐하구요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1290, NULL, NULL, 'so so', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1291, NULL, NULL, '갈수록 별로에요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1292, NULL, NULL, '매번 줄서고 먹어야 해서 못 갔었는데 ~
오늘은 성공! 1시쯤 가도 여전히 사람 많네요~
양도 푸짐하고 바삭하고 맛나요~ 다음엔 다른 메뉴도 도전!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1293, NULL, NULL, '율전동 본찌돈까스
맛있어요~', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1294, NULL, NULL, '소울푸드..', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1295, NULL, NULL, '치즈 돈까스가 맛있어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1296, NULL, NULL, '음... 본찌! 돈까스! 오늘 새로운 메뉴를 시켰는데, 원래 먹던 돈까스를 계속 시켜야겠다고 생각했습니다!', NULL, 4, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1297, NULL, NULL, '정말보통입니다', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1298, NULL, NULL, '돈가스 맛있어요 근데 치즈돈가스 시키면
아주머니가 싫어하는티 내세요
바쁜데 시키면 싫어하시더라구요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1299, NULL, NULL, '역시나 이번주도 방문~
너무 맛있는 돈까스 전문점 입니다~^^', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1300, NULL, NULL, '이제 가성비가 좋진않다.', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1301, NULL, NULL, '코로나 발생전 거의 매주 한번씩 방문했던 찐 돈까스 맛집입니다. 전 돈까스 웬만하면 다른곳에서 안 먹고 여기서만 먹어요~^^ 진짜 너무 맛있어요~
최애메뉴 : 치킨까스덮밥, 돈치(돈까스+치킨까스)세트', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1302, NULL, NULL, '치즈 돈까스는 시간이 너무 오래걸린다고 항상 주문을 못하게하네요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1303, NULL, NULL, '좁아서 점심때는 줄 서야 함. 가격 대비 양 많고 퀄리티 좋음. 역시 대학가앞이구나 싶음', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1304, NULL, NULL, '', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1305, NULL, NULL, '굿맛', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1306, NULL, NULL, '짱맛!', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1307, NULL, NULL, '', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1308, NULL, NULL, '푸짐해요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1309, NULL, NULL, '존맛탱', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1310, NULL, NULL, '돈까스 맛집이라고 소문나서 가봤는데 맛있었어요', NULL, 4, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1311, NULL, NULL, '혼밥 치즈돈까스 ', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1312, NULL, NULL, '든든~~~하네요  ', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1313, NULL, NULL, '정말 좋아하는 가게였으나
이번에 먹을 땐 치킨까스에서 나는 잡내때문에 느끼해 죽는줄 알았음
냉모밀은 간무도 안들어 갈 정도로 기본도 안되어있고 맛없으니 시키지 마시길', 3, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1314, NULL, NULL, '메밀소바랑 돈까스 먹었는데 맛있음 😊👍 재방문의사있음 자리가 협소하지만 금액저렴하고 배불러요', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1315, NULL, NULL, '가격이 너무 많이 오른거같아요...
양은 푸짐하고 맛도 괜찮습니다 ', 3, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1316, NULL, NULL, '돈치.
2011년부터 단골. 콤비 5000원이었음.
2022년에도 옴. 콤비 8000원 됨. ', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1317, NULL, NULL, '성대 근본 돈가스,,', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1318, NULL, NULL, '예전에는 이 가격에 이 퀄리티를 먹을 수 있다고?
였지만 이제는 적당한 가격에 합리적인 맛 정도
그래도 율전 돈까스는 원탑이긴 하려나', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1319, NULL, NULL, '', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1320, NULL, NULL,
        '돈치까스 가격은 1만원으로 그리 싸지는 않지만 양은 적당히 잘 나왔다. 또한 바로 튀겨서 나와 일단 너무 맛있었는데 식은 상태에서 먹으니 약간 질리는 느낌이 있었다. 치킨까스는 부드럽다.', 3,
        4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1321, NULL, NULL,
        '돈까스와 우동 세트를 먹었습니다. 점심시간에 가면 조금 웨이팅이 있으며 성대생들의 소울푸드인 것 같았습니다. 점심시간에 갔는데 여성 손님이 없어서 조금 민망했습니다. 맞은편 돈까스집은 자리가 많은데 이곳은 좀 기다려야 됩니다만 회전율이 느리진 않아요 물은 셀프고 개인적으로는 우동 국물이 맛있었습니다 돈까스가 양이 꽤 많아요',
        4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1322, NULL, NULL, '돈까스덮밥 전문가수준', 3, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1323, NULL, NULL, '성대하면 본찌.
미친 돈가스 퀄리티를 저렴한 가격에 배부르게 먹을 수 있습니다.', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1324, NULL, NULL, '양 푸짐하고 맛도 괜찮습니다.', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1325, NULL, NULL, '양 진짜 많아요 존맛탱이에요~~ 가성비도 굿!', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1326, NULL, NULL, '율전 근처에서 돈까스 땡긴다? 그럼 바로 요기. 혼밥도 편한 곳~', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1327, NULL, NULL, '', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1328, NULL, NULL, '대학교 앞이라 대학생들이 주로 이용해서 비교적 저렴!
맛은 말해뭐해ㅎㅎ 양도 많고 좋아요', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1329, NULL, NULL, '', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1330, NULL, NULL, '수원에서 가성비 맛집 1가지만 꼽으라면 이 집임. 일본인들이 요리하는 한국식의 푸짐하고 맛난 정통돈까스를 먹을 수 있음.', 5, 4, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1331, NULL, NULL, 'Wow 양 엄청 많음 배터짐
그리고 생선까스 맛있음', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1332, NULL, NULL, '', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1333, NULL, NULL, '성대 샛길 쪽에 위치한 돈까스집 4개중 대장 녀석. 값 싸고 양 많아서 공대생 최적화 음식점이다. 사실 맛은 고평가 되어있는데 횡단보도 건너 돈정 돈까스가 더 맛있음. 그러나 가성비로 보면 추천할 만 하다. 가게가 좁은 편인데 확장 이전좀 했으면 좋겠다. 장사가 엄청 잘돼서 이미 사장님 벤츠 s클래스 뽑고 남았을듯..
추천메뉴는 생선까스다. ', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1334, NULL, NULL, '예전엔 미친 가성비였는데 이젠 그 정도는 아닌 듯
돈까스 맛이 막 훌륭한 건 아닌데 유명해서 유명한 곳', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1335, NULL, NULL, '좁긴 한데 가격대비 양이 엄청 많아요', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1336, NULL, NULL, '생선까스가 좀 비려요 .. 가격대비 양과 다른 치킨까스의 맛은 훌륭 ', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1337, NULL, NULL, '우동 진하고 돈까스 바삭바삭 두툼
테이블 간격 가까운게 흠이지만 맛있어서 좋아요', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1338, NULL, NULL,
        '여기가 유명한 이유는 가격에 비해 맛있고 양이 많기 때문이죠. 그리고 일본인 아주머니가 운영하십니다. 덮밥류는 정말 여기서만 먹을 수 있는 스타일인거같아요. 아직도 가끔 생각납니다. 이제는 트랜드도 많이 바뀌고 맛있다하는 돈가츠를 많이 먹어서봐서 예전의 그 감동을 느낄 수 있을진 모르겠지만.. 20대 초중반 저의 올타임 레전드집.',
        5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1339, NULL, NULL, '', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1340, NULL, NULL, '모밀정식나 카레까스 먹어야댐!', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1341, NULL, NULL, '왜 유명한걸까..?
자리는 다닥다닥 돈까스도 그냥 그랬음
고기가 신선한 것 같긴 한데 뻑뻑하고 치즈돈까스는 머스터드? 같은 소스만 뿌려주는게 끝(치즈안들어감)
위생도 그닥 ㅠ', 3, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1342, NULL, NULL, '가격대비 양은 상당합니다.
허나 맛은 고평가되어 있습니다.
보는것과 같이 돈까스 육질이 뻑뻑한 편입니다.
양이 우선이면 좋은집이나 흔히들 얘기하는 맛집이라고 하기엔 좀 그렇고. 같은가격에 이름있는 돈까스 반쪽 먹는게 만족감은 높을것 같네요.', 3, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1343, NULL, NULL, '카레 돈까스(7500) + 우동 소(2000)
평소 가보고 싶었는데 항상 사람이 많아서 다른 곳으로 가다가 마침 사람이 적을때를 노려서 먹었다.
우동맛은 뭔가 아쉽지만 돈까스는 맛이 좋았다.', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1344, NULL, NULL, '', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1345, NULL, NULL, '율전의 근본있는 돈까스집이에요~
양이 완전 많아요~
돈까스도 바삭바삭하니 맛있게 먹었어요~
돈까스는 기본적이지만 질리지 않는 맛이고, 치킨까스는 담백하지만 촉촉한 신기한 맛이에요~
', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1346, NULL, NULL,
        '주문 잘못받은 미니우동을 손님한테 부담시키는 집. 식당 아주머니! &quot;제가 주문 잘못받은건 맞는데 이미 드셨으니 계산하라&quot;는 말 진짜 당황스럽네요. 미니우동이란 메뉴가 있는지도 몰랐는데 장사 그런식으로 하지마세요. 서비스 최악이었습니다',
        1, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1347, NULL, NULL, '갓성비 성대 대표 돈가스', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1348, NULL, NULL, '메밀소바 정식 구성도 맛도 양도 가격도 다 좋았습니다!', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1349, NULL, NULL, '자주가는데 맛잇고 좋음. 사람몰릴때 자리잡기가 힘든거 빼고.
', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1350, NULL, NULL, '돈치', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1351, NULL, NULL, '', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1352, NULL, NULL, '착한 가격. 맛있어요. 특히 생선까스는 급식에 나왔던 것과 차원이 다름...', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1353, NULL, NULL, '양도 많고 싸고 가성비 좋았어요 ', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1354, NULL, NULL, '치즈돈까스 먹는게 목표', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1355, NULL, NULL, '가성비 좋은 동네 돈까스 맛집예요
고기 도톰하고 부드러워요
전 늘 퇴근길에 포장해서 먹었는데
김치랑 단무지, 양배추 샐러드, 밥 같이 포장되요
양도 엄청 많아서 전 두끼 나눠 먹었어요
반은 놔두었다 나중에 먹었는데도
그렇게 기름지지 않고 먹을만했어요
골목에 돈까스집이 꽤 많은데
이 집만 줄서 먹는 이유가 있네요
이 골목 돈까스 다 맛보고 여기로 정착했어요
돈까스 생각남 늘 여기로 가요~
', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1356, NULL, NULL, '가성비 최고
양 최고
맛 최고
돈까스 별로 안좋아하는데 여기 돈까스 좋아해요', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1357, NULL, NULL, '최고!!', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1358, NULL, NULL, '율전가면 본찌부터 먹어야지~', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1359, NULL, NULL, '대학원생이 추천한 집.
가성비 맛 모두 좋아요', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1360, NULL, NULL, '그냥 최고에요 동네최고의 맛집', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1361, NULL, NULL, '율전 밥집 3대장
사람 맨날 붐비는 이유가 있음
포장도 되니까 집가서 드셔도 됩니다
부정할수 없는 맛집임', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1362, NULL, NULL, '돈까스,치킨가스 맛나요 양도 많고 재방문의사있음 포장해도 소스 가득 주심', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1363, NULL, NULL, '고기 부드러어요~~
돈까스도 맛있는데 치킨까스가 진짜 맛있음!
탈색머리 직원분 친절해요ㅎㅎ
다음에 생선까스 먹어바야지
', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1364, NULL, NULL, '', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1365, NULL, NULL, '장사가 너무 잘 되어서 혼밥하기 미안한 집. 특히 생선가스가 다른집보다 정말정말 맛이 있다.', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1366, NULL, NULL, '', 5, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1367, NULL, NULL, '', 4, 4, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1368, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1369, NULL, NULL, '기존자리에서 옮기신후에 첫방문이었는데 역시나 사장님의 밝은태도와 친절함은 여전하세요! 매장은 확실히 전보다 많이협소해져서
아쉬워요🥲 2인테이블자리에 앉았는데 너무좁아서 여러 음식놓고 먹기가 불편했어요ㅠㅠ 그거빼고는 그래도 음식나오는속도며
 맛은 전과 변함없이 맛있었어요😁', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1370, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1371, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1372, NULL, NULL, '매장 옮기기전 한번, 옮기고 처음 갔는데 저번에 비해 너무너무 맛있었어요. 더 맛있어졌어요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1373, NULL, NULL, '라멘 돈부리 최고~~~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1374, NULL, NULL, '사장님도 친절하시고 메뉴도 아주 맛있었습니다
학생들에게 인기가 많은 매장인 것 같아요~^^', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1375, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1376, NULL, NULL,
        '이 동네 오래된 라멘집이라고 함께 간 일행의 추천으로 방문. 정통돈코츠라길래 진할줄 알았는데.. 나쁘진 않았지만 라이트해서 제취향은 아녔어요. 돈카츠김치나베도 싱겁.. 그치만 모든 메뉴가 가성비는 좋은듯요. 친절하시고 차슈사이즈는 좋았어요.',
        NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1377, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1378, NULL, NULL, '이전하고 오픈하길 너무 기다렸어요. 21일 오픈 시간 맞춰 방문했더니 대기없고 음식도 빨리 나와 너무 좋았네요. 장소가 이전에 비
해 좀 협소하지만 나름 인테리어도 신경 많이 쓰신 것 같았고 무엇보다 주문한 메뉴들 역시나 맛나게 잘 먹었어요. 직원분들도 변함
없이 친절하시고 만족스러운 시간였어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1379, NULL, NULL, '미가돈코츠+규동, 정통돈코츠+규동 셋트 먹었어요. 점심시간이라 매장에 손님이 많았지만 웨이팅 없이 바로 착석해서 좋았구요. 라
멘도 규동도 너무 맛있네요. 이제 종종 방문해야겠어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1380, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1381, NULL, NULL, '열라미싓당', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1382, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1383, NULL, NULL, '저아', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1384, NULL, NULL, '무난해요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1385, NULL, NULL, '밝은목소리인사로 방겨주시는 사장님덕분에 마음이 환해지네요~ 친절 감사드리며 음식 맛있게 잘먹었어요~ 종종 갈께요~', NULL, 5, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1386, NULL, NULL, '맛있게 잘 먹었습니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1387, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1388, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1389, NULL, NULL, '대학교앞이라 가성비 저렴한 가격에 라멘 잘 먹었어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1390, NULL, NULL, '맛있어!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1391, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1392, NULL, NULL, '넘 맛있어요^^', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1393, NULL, NULL, '고기도 부드럽고 양도 많고 맛있어요! 👍🏻', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1394, NULL, NULL, '굳!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1395, NULL, NULL, '처음 먹어봤는데 맛있었어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1396, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1397, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1398, NULL, NULL, '잘먹었습니다 ㅎㅎ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1399, NULL, NULL, '조ㅎ아', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1400, NULL, NULL, '드뎌 라멘맛집을 찾음 굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1401, NULL, NULL, '맛있어요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1402, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1403, NULL, NULL, 'ㅇ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1404, NULL, NULL, '소유라면 맛있어요! 라멘의 맵기를 선택할 수 있어서 좋았어요 :)', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1405, NULL, NULL,
        '보통 라면 한개정도만 먹는데 오늘은 규동도 먹고싶어서 세트로 했어요. 라면하나만 해도 셀프코너에 밥있어서 배부르게 먹을 수 있습니다ㅜ 사장님이 친절하시고 가격도 저렴한 편이라 좋습니다', NULL,
        5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1406, NULL, NULL, '#성대역맛집 #성대역미가라멘 #라멘맛집
냉라멘 진짜 맛있어요. 더운 요즘에는 더 좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1407, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1408, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1409, NULL, NULL, '카라미소라멘 먹었는데 매콤하고 해장되는 맛이었어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1410, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1411, NULL, NULL, '오랜만에 갔는데 10년전과 변함이 없네요. 감사해요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1412, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1413, NULL, NULL, '정통 일본 라멘 먹을수 았는 곳', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1414, NULL, NULL, '맛이 특별한게 있는거 같아
맛있었어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1415, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1416, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1417, NULL, NULL, '미가라멘의 정통돈코츠라멘은 다른 돈코츠라멘과 다른 진한 맛이 있음', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1418, NULL, NULL, '매콤한 맛의 정통돈코츠라멘이라 맛이 좋았습니다!
규동역시 불맛강한 소고기와 후추향 강한 맛으로 한국인 입맛에 잘 맞는 조합이었어요! 추천드립니당', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1419, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1420, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1421, NULL, NULL, '율전동 라멘맛집', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1422, NULL, NULL, '맛있네오', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1423, NULL, NULL, '라멘은 키와마루아지 승.. 뭐랄까 여기는 육수가 라멘이 아니라 라면 국물 느낌이에요 진하다기보다는 그냥 미각만 자극하는 맛 그리
구 개인적으로 차슈도 키와게 좀 더 제 스타일이었어요 그치만 친절, 위생은 미가 승 다들 주문하시는거 봐도 그렇고, 여기는 라멘보
다 덮밥류가 맛있는것 같더라구요? 담번에는 규동 먹어보려구요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1424, NULL, NULL, '간단하게 점심 먹으러가기좋아요~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1425, NULL, NULL, '차슈에서 누린내가 조금 나지만 그래도 맛있게 잘 먹었습니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1426, NULL, NULL, '괜찮았어요 굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1427, NULL, NULL, '라멘 느끼해서 잘 못 먹는 편인데 국물이 깔끔하고 면도 맛있어요. 가끔 라멘 땡길때 갑니다 😋 https://m.blog.naver.com/ojjoo
88/223101896028', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1428, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1429, NULL, NULL, 'ㅇ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1430, NULL, NULL, '가성비좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1431, NULL, NULL, '돈코츠라멘이 맛있어요! 김치나베는 시큼한 김치맛이 아니고 달달~ 육수만땅~ 이런너낌이라 아쉬웠지만요~~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1432, NULL, NULL, '미소의 매운맛은 잘 모르겠는데, 정통 돈코츠는 뭔가 시큼한 향과 맛이 면, 국물에 나더라구요... 긴가민가 구분이 안가서 일단 먹었습니다. 뭔가 좀 아쉬웠습니다.',
        NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1433, NULL, NULL, '학교 앞이라 그런가 음식 양도 많은데
심지어 맛까지 좋아요
담번에 출장가면 또 갈래요~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1434, NULL, NULL, '가볍게 먹기좋고 양도 넉넉해요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1435, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1436, NULL, NULL, '우연히지나가다맛집발견
테이블이조금좁아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1437, NULL, NULL, '가성비 넘치는 돈부리/라멘은 역시 미가 !!
차슈동 + 미니라멘 세트 먹었는데 양 많아서 너무 좋았어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1438, NULL, NULL, '이근처 사는 지인분께서 맛있어서 종종 찾는곳이라고 해서 갔어요. 키오스크로 주문하고 음식도 바로 나오는편이에요. 사장님 포함
직원분들도 모두 친절하고 다들 웃으면서 ㅇ일하는 분위기라 식사하고 나오면서도 기분좋게 나올 수 있었어요. 식당이란게 밥만 파
는게 아니라, 이렇게 마음과 웃음을 함께 제공받는 기분! 오랜만에 정말 기분좋았어요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1439, NULL, NULL, '좋아요bb', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1440, NULL, NULL, '라멘종류 다맛있고 특히 돈까스김치나베 밥두공기각~!
음식 제공속도 매우 빠름', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1441, NULL, NULL, '좋아요bb', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1442, NULL, NULL, '세트메뉴가 있어서 라멘 규동 함께 먹을수 있어서 너무 좋아요. 가격도 좋고 차슈라멘 맛있습니다 진한 맛이 좋네요! 맵기 조절도 할수 있어서 추천입니다', NULL,
        5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1443, NULL, NULL, '걍 그래요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1444, NULL, NULL, '맛은soso', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1445, NULL, NULL, '음식은 정말 맛있어요^^
근데 단발하신 알바생때문에 미가라멘 이미지 안좋아질것같네요. 알바하기 너무 싫은거 티 많이 나요.
주의 좀 해주시면 감사하겠습니다. 맛 청결은 좋았으나 서비스 정말 별로였어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1446, NULL, NULL, '굳', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1447, NULL, NULL,
        '가성비가 좋아요! 양이 많고 진짜 빨리 나와요 주문한지 3분도 안되서 나왔어요! 완전 패스트합니다 면이 얇고 생면인 것 같아요! 맛있어요 장국은 부탁하면 나옵니다 고기가 불에 구웠는지 되게 맛있엉ㅅ',
        NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1448, NULL, NULL, '맛있고 양도 많고 가성비도 있고 사장님도 넘 친절하시고, 인테리어도 완벽한 곳!! 성대 맛집입니당!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1449, NULL, NULL, '좋와오ㅡ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1450, NULL, NULL, '직원분들 친절하고 양도 많지만..
우리 가족 입맛에는 그렇게 맞지 않는듯..
그래도 일본라멘 특유의 맛을 느낄 수 있었어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1451, NULL, NULL, '좋아요~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1452, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1453, NULL, NULL, '혼밥 좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1454, NULL, NULL, '라멘은 맛 괜찮아요 가격도 착하고 기본 칠천원', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1455, NULL, NULL, '배달시켜 먹었는데 맛있어요.
라멘은 기대하던 맛이고, 치킨가라아게도 정말 맛있어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1456, NULL, NULL, '맛있게 잘 먹었습니다!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1457, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1458, NULL, NULL, '너무 맛있네옷', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1459, NULL, NULL, '라멘, 돈부리 다 그냥 괜찮았어요.
가츠동이 규동보다는 나았어요
밥알이 너무 살아있어서 개인적으로는 불호였고, 라멘이 맛있었습니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1460, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1461, NULL, NULL, '라멘 좋아하는데 여기는 별점 ⭐️⭐️⭐️/(5개만점)
나쁘지 않았어요‼️ 차슈는 좀 뻑뻑해요..
궁금해서 시오버터라멘 먹어봤는데 호불호가 많이 갈릴 것 같아여☺️ 저는 담에 미가라멘으로..', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1462, NULL, NULL, '대학생때 차슈라는것을 여기서 처음먹었고 다른곳 차슈도 다이렇게 불맛나고 연하게 해주는줄 진자 최고맛잇다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1463, NULL, NULL, '음식이 맛나요 제 최애 맛집 입니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1464, NULL, NULL, '정통 돈가츠라멘 해장하기 좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1465, NULL, NULL,
        '인심좋은 푸짐한 라멘을 먹을 수 있습니다. 세트메뉴도 가성비가 좋고 공기밥이 무료 셀프라 학생들이 부담없이 양껏 먹을 수 있네요. 어린아이와 함께 방문하면 스포크랑 앞접시도 함께 챙겨주십니다. 가족끼리 간단히 외식하기에도 정말 좋았어요.',
        NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1466, NULL, NULL, '제발 매장 환기좀 잘시켜주세요 마스크 벗자마자 비린네가 넘 심해서 다 먹지도 못하고 나왔어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1467, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1468, NULL, NULL, '정통돈코츠 먹었는데 맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1469, NULL, NULL,
        '제가제가 웬만하면 리뷰를 잘 작성을 안 하는데 너무 심각해서 작성합니다 라멘에서는 이상한 비린내가 너무 심했고요 김치나베에서 계란껍질이 나와서 입맛 다 버렸네요 가신다고 하면 말리지는 않겠지만 정말 비추드립니다.',
        NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1470, NULL, NULL, '혼밥하기 좋네요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1471, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1472, NULL, NULL, '항상 맛있게 잘 먹고 있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1473, NULL, NULL, '얼큰짬뽕,김치나베 맛나요! 👍👍👍', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1474, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1475, NULL, NULL, '차슈라면과 카츠동 먹었어요. 카츠동의 돈까스가 바로 튀겨나온게 아니고 보관하던거 얹어 준것 같긴한데, 워낙 가격이 저렴해서
수긍이 됩니다. 맛보다는 가성비로 가면 좋을 것 같아요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1476, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1477, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1478, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1479, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1480, NULL, NULL, '라멘맛집! 규동세트 👍', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1481, NULL, NULL, '깔끔한 맛.
일본가서 먹던 것 만큼 맛있어요
저는 미가돈코츠라멘에 미니규동 추가 추천!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1482, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1483, NULL, NULL, '맛있게 잘 먹었어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1484, NULL, NULL,
        '음식은 맛있습니다 단발머리 알바생분 주문 제대로 못 받은 것 같으면 다시 물어보셨으면 좋겠네요. 세트 추가한 주문 제대로 들어간 줄 알고 기다렸는데 계속 안나왔어요. 억지로 시켜서 일하시는 것 같음',
        NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1485, NULL, NULL, '맛있어요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1486, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1487, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1488, NULL, NULL, '친절해요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1489, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1490, NULL, NULL, '맛이나 친절이나 너무 아쉽습니다. 두번은 안갈 것 같습니다.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1491, NULL, NULL, '지역 카페 검색해서 왔는데 오늘 선택이 잘못 됐는지 음식을 거의 남기고 나왔네요. 정통돈코츠에서는 알수 없는 비릿함으로 인해
더 이상 먹을수가 없었어요. 규동은 후초와 시치미의 향연으로. 메뉴판에 조금 더 자세한 설명이 있었다면 좋을거 같아요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1492, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1493, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1494, NULL, NULL, '라멘 맛나요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1495, NULL, NULL, '맛도 서비스도 별로.. 재방문의사는 없네요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1496, NULL, NULL, '주변에 소유라멘이 없어서 먹기 좋았고 오코노미야키 맛있었어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1497, NULL, NULL, '조아영', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1498, NULL, NULL, 'ㅋ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1499, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1500, NULL, NULL, '라멘에 냄새가 나요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1501, NULL, NULL, '먹을만함~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1502, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1503, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1504, NULL, NULL, 'GOAT', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1505, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1506, NULL, NULL, '굳굳', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1507, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1508, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1509, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1510, NULL, NULL, '미가라멘 항상 꾸준해서 좋아요~ 사장아주머님 너무 친절하시구 💕부타동 양 많고 소스도 많이 주시네여 🫶 돈까스 김치나베 짱맛이었습니당 😚😚😚', NULL, 5,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1511, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1512, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1513, NULL, NULL, '라면이랑 규동이 맛있어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1514, NULL, NULL, '직원들끼리 많이 친한가봐요ㅎㅎ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1515, NULL, NULL, '라멘 맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1516, NULL, NULL, '성대 라멘 최고 맛집,,, 가성비도 넘 조아서 자주가요 ㅎ 매운맛 이상으로 하시면 해장에도 진짜 딱임.. 국물 진해서 좋아요 밥도 무한리필이구요!!', NULL, 5,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1517, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1518, NULL, NULL, '맛있게 먹고왔어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1519, NULL, NULL, '라멘먹고싶어 찾아가서 먹고왔습니다.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1520, NULL, NULL, '전통돈코츠라멘-^-^너무너무 맛있어유 오래된 단골이에유 찐토배기 맛집♡인정입니다^^ 두시간 거리인데 일주일 한번은 찾아가
는 집이에요^-^♡♡♡ 사진찍을새도 없이먹어버렸네요ㅋㅋㅋ 혼밥하기도 좋고 여자사장님^-^ 언제나 반갑고 친절하셔서 너무 감
사해유', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1521, NULL, NULL, '생각보다 괜찮았음', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1522, NULL, NULL, '규동 너무 맛있어요🥹', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1523, NULL, NULL, '좋아요 양도 많고 친절해요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1524, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1525, NULL, NULL, '역시 돈코츠라멘 맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1526, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1527, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1528, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1529, NULL, NULL, '제 입맛에서는 그저 그랬어요 ㅠㅠ 다만 성대 라멘집중 늦게 마감하는 편이라 좋았어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1530, NULL, NULL, '굳', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1531, NULL, NULL, '굿~~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1532, NULL, NULL, '매장이 시원하고 라멘 부타동 맛있어요~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1533, NULL, NULL, '굳', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1534, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1535, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1536, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1537, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1538, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1539, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1540, NULL, NULL, '반찬 리필코너에 밥도 있어요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1541, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1542, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1543, NULL, NULL, '성대 맛집~~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1544, NULL, NULL, '라멘 맛있어요
매력적~^^', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1545, NULL, NULL, '친절. 맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1546, NULL, NULL, '조아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1547, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1548, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1549, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1550, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1551, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1552, NULL, NULL, '친절합니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1553, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1554, NULL, NULL, '저렴한 가격에 매장도 청결하고 너무나 맛있습니다
맛있게 잘먹었습니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1555, NULL, NULL, '라멘집 요즘 보면 9천원에서 11천원까지 가격 엄청난데 여기는

9천5백원에 돈부리랑 라멘까지 즐길 수 있슴돠 배고플때 강추', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1556, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1557, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1558, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1559, NULL, NULL, '맛은 그냥 그래욥,, 기대보다는 ,, ㅠㅠ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1560, NULL, NULL, '쏘쏘', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1561, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1562, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1563, NULL, NULL, '후기가 많아 처음 가봤는데 제입엔 그냥 그렇네요.
연어가 별로..라멘은 무난했어요.
라멘 양은 좀 적네요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1564, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1565, NULL, NULL, '맛있어요~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1566, NULL, NULL, '시오 버터 라멘 잘 먹고 갑니다!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1567, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1568, NULL, NULL, '진짜 오래된 집인데... 위치 옮기기 전부터 다녔던 곳인데 맛은 여전히 맛있어요 친구 소개해주면 실패없는 집', NULL, 5, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1569, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1570, NULL, NULL, '나가사끼짬뽕 먹었는데, 맛은 있는데 해산물 맛은 많이 안나요. 근데 오징어가 참 부드러워요!
가성비 굳!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1571, NULL, NULL, '맛있어요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1572, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1573, NULL, NULL, '일하는분이 사람 위아래로 훑어보지 않나 음식나왔는데 그릇만 두고 가질 않나 표정이 똥씹은 표정인건 그럴수 있다쳐도 이걸 먹어
야되는지 기다려야야 하는지 셀프바가 있는걸 써도 되는지 기본 적인 말은 해줘야 할꺼 같은데 내돈주고 눈치보면서 밥먹고 나옴', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1574, NULL, NULL, '국물이 찐하진 않네요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1575, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1576, NULL, NULL, '#율전동맛집 #성대역맛집 #율전동라멘 오늘은 사케동먹었어요~ (단골입니다ㅎ) 가성비 좋아요! 저는 양이 딱맞았지만부족할수도
있으니 곱배기가 있어도 좋을거같아요 :) 같이 주시는 숙주반찬도 넘 맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1577, NULL, NULL, '간이 살짝 쎈데 그래도 싸고 맛나요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1578, NULL, NULL, '맛있게 잘먹었어요^^♡', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1579, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1580, NULL, NULL, '넘 친절하세요. 사람들 많이오시더라구요. 저는 라면보다 밥이 더 나았어요. 느끼한거 잘 못드시면 원조라멘은 비추! 살짝매콤한맛인것들이 전체적으로 맛난듯<', NULL,
        5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1581, NULL, NULL, '맛 참 좋아요
라멘', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1582, NULL, NULL, '꽤맛꽤맛', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1583, NULL, NULL, '맛있어요! 배달시 국물 따로 포장해주시고 면도 안불게 따로 잘 넣어주셔서 좋아요ㅎ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1584, NULL, NULL, 'ㅡ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1585, NULL, NULL, 'ㄱ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1586, NULL, NULL, '맛있는 메뉴도 많은데 가격도 너무 착해서 놀랐어요! 양도 많고 맛있고 사장님도 친절하세요ㅎㅎ 9시반 라스트오더인거같아요~!', NULL, 5, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1587, NULL, NULL, '친절해요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1588, NULL, NULL, 'ㄹ ㄹ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1589, NULL, NULL, 'ㅊㅊ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1590, NULL, NULL, 'ㄷ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1591, NULL, NULL, 'ㅋㅋ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1592, NULL, NULL, '잘먹었어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1593, NULL, NULL, '잘시켜 먹어었요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1594, NULL, NULL, '여사장님 넘 좋으세요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1595, NULL, NULL, '맛있네요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1596, NULL, NULL, '배달시켜먹기에 간편하게 포장되어 있어 편했어요!! 면도 불지않고 맛나게 먹었습니다:)', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1597, NULL, NULL, '굿굿 고로케도 꼭 시키세요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1598, NULL, NULL, '우와~~!!!
오늘 처음으로 밥먹으러 갔는데~
넘넘 맛있어서 반하고 왔네요~^^!!!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1599, NULL, NULL, '면발이 쫄깃해서 넘 맛있고 육수가 정말 진했어요!!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1600, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1601, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1602, NULL, NULL, '급 라면 땡겨서 성대역 내려서 간 곳! 공기밥 무료로? 기억 하는 곳!!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1603, NULL, NULL, '여기 짱 맛있어요! 친구들이랑 오세요:)', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1604, NULL, NULL, '𝙅𝙊𝙉𝙉𝘼 맛있어용 ㅠㅠ 성대맛집ㄹㅇ.. 이거 왜 안 사먹음..? 돈코츠 존마ㅅ탱', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1605, NULL, NULL, '👍', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1606, NULL, NULL, '조금 짜요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1607, NULL, NULL, '사장님
친절하고 귀여우셔요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1608, NULL, NULL, '괜찬았다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1609, NULL, NULL, '#성대역맛집 #율전동맛집
10년째 단골입니다~라멘넘 맛있고요
냉라멘 덮밥같은 특별 메뉴도 맛있어요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1610, NULL, NULL, '쇼유라멘이랑 미가시켰는데 둘다 약간매운맛이었지만 쇼유는 너무짜고맵고 미가는 아주진한맛인데 싱겁고 맵지도않았어요. 차슈는 4개 중 3개가 퍽퍽했네요
가성비는 좋아여', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1611, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1612, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1613, NULL, NULL, '규동특대 양 넉넉해서 좋고 돈까스나베 맛있네요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1614, NULL, NULL, '냠냠', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1615, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1616, NULL, NULL, '좋은데요 라면이 안따듯해요 면이 살짝 덜익은느낌 그래도 맛나요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1617, NULL, NULL, '맛있어요! 깔끔하고 맛있는 맛. 가라아케도 다른곳과 다르지만 더 맛난 것 같고 사장님도 친절하셔서 좋은 듯 합니당 ㅎㅎ', NULL, 5, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1618, NULL, NULL, '처음 가봤는데 덮밥도 라멘도 둘다 맛있어요!
실수로 밥 엎었는데ㅠㅠ 새로 해주시고 진짜 친절하셨어요ㅠㅠㅠ 감사히 잘 먹었습니다 또 갈게요 ㅎㅎ❤️', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1619, NULL, NULL, '친구들과 같이 갔었는데, 나중에도 가고 싶은데.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1620, NULL, NULL, '자리가 다닥다닥 붙어있어서 코로나때문에 걱정되긴 했는데 맛있긴 해요!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1621, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1622, NULL, NULL, '왕맛있음', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1623, NULL, NULL, '너무나 배달도 정성스럽게 옵니다. 면이 불지않고 배달도 빠르구 맛있습니다 국물도 뜨겁게 와서 좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1624, NULL, NULL, '완전맛있습니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1625, NULL, NULL, '정말 맛있어요^^', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1626, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1627, NULL, NULL, '#율전동맛집 #성균관대역맛집 #미가라멘 성대역근처 최고맛집입니다 :) 라멘도 모든 종류 다 맛있고요 덮밥류도 든든하고 맛있어
요~ 이번엔 포장해서 먹었는데 국물, 면 따로 포장해주셔서 집에와서도 맛있게 먹었어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1628, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1629, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1630, NULL, NULL, '굿', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1631, NULL, NULL, '규동 정말 맛있어요~~
그리고 사장님 힘내세요~^^', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1632, NULL, NULL, '중간맛, 매운맛 선택 할 수 있고 맛있어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1633, NULL, NULL, '부타동 먹었는데 고기랑 흰밥 밖에 안 들어가서 실망했어요. 밥이 소스링 섞어서 서빙되면 훨씬 밋있을 것 같아요.', NULL, 5, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1634, NULL, NULL, '맛있네요 친구랑 가기 좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1635, NULL, NULL, '면이 어떻게 이러지..?
겉 모양은 모형 플라스틴 면..
음식은 눈으로 먼저 먹는다는데 눈노맛이네요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1636, NULL, NULL, '치킨동 최고', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1637, NULL, NULL, '치킨동 최고', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1638, NULL, NULL, '맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1639, NULL, NULL, '돈코츠 라멘 매운 정도와 진한 정도를 내 입맛에 맞게 선택할 수 있고, 가격도 착해서 정말 좋아하는 곳입니다~', NULL, 5, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1640, NULL, NULL, 'So so~
여기 단무지랑 생강 맛있어요.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1641, NULL, NULL, '치킨동이 나쁘지 않았다. 라멘은 맵게 먹으면 시원하게 매움.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1642, NULL, NULL, '일본 현지 라면이랑 비슷한느낌.
향이좀 세고 짜요. 호불호가 좀 갈리는맛', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1643, NULL, NULL, '성대 자과캠 라멘 맛집', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1644, NULL, NULL, '진짜 자주가는 식당인데 오늘은 친구들 죄다 델꼬 갔네요. 친구들도 대만족. 왠지 우쭐해짐? ㅋㅋㅋ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1645, NULL, NULL, '소유라멘 매운맛 맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1646, NULL, NULL, '챠슈동이랑 냉모밀 맛있어요ㅋ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1647, NULL, NULL, '라멘 맛집!! 이라고 기억하고 있었는데.. 오랜만에 가서 그런가.. 조금 기억과는 다른 맛과 향.. ㅠㅜ 돼지냄새가.. 많이 났어요.. 그리
고 처음 시킨 냉라멘.. 다른 리뷰에는 계란도 있던데..없어졌나봐요.. 그래도 규동은 맛있었어요..', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1648, NULL, NULL, '라멘이랑 가츠동 먹엇는데 라멘국물 맛잇어요. 가츠동도 돈까스 두껍고 소스도 괜찬앗어요. 근데 차슈는 좀 뻑뻑한거 같아요.', NULL, 5, NULL, 'NAVER',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1649, NULL, NULL, '진짜 너무 맛있어요 최고 짱', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1650, NULL, NULL, '맛잇어요 저렴하고 ㅎㅎ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1651, NULL, NULL, '덮밥이 맛있어요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1652, NULL, NULL, '예전 맛이 아닙니다. 국물도 맹물수준이고 매운맛도 캡사이신으로 만든맛입니다. 예전 위치에 있을때부터 자주 찾던 식당이였는데 오랜만에 오니 맛이 완전 별로네요',
        NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1653, NULL, NULL, '음 그저그래요 가격은 착해여', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1654, NULL, NULL, '라멘, 덮밥류 모두 맛있어서 자주 방문합니다 ㅎㅎ', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1655, NULL, NULL, '맛있습니다~!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1656, NULL, NULL, '맛있습니다~~~~~~~~', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1657, NULL, NULL, '좋아요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1658, NULL, NULL, '늘 맛있고 친절해요', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1659, NULL, NULL, '성대맛집인정 👍👍
맛잇게잘먹습니다', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1660, NULL, NULL, '서울로 이사갔다 간만에 기억나서 들른 미가.. 분위기가 확 바뀌어서 딴집인줄. ㅋ 진짜 몇년만인데 사장님이 기억하고 반겨주니 완
전 감동~^^ 역쉬 다시 먹어봐도 변함없는맛~~♡ 학교근처라 푸짐하고 가격착하고!! 사장님 망하면 안됩니다~ 또 올거니까요~^^', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1661, NULL, NULL, '예전에 친구와 가서 먹었습니다.
 지금은 서먹하기도 하고, 잘 갈 일이 없긴 한데 이 일본식 라면집 맛보다 잘 하는 집은 아직까지 가 본 적이 없어서 다시 가고 싶습니다.', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1662, NULL, NULL, '푸짐하고 맛있습니다!', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1663, NULL, NULL, '계란 맛집', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1664, NULL, NULL, '', NULL, 5, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1665, NULL, NULL, '카라이미소라멘 맛집', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1666, NULL, NULL, '일식 좋아하시는 분들은 믿고 가도 좋아요.
사장님? 친절함
가격? 저렴함
양? 푸짐함
음식? 맛있음
안 갈 이유? 없음', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1667, NULL, NULL,
        '혼밥 미소라멘 혼자먹어도 음식은 맛있어요 알바생은 좀 불친절해요 혼자온 손님한테만 뭔가불친절한 느낌을받았어요 뒤이어온 혼자온 손님들한테도요 메뉴판주고 딱한마디 키오스크주문하세요 물도 반만채워있는 물통을 갖다주고 다음온 2명이상 손님들은 따로 키오스크없이 주문을 받아주더군요..그럼 키오스를 왜만들었는지는 이해가안갑니다 번창하세요',
        4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1668, NULL, NULL, '라멘은 키와마루아지 승..
뭐랄까 여기는 육수가 라멘이 아니라 라면 국물 느낌이에요 진하다기보다는 그냥 미각만 자극하는 맛 그리구 개인적으로 차슈도 키와게 좀 더 제 스타일이었어요
그치만 친절, 위생은 미가 승

다들 주문하시는거 봐도 그렇고, 여기는 라멘보다 덮밥류가 맛있는것 같더라구요? 담번에는 규동 먹어보려구요', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1669, NULL, NULL, '오랜만에 갔는데 규동 탄부분이...ㅜㅜ
그래도 사장님 좋으신분이거 아니까...', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1670, NULL, NULL, '여기 규동이 제일 맛잇음', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1671, NULL, NULL, '라멘 걍 개맛있음 무조건 매운맛에 진하게', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1672, NULL, NULL, '성대 맛집 ㅇㅈ
밥약은 무조건 여기', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1673, NULL, NULL, '가성비 좋아요
매운거 잘 못먹어서 둘다 보통맛으로 주문했는데
시오라멘은 매콤하게 주문하는게 좋을거 같네요
재방문의사⭕️', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1674, NULL, NULL, '라멘은 많이 먹어보지 않아서 어떻다고 말할 순 없지만 그래도 맛있었습니다', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1675, NULL, NULL, '', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1676, NULL, NULL, '여길? 굳이?', 1, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1677, NULL, NULL, '친절하고 무난하게 라멘 먹기 좋았습니다. ', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1678, NULL, NULL, '뭔가 영혼은 없는데 기본은 하는 맛
국물이 많이 뜨거웠음 더 맛있을텐데.. 금방 식음ㅜ', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1679, NULL, NULL, '맛도 좋고 가성비도 좋음', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1680, NULL, NULL, '주문메뉴: 미소라멘+규동세트

맛있고 가성비 좋음
분위기도 일본식으로 잘 꾸며둠
다만 좀 많이 짜서 덜짜게 해달라고 요구하는 게 더 좋을듯.', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1681, NULL, NULL, '시오버터라멘 세트주문했는데..덜매운맛시켰는데도..혀안이 얼얼함..
맛있는 매운맛도 아니고 시오라는게 깔끔한맛으로 먹는건데..본점이 이지경이면..ㅠ
그기다 가게안에 들어서자..돼지냄새가..와우...
왠만해서 국물안남기는데...ㅠㅠ', 1, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1682, NULL, NULL, '가격도 저렴하고 맛있고 가성비 최고에요', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1683, NULL, NULL, '맛은 좋음 라멘과 규동이 아주맛잇음', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1684, NULL, NULL, '미가 왜가..', 2, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1685, NULL, NULL, '양적당 친절 크로켓맛있음
정통돈코츠라고했는데
하나도 진하지 않았어요ㅜㅜ아쉽', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1686, NULL, NULL, '모자 착용 안 함 마스크 착용 안 함', 1, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1687, NULL, NULL, '율전 즈언통의 일식집이지만 요즘엔 일식집 여기보다 좋은데가 많이 생겨서 잘 고려는 안됩니다. 하지만 평타는 칩니다.', 4, 5, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1688, NULL, NULL, '성대역 근처 일본식 라면집
- 맛은 괜찮았음
- 국물이 조금 진한편

- 양이 적음', 4, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1689, NULL, NULL, '맛 변함', 1, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1690, NULL, NULL, '맛있어욤', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1691, NULL, NULL, '', 3, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1692, NULL, NULL, '', 2, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1693, NULL, NULL, 'ㄱ', 2, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1694, NULL, NULL, '가성비가 좋긴 좋은듯..
돈코츠라멘, 쇼유, 시유 모두 괜찮은 듯..
차슈동도 정말 맛있다는 추천을 받았으니
먹어봐야겠다.', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1695, NULL, NULL, '', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1696, NULL, NULL, '성대인의 점심 핫플레이스 ㅎㅎ 가성비갑', 5, 5, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1697, NULL, NULL, '약 100통 전화해서 예약성공해서 먹고왔어요!!
양많아서 다 못먹으면 어쩌지 걱정했는데ㅋㅋㅋㅋ 딱적당했어요
월남쌈이랑 볶음밥이특히 맛있었어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1698, NULL, NULL, '안녕하세요 배서방 장모에요.^^ 오랜만에 딸과 가서 맛있게 월남쌈 먹고 왔네요. 가서 먹다 보면 주변 다른 방문객들도 도란도란
대화하며 즐거움이 느껴지는 식사 자리가 되더라구요. 하나 먹다보면 그다음것을 기다리는 즐거움을 만끽하며 여유있게 먹고 왔습니
다. 다음에 또 즐거움 주는 식사가 기다려집니다. 건강하시고 다음에 봬요.^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1699, NULL, NULL, '예약이 치열해서 궁금해서 가봤는데 만족~ 사장님도 친절하시고 무엇보다 가성비 무지 좋아요~ 손님올때 포장해서 이용해도 좋을
것 같아요. 정성이 느껴지는 집이이에요~잘 먹었습니다^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1700, NULL, NULL, '성대 근처 추천받은 맛집. 라이스페이퍼에 싸먹는 베트남 쌈에 칼국수, 볶음밥 세트가 나옴. 맛도 개안고, 사장님도 친절해서 만족스
러움. 1인 13000원이면 무난하다 생각됨. 추천..', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1701, NULL, NULL, '매장에서 먹고 맛있어서 포장도 이용해봤어요! 포장도 미리 예약 해야 하는데, 양이 정말 푸짐해요!! 소스도 모자라지 않게 듬뿍 주
셔서 집에서도 맛나게 너무 잘 먹었답니다💕🥰👍', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1702, NULL, NULL, '예약필수 가성비좋은 곳입니다 사장님도친절하시게 먹는방법까지 알려주시네요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1703, NULL, NULL, '사장님이 친절하시고 월남쌈이 진짜 맛있어요❤️', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1704, NULL, NULL, '사장님친절 푸바오할배같은분위기
👍 👍 👍', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1705, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1706, NULL, NULL, '수원에 월남쌈 숨은 찐 맛집이 확실하네요! 월남쌈 잘 못싸먹는 남자들은 친절하게 잘 알려주셔서 정말 맛있게 잘 먹었어요! 아침 9
시에 예약 전쟁 이지만 너무 괜찮고 가성비도 좋아서 성공만 된다면 자주 가고 싶어요!👍🫶🥰🙌💕', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1707, NULL, NULL, '친절해요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1708, NULL, NULL, '첫방문이었는데 넘 만족스러워요💓 재료들이 신선하고 나오는 메뉴들마다 다 맛있었습니다 ! 친절하신 사장님도 최고셔요👍 다음
에 전화 예약 성공해서 또 방문하겠습니다:)', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1709, NULL, NULL, '정말 맛있고 정성스러운 음식입니다.', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1710, NULL, NULL, '이번에는 점심에 방문했어요~ 포장주문도 전화로만 가능하기에 2인세트 홀에서 먹구요~ 2인 포장은 저녁으로 먹었답니다~~^^
ㅎㅎ 오늘도 넘 만족스런 식사였어요😍😋', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1711, NULL, NULL, '친절하고 자세하게 설명해주시는 사장님
최고! 음식도 양 엄청 많고 혜자에요❤️
솔직히 가격 올리셔도 될듯 ㅎㅎ 넘 맛있게먹었어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1712, NULL, NULL, '맛과 행복 모두를 파는 식당', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1713, NULL, NULL, '가성비 최고!!! 예약이 넘나 힘든거 빼면 다다다 만족스러워요>_<', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1714, NULL, NULL, '예약하기 힘든 곳 그래도 꼭 가봐야 할 음식점 맛도 좋고 가격도 양도 다 만족 가성비 👍', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1715, NULL, NULL, '가성비 짱!
언제나 앟 보장', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1716, NULL, NULL, '굿', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1717, NULL, NULL, '진짜 여기 강추예여👍🏻👍🏻 예약이 힘들지만 힘들었던거만큼 보람있었어여❤️', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1718, NULL, NULL, '너무맛있게 먹었어요~ 양도 많아요
또 전화 예약 잘되서 가고싶어요~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1719, NULL, NULL, '친절해요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1720, NULL, NULL, '월남쌈 쌀국수 볶음밥 분짜 까지 인당 12000원에 즐길 수 있어서 좋았어요 전화 예약 250번 만에 성공했습니다 느긋하게 1시간
정도 여유를 가지면서 이야기도 하니 좋았습니다 사장님이 교수님스타일로 먹는 방법 설명해주시고 시연도 해주셔서 재밌습니다', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1721, NULL, NULL, '여기 가려고 수원가요
아침9시에 전화예약이 짜릿해요
친절하고 가성비 미친집', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1722, NULL, NULL, '너무 좋아요!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1723, NULL, NULL, '너무 맛있게 잘 먹었습니다~~!!! 조만간 예약 성공해서 또 방문하고 싶어요. 최고!!! 사장님께서 친절하게 먹는방법두 알려주시고 쌀
국수, 볶음밥, 튀김도 그때마다 바로 만들어 주시니 더 맛있는 거 같아염😋', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1724, NULL, NULL, '사장님께서 월남쌈 제대로 먹는 방법을 친절하게 설명해주셔서 맛있게 잘 먹었어요😋 월남쌈이 생각날 때 이곳을 찾아요 앞으로도 번창하시길 바라요!', NULL, 6,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1725, NULL, NULL, '2인세트가 월남쌈+쌀국수+볶음밥+튀김입니다. 먹느라 급해서 월남쌈만 찍었는데.. 저 혜자스러운!!!!
쌀국수도 볶음밥도 배부른데 잘 들어가네요.. 결국 배가 나옴
9시부터 9시10분안에 예약을 완료해야한단 생각으로 80통정도! 후회없고 또 갈만합니다(절대 후회할집 아니예요)', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1726, NULL, NULL, '사장님의 정성이 가득담긴 음식들이예요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1727, NULL, NULL, '예약하기 힘든곳인데 운좋게 다녀왔어요
친절한 사장님이 계신곳이네요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1728, NULL, NULL, '사장님 친절하시고 푸짐하고 신선하고 맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1729, NULL, NULL, '맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1730, NULL, NULL, '단골맛집~가성비 짱 정말맛나용', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1731, NULL, NULL, '재료가 신선하고 음식이 매우 맛있어요
양도 굉장히 푸짐합니다
또 방문할 예정입니다', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1732, NULL, NULL, '성대역 월남쌈으로 유명한 맛집이예요~ 매일 오전9시부터 전화로만 예약가능한 곳으로 몇일 시도한 끝에 예약되어 갔어요^^ 야채
신선하고 볶음고기3종류 접시가 넘치도록 줘서 월남쌈 원없이 먹고 쌀국수 볶음밥 튀김까지 코스로 잘먹었어요~ 저렴한 가격에 맛
도 짱이고 사장님께서 맛있게 먹는법도 알려주시고 너무 행복한 식사 시간이었어요^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1733, NULL, NULL, '어머니가 월남쌈 좋아하셔서 가봤는데
정말 좋았어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1734, NULL, NULL, '사장님도 친절하시고 월남쌈 너무 맛나용', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1735, NULL, NULL, '아침 9시 땡하면 당일 전화 예약만 받아요. 저는 2주만에 성공했어요. 근데 그럴만한 가치 있습니다. 모든 음식 다 맛있고 죽기전에 한 번 가 볼만한 음식점입니다',
        NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1736, NULL, NULL, '방문예약이 이제 안돼서 전화예약만 가능한데, 예약이 매우 힘들어요 !
그래도 힘든만큼 너무 너무 만족스러웠어요 ❤️ 메인 월남쌈이 엄청 신선하고 맛있었어요 양도 엄청 많아서 남겼답니다,, 그리고 사장님 너무 친절하세요 많이 버세요 사장님 :)', NULL, 6, NULL,
        'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1737, NULL, NULL, '친절하고 양많고 음식도 적당히 맛있는데 예약이 너무 힘들고 예약이 너무 힘들어요….', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1738, NULL, NULL, '유명한곳은 이유가 있네요 예약은 어렵지만 그만큼의 가치가 있는곳 사장님도 너무 친절하시고 월남쌈에 쌀국수 볶음밥 튀김까지
배가 찢어질것 같았지만 채소라서 속은 편한느낌이었어요 부모님이랑 함께 갔는데 너무 만족하셨고 채소도 다양하게 먹은 건강하고
맛있는 한끼였습니다💜', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1739, NULL, NULL, '음식이 셋팅되어 있어 넘 졸고 가성비가 넘 좋아요^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1740, NULL, NULL, '맛있고 가격이 저렴해요~ 강추!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1741, NULL, NULL, '눈으로 먼저 먹고 양 푸짐..사장님께서 맛있게 먹는법 친절히 알려주시고 소스도 다양~양껏 먹고 왔습니다 한번더 가고 싶어요~ 예
약은 필수입니다', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1742, NULL, NULL, '오우 예약하기 어려워서 그런지 더 맛있네요!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1743, NULL, NULL, '너무 맛있게 먹고 왔습니다 사장님 감사히 잘 먹었어요 설명도 정말 감사드리고요~~ 사장님의 정성이 느껴지는 소중한 음식~~ 이
렇게 감사한 마음이 드는 음식은 처음인것같아요~~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1744, NULL, NULL, '맛도 좋고 가성비 좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1745, NULL, NULL, ',', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1746, NULL, NULL, '언제나 친절하심, 항상 신선하고 맛남. 양도 푸짐하고 넉넉함. 자주 못가는 건 치열한 예약 전화ㅜ 사장님, 건강하시고 오래도록 번창하세요^^', NULL, 6,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1747, NULL, NULL, '하… 진짜 너무 맛있어요🫶🏻
정말 너무 맛있어요🤍
그냥 너무 맛있어요💛', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1748, NULL, NULL,
        '진짜 인생 맛집입니다! 사장님 너무 친절하시고 재료 하나하나가 너무 신선해요.. 사장님 진짜 적게 일하시고 돈 많이 버셨으면 좋겠어요 엉엉 꼭 가보세요 진짜 최고 예약이 힘든 만큼 가치가 있어요 정말 정말로요ㅠ',
        NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1749, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1750, NULL, NULL,
        '예전부터 알았던 집이지만 예약할 엄두가 나지 않아서 도전하지 못하다가 첫 도전에 성공해서 방문했어요 사장님 엄청 친절하시고 월남쌈을 배부르게 가성비 좋게 먹을 수 있어요 오히려 쌈채소를 남기고 와서 죄송한 마음이..',
        NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1751, NULL, NULL, '가성비 좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1752, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1753, NULL, NULL, '힘들게 예약하고 간 만큼 보람있었고, 맛있게 잘 먹고 왔습니다.', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1754, NULL, NULL, '일부러 먹으러 찾아감…. 양도 많고 가성비 진짜 대박… 사장님이 친절하게 먹는법도 알려주심 ㅠㅠㅠ 아쉬운점은 주차장 없음, 쌀국
수랑 소스맛은 우리가 생각하는 맛이랑 다름! 그래도 재방문 의사 있어요!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1755, NULL, NULL, '여기 갈려면 아침 9시에 전화 100통은 넘게해야 돼유 근데 너무 맛있고 양 많고 사장님 친절해서 갈수만 있다면 200통도 할 수 있어요ㅠ 존맛', NULL, 6,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1756, NULL, NULL, '전화하기 힘들었지만..
그만큼 맛있어요~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1757, NULL, NULL, '가성비 끝판왕', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1758, NULL, NULL, '단일 셋트 구성으로
베트남 가정집에 초대받은
느낌이 좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1759, NULL, NULL, '17번의 시도끝에 당장 찾아갈수있게된 쟈스민 사장님의 친절함과 음식의 소름끼칠정도의 맛있는맛 그리고 느껴지는정성.... 이곳을
알게되어 영광입니다 오늘 조금 늦어서 사장님께 옐로우카드받았지만 너무 행복한시간이었습니다 감사합니다^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1760, NULL, NULL, '넘 맛잇어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1761, NULL, NULL, '좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1762, NULL, NULL, '맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1763, NULL, NULL, '친절한 사장님의 설명과 함께 맛있는 음식 조아요~
담에 또가고싶은곳인데 예약하기 하늘의 별따기예요 또 별 따고 싶어요~~~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1764, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1765, NULL, NULL, '주인아저씨 친절하게 더 맛나게 먹는 법도 아려주시고 음식은 신선하고 양도 많고
배가 불러 걱정이 되었네요
굿굿굿 입니다', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1766, NULL, NULL, '진짜 양많고 맛있어요 예약 잡기 어렵지만 재방문 또 하고 싶네요!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1767, NULL, NULL, '신선하고 푸짐하고 사장님도 친절하세요♡', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1768, NULL, NULL, '사장님께서 매우 친절하시고 음식도 깔끔하고 맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1769, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1770, NULL, NULL, '단골집 쟈스민 넘 맛나용~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1771, NULL, NULL, '맛나요가성비갑^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1772, NULL, NULL, '좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1773, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1774, NULL, NULL, '맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1775, NULL, NULL, '정말 진짜 너무 맛있어요💛', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1776, NULL, NULL, '사장님 정말 친절하세요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1777, NULL, NULL, '깔끔한 음식 정말 가성비 좋게 먹었습니다 ㅋㅋ', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1778, NULL, NULL, '최고! 맛있고 사장님도 완전 친절하세요 👍', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1779, NULL, NULL, '너무 맛나고 사장님 넘 친절하세요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1780, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1781, NULL, NULL, '가성비좋고 특별해요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1782, NULL, NULL, '너무 맛나용 ~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1783, NULL, NULL, '친구찬스로 전화 146번만에 쟈켓팅 성공!! 세트메뉴 가성비도 좋고 푸짐하고 월남쌈 맛도 좋아요 🤍 사장님께서 알려주시는데 넘 친절하시답니다ㅠ', NULL, 6,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1784, NULL, NULL, '신선해요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1785, NULL, NULL, '사장님 진짜 왕친절👍 소스에 대해서 잘 알려주시고, 가성비가 너무 좋아요👍👍 월남쌈, 쌀국수와 볶음밥 너무 맛있어요 수원살
면 자주 가보고 싶은곳!👍 주차장이 없는게 아쉽지만 재방문의사는 100%입니다!!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1786, NULL, NULL, '모든 메뉴가 다 맛있어요~예약 정말 힘들게 했는데 너무 조아용 사장님도 너무 친절하시고 최고에요~!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1787, NULL, NULL, '재료 신선하고 너무 배부르게 맛있게 잘 먹었어요~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1788, NULL, NULL, '맛있어요! 예약하고 먹을만해요 추천합니다!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1789, NULL, NULL, '예약제라서 차분한분위기였음~사장님 맛있게 먹는방법 친절하게 알려주심~월남쌈 야채푸짐하고 계속나오는사이드메뉴들도 맛있네요.맛있고 풍성한 한끼였습니다', NULL, 6,
        NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1790, NULL, NULL, '월남쌈을 진짜 좋아하는데 너무너무 맛있게 먹었어요! 특히 사장님이 너무 친절하세요~!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1791, NULL, NULL, '예약 없이 못오는 맛집입니다!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1792, NULL, NULL, '음식도 맛있고 사장님도 친절하세요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1793, NULL, NULL, '짱 맛있어요.강추!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1794, NULL, NULL, '푸짐하고 맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1795, NULL, NULL, '베리굿', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1796, NULL, NULL, '가성비매우굿
남는게있을까 사장님께 죄송스러움', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1797, NULL, NULL, '소스도 직접 만드시고 알려주신방법대로 먹어보니까 너무너무 맛있어요!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1798, NULL, NULL, '사장님도 친절하시고 가격이나 맛이나 만족 못한 적이 없네요.', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1799, NULL, NULL, '좋아요~~', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1800, NULL, NULL, '좋이요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1801, NULL, NULL, '맛, 착한가격, 푸짐한 구성, 친절하신 사장님까지
모든게 완벽하다', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1802, NULL, NULL,
        '몇년 만에 갔는데, 아침 9시에 전화해서 예약 성공하고 갔어요!! 넘 맛있게 먹었습니다!! 이 가격에 이 퀄리티 말도 안 돼요 ㅠㅠㅠ 진짜 다 맛있고 사장님 넘 친절하셔요!! ㅎㅎㅎ', NULL,
        6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1803, NULL, NULL, '율전맛집', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1804, NULL, NULL, '정말맛나용', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1805, NULL, NULL, '완전 강추입니다! 맛있어요!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1806, NULL, NULL, '정말 맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1807, NULL, NULL, '좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1808, NULL, NULL, '정말 힘들게 예악함. 가성비 좋음', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1809, NULL, NULL, '좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1810, NULL, NULL, '찐맛집!!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1811, NULL, NULL, '야채가 미리 준비해놓아서 좀 말라있어요. 소스는 다양하고 국수랑 볶음밥 맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1812, NULL, NULL, '굿', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1813, NULL, NULL, '맛있음', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1814, NULL, NULL, '사장님 혼자 하셔서 전화 예약해서 먹었습니다~^^ 저희가 처음 월남쌈 먹어본다니까 손수 싸는 방법 알려주셨어요~ 맛도 정갈하고
 코스로 먹었는데 굉장히 배불러서 아쉽지만 남겼습니다. 다음에 재방문할 의사 100프로입니다~^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1815, NULL, NULL, '맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1816, NULL, NULL, '가격대비 양도 푸짐하고 특히 월남쌈이 진짜 진짜 맛있어요! 부모님이랑 다시 방문 예정입니다♥️', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1817, NULL, NULL, '사장님 적게 일하시고 많이 버세요👍👍💓', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1818, NULL, NULL, '늘 양도 많고 맛있어요!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1819, NULL, NULL, '저렴하고 맛나고 좋은데 예약하기가 넘 힘들어용', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1820, NULL, NULL, '사장님 혼자 하시는 곳인데 양도 푸짐하고 정말 맛있어요.', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1821, NULL, NULL, '지금까지 먹었던 월남쌈과 비교불가. 예약이 힘들어서 못가봤는데 진짜 가성비 갑이고 맛도 👍', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1822, NULL, NULL, '굿', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1823, NULL, NULL, '사장님 넘 친절하시고 음식도 맛있어요~ 배부르게 먹고 왔습니다', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1824, NULL, NULL, '', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1825, NULL, NULL, '단골~ 예약만되면 무조건 가서 먹어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1826, NULL, NULL, '오랜만에 갔는데 여전히 변함없는 맛!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1827, NULL, NULL, '7-8년만에 재방문 했어요! 아저씨 전과 같으시고 정말 좋으세요♥ 물론 맛도 최고봉입니닷!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1828, NULL, NULL, '오랜만에 갔는데 역시 맛있네요! 다음에 또 예약해서 갈게요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1829, NULL, NULL, '♡♡♡♡♡쌀국수♡♡♡♡♡', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1830, NULL, NULL, '진짜 너무 맛있어요!!!!!', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1831, NULL, NULL, '맛있어요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1832, NULL, NULL, '진심 너무 맛있어요 혜자집', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1833, NULL, NULL, '가격, 양, 맛 혜자스럽네요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1834, NULL, NULL, '예약 안하면 못 먹어요. 먹어본 월남쌈 중에 최고였어요. 사장님께서 맛있게
쌈 싸는법도 가르쳐주시고 친절하세요. 또 가고싶어요.', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1835, NULL, NULL, '여긴 진짜 월남쌈 맛집입니다. 20번은 더 간듯...
먹고나와도 바로 또 생각나는집', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1836, NULL, NULL, '레전드 식당 중 하나', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1837, NULL, NULL, '쟈스민은 말이필요없죠... 쟈스민 생각하면 다른데서 아무것도 못사먹겠어요ㅠㅠ 최애음식 하면 무조건 소고기였는데 이젠 쟈스민이
에요.. 맨날 먹어도 안질려요 다른데서 월남쌈 절대 못먹어요 사장님 제발 오래오래 해주세요ㅠㅠ', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1838, NULL, NULL, '하루에 점심, 저녁 한 타임씩만 하는 곳
당일 예약만 아침 9시부터 받는 예약 힘든 맛집😆', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1839, NULL, NULL, '월남쌈이랑 쌀국수랑 볶음밥이랑 튀김이랑 진짜 너무 다 맛있어요 가격도 저렴하고 최고👍👍👍💞💞', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1840, NULL, NULL, '예약하기 어려운 것만 빼면 가성비좋아요', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1841, NULL, NULL, '너무 맛있습니다', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1842, NULL, NULL, '월남쌈이 맛있는 집입니다^^', NULL, 6, NULL, 'NAVER', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1843, NULL, NULL,
        '예약 잡는것이 유일한 단점. 눈과 입이 즐거운 월남쌈, 파인애플이랑 여러 소스가 잘어울림. 월남쌈을 좋아하는 편이 아닌데 정말 맛있게 먹음. 쌀국수는 적당히 깊은 국물에 속을 데워주고 볶음밥은 훌륭하다. 쟈스민차를 계속 마실수 있는게 좋았다. 평이 너무 좋아서 갸우뚱했는데 납득가능',
        5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1844, NULL, NULL,
        '평생 가고 싶은 맛집 &bull;&bull;😋 월남쌈 - 쌀국수 - 볶음밥 - 튀김 이렇게 나오는데 가격 넘 착하고, 사장님도 진짜 친절하세요 !!! 월남쌈은 무조건 쟈스민에서 .. 🤍 꼭 드셔보세용 ~~! ',
        5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1845, NULL, NULL, '인생맛집월남쌈 ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1846, NULL, NULL, '진짜 신이내린 가성비수준에
적자날까 걱정됩니다ㅠㅠ
너무 맛있고 좋았어요...', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1847, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1848, NULL, NULL, '완벽한 월남쌈, 슴슴한 쌀국수, 기름진 볶음밥, 튀김의 구성
양은 넘쳐나며, 맛은 평범한 월남쌈인 것 같지만 노력이 주입당해 특별하다.
쌀국수, 볶음밥, 튀김 또한 평범하며 단순하지만 월남쌈과 곁들여 먹기에 충분하다.
예약제에 전문적인 사장님이 더해져 특별하게 만들어진 가게다.', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1849, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1850, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1851, NULL, NULL, '맛도있고 가성비최고 이가격에 이양은 혜자
예약이 넘 힘든 단점이있지만 예약 성공기원하며 화이팅', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1852, NULL, NULL, '수원 최고의 맛집 !! ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1853, NULL, NULL, '배터지게먹고각만이천원
심지어 한 번 갔다오면 안 친한 학교 사람들한테 스몰톡거리 제공 ㄷ ㄷ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1854, NULL, NULL, '아침 9시 예약만 성공한다면 산뜻하고 건강한 베트남 코스 요리를 저렴하고 배불리 먹을 수 있다.', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1855, NULL, NULL,
        '지난번에 일행 중에 저 혼자 약속 시간보다 늦게 도착했었는데요  먹다보니 가게 문 닫을 시간에 가까워졌음에도 불구하고 천천히 먹으라며 웃어주시던 모습에 너무 면목없는 한편 진심으로 감사했습니다..ㅜ 음식도 정말정말 맛있었어요! 조만간 또 가겠습니다🥺🥺',
        5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1856, NULL, NULL, '아침 예약 전쟁을 치루고도 가고 싶은
찐 맛집이에요. 🫶👍🥰💕

사장님이 친절하시고 월남쌈 잘 못싸먹으면
잘 알려주세요 자부심이 있으신거 같았어요.

월남쌈 쌀국수 볶음밥 튀김까지
1인 12,000원인데 가성비 미쳤쥬..
정말 수원에 숨은 월남쌈 맛집 인정이에요!

', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1857, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1858, NULL, NULL, '정말 착한 가격과 맛있는 음식들 그리고 친절하신 사장님으로 삼위일체 폼 미쳤다

유일한 단점은 예약이 힘들다이지만
힘든만큼 값어치가 있는 가게입니다', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1859, NULL, NULL, '가성비가 이만한 식당이 전국에 몇이나 될까?', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1860, NULL, NULL, '이 시대의 참된 가성비 맛 좋은 건강 식당! 예약이 어려워서 그렇지, 완벽합니다. 월남쌈에 집중 또 집중', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1861, NULL, NULL, '예약이 힘들지만 친절 하고 신선하고 ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1862, NULL, NULL, '레전드!', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1863, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1864, NULL, NULL, '예약하기가 어렵지만 예약할 가치가 있는 가성비 월남쌈 맛집입니다. 5년째 방문하고 있어요.', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1865, NULL, NULL, '사진은 3인 셋트.
변함 없이 맛있었음. ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1866, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1867, NULL, NULL, '지금까지 샤브샤브집에서만 월남쌈을 먹었었는데
자스민 예약하고 가보니 정말 찐 월남쌈을 먹어볼 수 있던거같아여!!
소스도 칠리만 먹었었는데....사장님이 친절하게 월남쌈 200%즐기는법 알려주십니다ㅎㅎ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1868, NULL, NULL, '올 수만 있다면 매주 오고 싶은데&hellip;예약ㅠㅠ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1869, NULL, NULL, '사진은 2인세트입니다 명불허전이고 저는 이번주에 또 갑니다', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1870, NULL, NULL, '예약이 너무 힘들었습니다. 아침 9시 부터 우리가족 셋이서 계속 전화... 운좋게 계속전화해서 12분만에 예약이 되었습니다.
결론적으로 매우 만족하게 잘 먹었습니다. 집사람과 큰아들 모두 만족해하네요', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1871, NULL, NULL, '죽을때까지 잊지않것어요 쟈스민', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1872, NULL, NULL, '이 퀄리티를 이 가격에?!
가고싶어도 예약하기 어려운 집
또 가고싶어~~!', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1873, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1874, NULL, NULL, '완전맛있었다..', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1875, NULL, NULL,
        '두번째 방문. 가족끼리 방문하여 정말 맛있게 먹었습니다. 음식이 담백해요. 월남쌈-쌀국수-볶음밥-후식(춘권 등의 튀김) 코스로 나오는데, 양이 많아서 배부르게 먹고도 남긴 음식은 싸주셨어요. 아침에 전화 예약은 여전히 치열하더군요~ ',
        5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1876, NULL, NULL, '3월에만 벌써 3번이나 갔네요
진짜 여태 먹었던 월남쌈은 아무것도 아니였던걸로,,,
제발 사장님 오래 장사해주세요ㅠㅠ
야채도 너무 푸짐하고 구성도 너무 좋아서
도대체 남는게 있을까 싶은 곳입니다
예약하기 어려워서 그렇지 ㅠㅠ 진짜 매일먹고싶은 맛...
쓰면서 또 먹고싶다...하ㅠㅠㅠ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1877, NULL, NULL, '세번 넘게 방문했어요!
예약은 초콤 힘들지만 그만한 가치가 있습니다🥰
사장님 정말 친절하세요 ㅎㅎ
양 엄청 많아서 두끼는 굶고 가야 합니다,,
저는 한번도 다 먹는걸 성공해본 적이 없어요
쟈스민 짱🥰', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1878, NULL, NULL, '가성비 엄청나고 아저씨 엄청 친절해요 나만 알고 싶음... 유일한 단점은 예약이 힘들다는 것뿐...

다른데서 이렇게 사먹으려면 4만원이상 나올듯', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1879, NULL, NULL, '아침에 어렵게 예약 성공하고 다녀왔는데요 월남쌈 양도 많고 너무 맛있구요 사장님이 친절하게 먹는 법도 알려주셔서 더 맛있게 먹었네요
가성비 너무 좋은 맛집입니다😄', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1880, NULL, NULL, '너무 좋았습니다 사장님 정말 친절하시고 음식도 너무 깔끔하고 맛있습니다', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1881, NULL, NULL, '깔끔한 쌀국수 월남쌈집 ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1882, NULL, NULL, '아침9시 예약에 성공하셨다면.....배고프게하고오세요~~ 가성비끝판왕 월남쌈에 무난한 쌀국수, 볶음밥까지!!!! 사장님 친절은 덤입니다^^ 배터지겠네요ㅋㅋㅋ', 5,
        6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1883, NULL, NULL, '신선하고 소스다양하고 다맛있어요 🥲🥲ㅠㅠㅠㅠ사장님 건강하세요 ❤️', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1884, NULL, NULL, '그저 갓', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1885, NULL, NULL, '월남쌈 최고', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1886, NULL, NULL, '베트남 요리의 코스..진짜 완벽한 가성비와 맛
사장님 너무 좋으신 분 같아요 ... 감동받고 갑니다!!! 더 대박나시고 언제나 건강하세요!!!

', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1887, NULL, NULL, '이만한 집 없음', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1888, NULL, NULL, '예약은 힘들지만,
수원 성대에서 제일 가성비 좋고
즐겁게 먹을 수 있는 장소.

이 근처 지냈으면 한 번은 꼭 들려봐야하는 추천식당.
', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1889, NULL, NULL, '월남쌈 대존맛집 싸장님 알라뷰
오래오래 건강하게 운영해주세요 ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1890, NULL, NULL, '월남쌈 먹고 싶으면 무조건 가는 집!
솔직히 쌀국수는 좀 별로...
근데 볶음밥이 미쳐씀.. 후식으로 주시는 튀김도 jmt', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1891, NULL, NULL, '', 4, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1892, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1893, NULL, NULL, '2020년 7월 ⭐⭐⭐⭐⭐ -&gt; 수정
운좋게 예약이 되어 저녁식사함

맛과 푸짐한 양, 서비스까지 모든게 완벽..
정식세트는 코스요리였다.. 차근차근 나오니 허겁지겁 다 먹으면 나중에 나오는 요리들 다 못먹어요~~

예약잡기 힘들어 먹기힘든게 슬프다ㅠㅠ
재료손질 어떻게 이렇게 예쁘게 하실 수 있나요...

예약전화할 때 사장님 넘 젠틀하시다고 생각했는데,
식사 후에 쏘스윗하신걸로 결론내림
하지만 넘치는 친절이 아니라 절제된 친절?ㅎㅎ

월남쌈 물에 적시는 것도 못하는 걸 보시곤
직접 하나하나 올려주시고 쌈싸는 법까지 알려주셨다..
나중에 잘 싼거 보시곤 그렇게 하면 된다고 칭찬해주시고ㅎㅎㅎ 감사합니다❣

---------------------------------------

2022년 ⭐⭐⭐반
여전히 같은 사장님 같은 음식이지만
5점 만점 5는 아님에 정정함
가끔 가면 정말 맛있어요...', 4, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1894, NULL, NULL, 'ㅋㅋㅋㅋㅋ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1895, NULL, NULL, '먹을만함
정갈하게 나옴
튀김은 진짜 최악
쌀국수 무맛&amp;노맛
사장님이 자기 음식에 대한 자부심이 엄~~~~청 높음
굳이 예약하는 수고스러움을 갖고 갈만한 곳은 아님
', 4, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1896, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1897, NULL, NULL,
        '숨은 맛집. 타지역인데도 자주 방문하고, 타지역 사람들이 이 근방에 오면 여기 꼭 가라고 알려줌. 당일예약 선착순이어서 굳이 식당에서 안먹어도 된다면 포장을 권함. 소스가 5종류인데, 내 입맛대로 섞어 먹는 것이 이 집의 매력. 실패할 수가 없는 기분좋은 맛. 사장님의 월남쌈 싸먹는 방법을 꼭 알려주시고, 꼭 그렇게 먹으라고 권하시는 친절함과 장인정신도 멋지심. 남녀노소 다 좋아하는 맛.',
        5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1898, NULL, NULL, '리뷰30개 별점4.9점의 위엄.... 맛도 맛이고
가성비가 너무 훌륭하다보니 이런점수가 나온듯
사장님도 친절하시고 음식에 대한 자부심이 느껴짐
계절마다 바뀌는 월남쌈속재료들도 있음.
아 또먹고싶네.....', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1899, NULL, NULL, '예약하고 가는 보람이 있어요!', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1900, NULL, NULL, '친절하고 맛있어요', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1901, NULL, NULL, '주기적으로 한번씩 가는 제 기준 수원 최고의 맛집이에요ㅠㅜ 사장님이 음식에 자부심이 있으세요ㅎㅎ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1902, NULL, NULL, '저만 알고 싶은 집입니다. 아침마다 예약전쟁이예요.
정말 맛은 어느 월남쌈집도 여기 못따라가요. 너무 맛있어요. 가격도 싸고요, 사장님도 친절하세요.
정말 오래오래 했으면 좋겠어요 ㅠㅠㅠ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1903, NULL, NULL, '너무 맛있어요 매일 먹고싶어요...', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1904, NULL, NULL, '아침 9시부터 전화로 예약전쟁.
이유는 와서 먹어보면 알게 됨', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1905, NULL, NULL, '여긴 맛으로승부하시는곳
사장님혼자하셔서 노력이 대단하심', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1906, NULL, NULL, '맛있음 배부르고 근데 튀김기의 기름때와 전반적인 분위기를 보면 위생은 나쁨.', 4, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1907, NULL, NULL,
        '너무 맛있어요 ㅠㅠ 재료손질 크기 다 일정한거 보이시나요?? 처음 간거 티났는지 방법도 다 알려주시고 계산할때까지 친절하시고 유머러스하신 사장님 ㅋㅋ 양 엄청 많은데 재방문 하신 분들은 다 드시더라고요... 저도 다음에 올 땐 분발해보겠습니다',
        5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1908, NULL, NULL, '냐미', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1909, NULL, NULL, '', 4, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1910, NULL, NULL, '사장님 친절하시고 맛도 양도 좋습니다.
', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1911, NULL, NULL, '나만 알고 싶은 집. 사장님도 친절. 예약필수, 월욜쉼', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1912, NULL, NULL, '&lsquo;쟈스민&rsquo;을 빼놓고 월남쌈을 논하지 말라

', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1913, NULL, NULL, '맛있어서 항상 과식하게 돼요. ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1914, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1915, NULL, NULL, '여기가 최고가 아니면 어디가 최고지?', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1916, NULL, NULL, '진짜 너무 맛있어요 ㅠㅠ볶음밥 진짜 짱짱 ㅎㅎ당연히 쌀국수도 맛있어요! 나중엔 볶음 쌀국수도 한 번 해주시면 안될까요??', 5, 6, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1917, NULL, NULL, '그저 갓 가성비도 사장님 친절함도 맛도 ㅠ', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1918, NULL, NULL, '맛있고 양도많고 싸요!', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1919, NULL, NULL, '예약 시스템이 바꼈네요. 이제 대기없고 당일 9시에 전화가 되야한대요. 저처럼 11시 반인줄 알고 가서 대기하실까봐 알려드려요ㅠ', 5, 6, NULL,
        'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1920, NULL, NULL, '말이 필요없음ㅠㅠ 예약하고 가야함', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1921, NULL, NULL, '늘 맛있습니다!
다만 오늘 가니까 휴무일이 바뀌었더라구요. ㅠㅠ
일요일, 월요일 둘 다 쉰다고 하니 참고하시고
가격이 조금 올랐네요!!
헛걸음하지 마시라고 남깁니다', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1922, NULL, NULL, '', 4, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1923, NULL, NULL, '여기는 미미美味 입니다
', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1924, NULL, NULL, '음식 맛과 양 모두 만족이네요. 3인 세트(월남쌈, 쌀국수, 볶음밥) 먹고 3만원 내고 나오기 좀 미안할 정도였어요. 사장님의 뚝심과 맛에 대한 자부심이 대단하신것 같은데 실제 맛있었어요.

전화 통화도 잘 안 되서 가기 전엔 의문이었는데 가서 먹어보니 이해되네요. 사장님이 직접 서빙도 하시고 서비스가 좀 느린 편이고 늦으면 많이 기다려야 하지만 음식이 모든걸 상쇄합니다.  근처에 계신 분들은 꼭 가보세요. 뭐 이미 성대 인근에서는 맛집으로 소문난 곳이지요.
', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1925, NULL, NULL, '', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1926, NULL, NULL, '두말할 필요없이 맛,가격 최고. 하지만 시간맞춰 안가면 못먹을수 있음. 점심개장시간 11:30분 15분전에는 맞춰가는걸 추천', 5, 6, NULL, 'KAKAO',
        'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1927, NULL, NULL, '오늘 처음 갔고 ㅠㅠ 앞으로 꼭 자주 가렵니다~', 5, 6, NULL, 'KAKAO', 'VALID');


INSERT INTO review (id, created_at, last_modified_at, message, rating, store_id, user_id, review_platform, status)
VALUES (1928, NULL, NULL, '맛있어요 종종 찾아갑니다', 5, 6, NULL, 'KAKAO', 'VALID');
