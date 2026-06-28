CREATE TABLE order_stat (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    category VARCHAR(50), 
    product_name VARCHAR(100),
    price INT,
    quantity INT,
    order_date DATE
);

INSERT INTO order_stat (customer_name, category, product_name, price, quantity, order_date) VALUES
('이순신', '전자기기', '프리미엄 기계식 키보드', 150000, 1, '2025-05-10'),
('세종대왕', '도서', 'SQL 마스터링', 35000, 2, '2025-05-10'),
('신사임당', '가구', '인체공학 사무용 의자', 250000, 1, '2025-05-11'),
('이순신', '전자기기', '고성능 게이밍 마우스', 80000, 1, '2025-05-12'),
('세종대왕', '전자기기', '4K 모니터', 450000, 1, '2025-05-12'),
('장영실', '도서', '파이썬 데이터 분석', 40000, 3, '2025-05-13'),
('이순신', '문구', '고급 만년필 세트', 200000, 1, '2025-05-14'),
('세종대왕', '가구', '높이조절 스탠딩 데스크', 320000, 1, '2025-05-15'),
('신사임당', '전자기기', '노이즈캔슬링 블루투스 이어폰', 180000, 1, '2025-05-15'),
('장영실', '전자기기', '보조배터리 20000mAh', 50000, 2, '2025-05-16'),
('홍길동', NULL, 'USB-C 허브', 65000, 1, '2025-05-17'); 
-- 카테고리가 NULL인 데이터 추가

SELECT * FROM order_stat;

SELECT COUNT(*) FROM order_stat;
SELECT
COUNT(*) AS `전체 주문 건수`,   -- 백틱 사용 주의!
COUNT(category) AS `카테고리 등록 건수`
FROM
    order_stat;

SELECT 
SUM(price * quantity) AS `총 매출액`,
AVG(price * quantity) AS `평균 주문 금액`
FROM 
    order_stat;
    
    
SELECT 
MAX(price) AS 최고가, 
MIN(price) AS 최저가
FROM 
    order_stat;
    
    SELECT 
COUNT(customer_name) AS `총 주문 건수`, 
COUNT(DISTINCT customer_name) AS `순수 고객 수`
FROM 
    order_stat;
    
    SELECT
    category,
    COUNT(*) AS `카테고리별 주문 건수`
FROM
    order_stat
GROUP BY
    category;
    
    SELECT 
    customer_name, 
COUNT(*) AS `주문 횟수`
FROM 
    order_stat
GROUP BY 
    customer_name;
    
    
SELECT
    customer_name,
    COUNT(*) AS `총 주문 횟수`,
    SUM(quantity) AS `총 구매 수량`,
    SUM(price * quantity) AS `총 구매 금액`
FROM
    order_stat
GROUP BY
    customer_name
ORDER BY
    `총 구매 금액` DESC; -- 백틱 사용 주의!
    
    SELECT
    customer_name,
    category,
    SUM(price * quantity) AS `카테고리별 구매 금액`
FROM
    order_stat
GROUP BY
    customer_name, category
ORDER BY
    customer_name, `카테고리별 구매 금액` DESC;
    
    -- 1단계: 먼저 카테고리별로 그룹화하여 총 매출액 집계하기
SELECT
    category,
    SUM(price * quantity) AS total_sales
FROM
    order_stat
GROUP BY
    category

-- 2단계: HAVING 절로 2차 필터링(총 매출액이 50만 원 이상인 그룹)

SELECT
    category,
    SUM(price * quantity) AS total_sales
FROM
    order_stat
GROUP BY
    category
HAVING
    SUM(price * quantity) >= 500000;

SELECT
   category,
   COUNT(*) AS premium_order_count
FROM
   order_stat
WHERE
   price >= 100000 -- 1. 먼저 개별 행을 가격으로 필터링한다.
GROUP BY
   category -- 2. 필터링된 행들을 카테고리별로 그룹화한다.
HAVING
   COUNT(*) >= 2; -- 3. 그룹화된 결과 중, 건수가 2개 이상인 그룹만 필터링한다.
   
   
   
