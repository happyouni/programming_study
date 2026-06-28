/*쇼핑몰 테이블 실전 설계
고객 (customers)
- 고객 id, 이름, 이메일, 비밀번호, 주소, 가입 시각 
상품 (products)
- 상품 id, 이름, 설명, 가격, 재고 수량 
주문 (orders)
- 주문 id, 주문 고객, 주문 상품, 주문 수량, 주문 시각, 주문 상태

- 주문이 등록되면 최초의 주문 상태는 주문상태가 된다
- 한 번의 주문 시에 한 종류의 상품만 주문할 수 있다. 한 종류의 상품을 여러 개 주문하는 것은 가능하다.*/

-- 고객테이블 
create table customers (
	customer_id int auto_increment primary key, 
    name varchar(50) not null,
    email varchar(100) not null unique,
    password varchar(255) not null,
    address varchar(255) not null,
    join_date datetime default current_timestamp
    );
    
-- 상품 테이블
CREATE TABLE products (
    product_id     INT auto_increment PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    description    TEXT,
    price          INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

-- 주문 테이블 
 CREATE TABLE orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    product_id   INT NOT NULL,
    quantity     INT NOT NULL,
    order_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
    status       VARCHAR(20) NOT NULL DEFAULT '주문접수',

    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_orders_products FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- alter table : 이미 만든 테이블 구조 변경
alter table customers
add column point int not null default 0; -- add column : 열 추가

desc customers;

alter table customers
modify column address varchar(300) not null; -- 열 데이터 타입 변경

alter table customers
drop column point;  --  열 삭제


--  insert : 테이블에 새로운 데이터 행을 추가하는 명령어
--  insert into table이름 (열1, 열2, 열3 ...) cloumn->열
--  values (값1, 값2, 값3 ..);   

INSERT INTO customers (name, email, password, address, join_date) VALUES
('이순신', 'sunsin@example.com', 'password123', '서울특별시 중구 세종대로', '2026-05-01 10:30:00'),
('세종대왕', 'sejong@example.com', 'password456', '서울특별시 종로구 사직로', '2025-04-01'),
('장영실', 'young@example.com', 'password789', '부산광역시 동래구 복천동', '2026-03-10');

select * from customers;
INSERT INTO customers (name, email, password, address) VALUES
('강감찬', 'kang@example.com', 'password777', '인천 남동구 구월동');
select * from customers;

INSERT INTO products (name, description, price, stock_quantity) VALUES
('갤럭시', '최신 AI 기능이 탑재된 고성능 스마트폰', 1000000, 55),
('LG 그램', '초경량 디자인과 강력한 성능을 자랑하는 노트북', 500000, 35),
('아이폰', '직관적인 사용자 경험을 제공하는 스마트폰', 800000, 55),
('에어팟', '편리한 사용성의 무선 이어폰', 200000, 110),
('알뜰폰', NULL, 300000, 100);

select * from products;

-- update : 이미 존재하는 데이터의 내용을 수정하는 명령어
-- update table이름
-- set 수정열1=수정값1, 수정열2=수정값2 .... 
-- where 조건; 
-- *where가 생략되면 테이블의 모든 행이 수정됨

select  * from products
where product_id = 1;

update products
set price=950000, stock_quantity=180
where product_id = 1;

-- delete from :테이블에서 행을 삭제하는 명령어
-- delete from 테이블이름
-- where 조건;

select  * from products;
delete from products
-- where name='알뜰폰'; 
where product_id = 5;

SET SQL_SAFE_UPDATES = 0; -- 안전 모드 해제 (0 = OFF)
DELETE FROM products WHERE name = '알뜰폰'; 
SET SQL_SAFE_UPDATES = 1; -- 다시 안전 모드 켜기 (1 = ON, 실수를 막기 위해 다시 켬)

select  * from products;

--  orders 테이블에 추가
INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1), -- 이순신 고객이 갤럭시 1개 주문
(2, 2, 1), -- 세종대왕 고객이 LG 그램 1개 주문
(3, 3, 1), -- 장영실 고객이 아이폰 1개 주문
(1, 4, 2), -- 이순신 고객이 에어팟 2개 추가 주문
(2, 2, 1); -- 세종대왕 고객이 LG 그램 1개 주문(추가 주문)

select * FROM ORDERS;


select * from products where price >= 1000000 or stock_quantity <30;
select * from products where price < 100000 or price > 700000;
select * from products where price between 100000 and 700000;
select * from products where price !=500000;
select * from products where stock_quantity between 50 and 80;
SELECT * FROM products WHERE name = '갤럭시' OR name = '아이폰' OR name = '에어팟';
SELECT * FROM products WHERE name IN ('갤럭시', '아이폰', '에어팟');

SELECT * FROM products WHERE name != '갤럭시' AND name != '아이폰' AND name != '에어팟';
SELECT * FROM products WHERE name NOT IN ('갤럭시', '아이폰', '에어팟');

SELECT * FROM customers WHERE email LIKE 'sejong%';
SELECT * FROM customers WHERE address NOT LIKE '서울특별시%';
SELECT * FROM customers WHERE name LIKE '장__'; 
SELECT * FROM customers WHERE join_date='2026-5-1';
    
select * from customers order by join_date desc;
select * from products order by price ;
SELECT * FROM products ORDER BY stock_quantity DESC, price ASC;

SELECT * FROM products ORDER BY price DESC LIMIT 2;