SELECT
  customer_name,
  SUM(price * quantity) AS total_purchase -- 5단계
FROM
  order_stat -- 1단계
WHERE
  order_date < '2025-05-14' -- 2단계
GROUP BY
  customer_name -- 3단계
HAVING
  COUNT(*) >= 2 -- 4단계
ORDER BY
  total_purchase  DESC -- 6단계
LIMIT 1; -- 7단계   --하나의 행만 선택(맨 위 1개만 가져옴)


select * from customers; 
select * from products;
select * from orders;

SELECT * FROM products WHERE name LIKE '아%';
SELECT * FROM products where price not between 100000 and 700000;
SELECT * FROM products where price not between 500000 and 800000;

SELECT name, address FROM customers WHERE name IN (select name from customers where address like '인천%' );
SELECT name, price FROM products WHERE product_id IN (select product_id from  orders where product_id =3);
SELECT name, price, stock_quantity FROM products WHERE name not IN ('갤럭시','아이패드');

 SELECT * FROM customers WHERE customer_id IN (select customer_id  from orders);
 SELECT * FROM products WHERE product_id IN (select product_id  from orders);
 SELECT * FROM products ORDER BY stock_quantity  LIMIT 3;
SELECT * FROM products ORDER BY product_id ASC LIMIT 0, 2;
SELECT * FROM products ORDER BY product_id ASC LIMIT 2, 2;

SELECT customer_id FROM orders;
SELECT DISTINCT customer_id FROM orders;

SELECT customer_id, product_id FROM orders;
SELECT DISTINCT customer_id, product_id FROM orders;

SELECT * FROM products WHERE description = NULL;

SELECT * FROM products WHERE description IS NULL;
SELECT * FROM products WHERE description IS NOT NULL;
SELECT * FROM products ORDER BY description ASC;
SELECT * FROM products ORDER BY description DESC;

SELECT product_id, name, description, description IS NULL FROM products
ORDER BY description DESC;

 SELECT product_id, name, description, description IS NULL FROM products
ORDER BY description IS NULL DESC, description DESC;
SELECT
  CONCAT(name, ' (', email, ')') AS `이름과 이메일`
FROM
  customers;
SELECT CONCAT_WS(' - ', name, email, address) AS 고객자료  FROM customers;

SELECT name, CHAR_LENGTH(name) as 글자수, LENGTH(name) AS 바이트수 FROM customers;
SELECT
  name,
  IFNULL(description, '상품 설명 없음') AS 설명
FROM
  products;
  
  SELECT
  name,
  description,
COALESCE(description, name, '정보 없음') AS display_text
FROM
  products;
  use db_ex;
 use my_shop;
SELECT COUNT(*) FROM order_stat;
SELECT
COUNT(*) AS `전체 주문 건수`,   -- 백틱 사용 주의!
COUNT(category) AS `카테고리 등록 건수`
FROM
    order_stat;

SELECT 
SUM(price * quantity) AS `총 매출액`,
AVG(price * quantity) AS `평균 주문 금액`
FROM 
    order_stat;
SELECT 
SUM(quantity) AS `총 판매 수량`, 
ROUND(AVG(quantity),2) AS `주문당 평균 수량`
FROM 
    order_stat;
SELECT 
MAX(price) AS 최고가, 
MIN(price) AS 최저가
FROM 
    order_stat;

SELECT 
MIN(order_date) AS `최초 주문일`, 
MAX(order_date) AS `최근 주문일` 
FROM 
    order_stat;

SELECT 
COUNT(customer_name) AS `총 주문 건수`, 
COUNT(DISTINCT customer_name) AS `순수 고객 수`
FROM 
    order_stat;

SELECT
    category,
    COUNT(*) AS `카테고리별 주문 건수`
FROM
    order_stat
GROUP BY
    category;

SELECT 
    customer_name, 
COUNT(*) AS `주문 횟수`
FROM 
    order_stat
GROUP BY 
    customer_name;

SELECT
    customer_name,
    COUNT(*) AS `총 주문 횟수`,
    SUM(quantity) AS `총 구매 수량`,
    SUM(price * quantity) AS `총 구매 금액`