SELECT * FROM products ORDER BY product_id ASC LIMIT 0, 2;
SELECT * FROM products ORDER BY product_id ASC LIMIT 2, 2;
SELECT * FROM products ORDER BY product_id ASC LIMIT 4, 2;
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
ORDER BY description IS NULL DESC, description DESC;SELECT product_id, name, description, description IS NULL FROM products
ORDER BY description DESC;

create schema test;
use test;
-- 고객테이블 
create table customers (
	customer_id int auto_increment primary key, 
    name varchar(50) not null,
    email varchar(100) not null unique,
    password varchar(255) not null,
    address varchar(255) not null,
    join_date datetime default current_timestamp 
    -- 별도로 값을 지정하지 않으면 현재 날짜와 시간 들어감
    );
        
-- 상품 테이블
CREATE TABLE products (
    product_id     INT auto_increment PRIMARY KEY,
    p_name           VARCHAR(100) NOT NULL,
    description   TEXT,
    price          INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

-- 주문 테이블 
 CREATE TABLE orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    product_id   INT NOT NULL,
    quantity    INT NOT NULL CONSTRAINT chk_orders_quantity CHECK (quantity >= 1),
    order_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
    status       VARCHAR(20) NOT NULL DEFAULT '주문접수',

    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON UPDATE CASCADE,  -- 부모 테이블의 회원번호가 바뀌면 자식도 같이 바뀜

    CONSTRAINT fk_orders_products FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON UPDATE CASCADE -- 부모 테이블의 상품번호가 바뀌면 자식도 같이 바뀜
);
desc  orders;
INSERT INTO customers (name, email, password, address, join_date) VALUES
('이순신', 'sunsin@naver.com', 'password123', '서울특별시 중구 세종대로', '2026-05-01 10:30:00'),
('세종대왕', 'sejong@naver.com', 'password456', '서울특별시 종로구 사직로', '2025-04-01'),
('장영실', 'young@naver.com', 'password789', '부산광역시 동래구 복천동', '2026-03-10');
-- (name, email, password, address, join_date) -> 모든 필드 전부 넣을 경우는 생략 가능 

select * from customers;
INSERT INTO customers (name, email, password, address) VALUES
('강감찬', 'kang@naver.com', 'password777', '인천 남동구 구월동');
select * from customers;

INSERT INTO products (p_name, description, price, stock_quantity) VALUES
('갤럭시', '최신 AI 기능이 탑재된 고성능 스마트폰', 1000000, 55),
('LG 그램', '초경량 디자인과 강력한 성능을 자랑하는 노트북', 500000, 35),
('아이폰', '직관적인 사용자 경험을 제공하는 스마트폰', 800000, 55),
('에어팟', '편리한 사용성의 무선 이어폰', 200000, 110),
('알뜰폰', NULL, 300000, 100);

INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1), -- 이순신 고객이 갤럭시 1개 주문
(2, 2, 1), -- 세종대왕 고객이 LG 그램 1개 주문
(3, 3, 1), -- 장영실 고객이 아이폰 1개 주문
(1, 4, 2), -- 이순신 고객이 에어팟 2개 추가 주문
(2, 2, 1); -- 세종대왕 고객이 LG 그램 1개 주문(추가 주문)

select * FROM ORDERS;

-- INSERT INTO orders (customer_id, product_id, quantity) VALUES
-- (1, 1, -1);
    
-- 부모 테이블(customers)에서 이순신 고객의 id를 1에서 999로 변경!
UPDATE customers SET customer_id = 999 WHERE customer_id = 3;
select * from customers;
select * from orders;

ALTER TABLE orders 
ALTER status SET DEFAULT '주문접수 완료';

INSERT INTO orders (customer_id, product_id, quantity)
VALUES (2, 4, 1);

SELECT * FROM orders;
CREATE INDEX idx_products_price ON products (price);
SELECT * FROM products WHERE price >= 500000;
CREATE INDEX idx_customers_email ON customers (email);
SELECT * FROM customers WHERE email = 'sejong@naver.com';


desc sample;

CREATE VIEW v_order_details AS
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.p_name AS product_name,
    o.quantity,
    o.order_date,
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;
	
    SELECT * FROM v_order_details;
    SELECT * FROM v_order_details WHERE customer_name = '이순신';
    
    DROP VIEW v_order_details;
      SELECT * FROM v_order_details;
      -- 1. customers 테이블에서 비밀번호를 제외하고 마케팅에 필요한 필드만 골라 뷰를 만듭니다.
CREATE VIEW v_marketing_customers AS
SELECT 
    customer_id,
    name,
    email,
    join_date
FROM customers;

-- 마케팅 팀이 회원 정보를 조회합니다.
SELECT * FROM v_marketing_customers;

CREATE VIEW v_seoul_customers AS
SELECT customer_id, name, email, address
FROM customers
WHERE address LIKE '%서울%';

SELECT * FROM v_marketing_customers;

DROP VIEW v_seoul_customers;

CREATE VIEW v_new_members_2026 AS
SELECT 
    customer_id,
    name,
    address,
    join_date
FROM customers
WHERE join_date >= '2026-01-01 00:00:00';
SELECT * FROM v_new_members_2026;

CREATE VIEW v_delivery_and_cancel AS
SELECT 
    order_id,
    product_id,
    quantity,
    status
FROM orders
WHERE status != '주문접수'; 

CREATE VIEW v_status AS
SELECT 
    order_id,
    product_id,
    quantity,
    status
FROM orders
WHERE status != '주문접수'; 
-- 또는 WHERE status <> '주문접수';
SELECT * FROM v_status;


      