FROM
    order_stat
GROUP BY
    customer_name
ORDER BY
    `총 구매 금액` DESC; -- 백틱 사용 주의


SELECT
    customer_name,
    COUNT(*) AS 총주문횟수,
    SUM(quantity) AS 총구매수량,
    SUM(price * quantity) AS 총구매금액
FROM
    order_stat
GROUP BY
    customer_name
ORDER BY
    총구매금액 DESC; -- 백틱 사용 주의!

SELECT
    customer_name,
    category,
    SUM(price * quantity) AS 카테고리별_구매금액
FROM
    order_stat
GROUP BY
    customer_name, category
ORDER BY
    customer_name, 카테고리별_구매금액 DESC;
 
 SELECT
    customer_name,
    category,
  #   product_name,
#     price,
    SUM(price * quantity) AS 카테고리별_구매금액
FROM
    order_stat
GROUP BY
    customer_name, category  -- 데이터를 '고객 이름'과 '카테고리'를 세트로 묶어서 그룹화
ORDER BY
    customer_name, 카테고리별_구매금액 DESC;
    -- 먼저 고객 이름(customer_name) 기준으로 가나다순(오름차순) 정렬->구매금액 내림차순

SELECT
    category,
    SUM(price * quantity) AS 총금액
FROM
    order_stat
GROUP BY
    category
HAVING
    총금액 >= 500000;
SELECT
    customer_name,
    COUNT(*) AS order_count
FROM
    order_stat
GROUP BY
    customer_name
HAVING
   COUNT(*) >= 3;
   
SELECT 
    category,
    product_name,
    price,
    -- 1. 중복 없이 무조건 차례대로 번호 매기기
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS 행번호,

    -- 2. 공동 순위가 있으면 건너뛰며 순위 매기기
    RANK() OVER (PARTITION BY category ORDER BY price DESC) AS 등수,

    -- 3. 해당 카테고리의 평균 가격 (행이 유지됨)
    AVG(price) OVER (PARTITION BY category) AS 카테고리_평균가격,

    -- 4. 해당 카테고리의 총 주문 건수
    COUNT(order_id) OVER (PARTITION BY category) AS 카테고리_주문수
FROM order_stat
WHERE category IS NOT NULL;



SELECT * FROM order_stat;
update  order_stat 
set price = 150000
where order_id = 4;
SELECT * FROM order_stat;
SELECT 
    category,
    product_name,
    price,
    -- 1. 중복 없이 무조건 차례대로 번호 매기기
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS 행번호,

    -- 2. 공동 순위가 있으면 건너뛰며 순위 매기기
    RANK() OVER (PARTITION BY category ORDER BY price DESC) AS 등수,

    -- 3. 해당 카테고리의 평균 가격 (행이 유지됨)
    AVG(price) OVER (PARTITION BY category) AS 카테고리_평균가격,

    -- 4. 해당 카테고리의 총 주문 건수
    COUNT(order_id) OVER (PARTITION BY category) AS 카테고리_주문수
FROM order_stat
WHERE category IS NOT NULL;

SELECT 
    -- 1. 카테고리 컬럼 조회: 만약 ROLLUP에 의해 생성된 소계/총합계 행이라서 NULL이 나오면 '전체 카테고리'로 채워줍니다.
    IFNULL(category, '전체 카테고리') AS 카테고리,
    
    -- 2. 고객명 컬럼 조회: 만약 특정 카테고리 내의 소계 행이라서 NULL이 나오면 '카테고리 소계'로 채워줍니다.
    IFNULL(customer_name, '카테고리 소계') AS 고객명,
    
    -- 3. 총 매출액 계산: 각 그룹별(또는 소계별)로 '가격 * 수량'을 모두 더해 'total_sales'라는 이름으로 출력합니다.
    SUM(price * quantity) AS 총매출액

-- 4. 대상 테이블 지정: 데이터를 불러올 원본 테이블인 'order_stat'을 지정합니다.
FROM order_stat

-- 5. 계층적 그룹화 및 소계: 카테고리별->고객별로 그룹화하되, WITH ROLLUP을 붙여 중간 소계와 맨 아래 총합계 행을 자동으로 만들어줍니다.
GROUP BY category, customer_name WITH ROLLUP;

select 학번, 이름, 학생.학과코드, 학과명 from 학생, 학과
where 학생.학과코드 = 학과.학과코드;

select 학번, 이름, 학생.학과코드, 학과명 from 학생 natural join 학과;

select 학번, 이름, 학생.학과코드, 학과명 from 학생 join 학과 using(학과코드); 

use db_ex;
select 학번, 이름, 학생.학과코드, 학과명 from 학생, 학과
where 학생.학과코드 = 학과.학과코드;

select 학번, 이름, 학생.학과코드, 학과명 from 학생 natural join 학과;

select 학번, 이름, 학생.학과코드, 학과명 from 학생 join 학과 using(학과코드); 
select 학번, 이름, 성적, 등급 from 학생, 성적등급
where 학생.성적 between 성적등급.최저 and 성적등급.최고;

select 학번, 이름, 학생.학과코드, 학과명 from 학생 right outer join 학과
on 학생.학과코드 = 학과.학과코드;

SELECT 학번, 이름, 학생.학과코드, 학과명 
FROM 학생 
LEFT JOIN 학과 ON 학생.학과코드 = 학과.학과코드;

SELECT 학번, 이름, 학생.학과코드, 학과명 
FROM 학생 
RIGHT JOIN 학과 ON 학생.학과코드 = 학과.학과코드;

SELECT 학번, 이름, 학생.학과코드, 학과명 
FROM 학생 
LEFT JOIN 학과 ON 학생.학과코드 = 학과.학과코드

UNION -- 2. 두 결과를 중복 없이 하나로 합칩니다.

-- 3. 오른쪽 기준(RIGHT JOIN)으로 학생과 학과를 합침
SELECT 학번, 이름, 학생.학과코드, 학과명 
FROM 학생 
RIGHT JOIN 학과 ON 학생.학과코드 = 학과.학과코드;

select * from 학생;
-- 문제) 학생테이블을 SELF JOIN 하여 선배가 있는 학생과 선배의 이름을 표시
SELECT  a.학번, a.이름, b.이름 as 선배
from 학생 a join 학생 b
on a.선배 = b.학번;
select * from 학생;

SELECT  a.학번, a.이름, b.이름 as 선배
from 학생 a, 학생 b
where a.선배 = b.학번;
-- 컴퓨터학과(com) 학생 조회 (한다맨, 장효정)
SELECT 학번, 이름 FROM 학생 WHERE 학과코드 = 'com'
UNION
-- 성적이 80점 이상인 학생 조회 (한다맨, 이서영, 장효정)
SELECT 학번, 이름 FROM 학생 WHERE 성적 >= 80;
SELECT 학번, 이름 FROM 학생 WHERE 학과코드 = 'com'
UNION ALL
SELECT 학번, 이름 FROM 학생 WHERE 성적 >= 80;

SELECT 학번, 이름 FROM 학생 WHERE 학과코드 = 'com'
INTERSECT
SELECT 학번, 이름 FROM 학생 WHERE 성적 >= 90;

SELECT A.학번, A.이름 
FROM 학생 A
INNER JOIN 학생 B ON A.학번 = B.학번
WHERE A.학과코드 = 'com' AND B.성적 >= 90;
SELECT 학번, 이름 FROM 학생 WHERE 학과코드 = 'com'
EXCEPT
-- 성적이 90점 이상인 학생 (이서영, 장효정)
SELECT 학번, 이름 FROM 학생 WHERE 성적 >= 90;


SELECT 학번, 이름 
FROM 학생 
WHERE 학과코드 = 'com' 
  AND 학번 NOT IN (SELECT 학번 FROM 학생 WHERE 성적 >= 90);

CREATE user 'test_user'@'localhost' IDENTIFIED by 'pass1234';
grant select 
on my_shop.* to 'test_user'@'localhost';

FLUSH PRIVILEGES;











   






