INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

INSERT INTO Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d')); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, STR_TO_DATE( '2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));

select * from book where not (publisher = '대한미디어' or publisher = '굿스포츠');
select bookname, publisher from book where bookname like '축구의 역사';
select bookname, publisher from book where bookname like '%축구%';

select * from book where bookname like '%구%'; -- 구% << 이게 정답
select * from book where bookname like '%축구%' And price >= 20000;
select * from book where publisher = '굿스포츠' or publisher = '대한미디어';
select * from book order by bookname;
select * from book order by price, bookname; -- 도서가격이 같으면 이름순으로 하라
select * from book order by price DESC, publisher ASC;
select SUM(saleprice) from orders;
select SUM(saleprice) AS 총매출 from orders;
select SUM(saleprice) AS 총매출 from orders where custid=2;
select SUM(saleprice) AS Total, AVG(saleprice) AS Average, MIN(saleprice) AS Minimum, MAX(saleprice) AS Maximum from orders;
select COUNT(*) from orders;

select custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액 from orders GROUP BY custid with rollup;
select custid, COUNT(*) AS 도서수량 from orders where saleprice >= 8000 GROUP BY custid having count(*) >= 2;
select * from customer,orders;

select * from customer, orders where customer.custid = orders.custid;
select * from customer, orders where customer.custid = orders.custid order by customer.custid;

select name, saleprice from customer, orders where customer.custid = orders.custid;
select name, SUM(saleprice) from customer, orders where customer.custid = orders.custid group by customer.name order by customer.name;

select customer.name, book.bookname from customer, orders, book where customer.custid = orders.custid AND orders.bookid = book.bookid;
select customer.name, book.bookname from customer, orders, book where customer.custid = orders.custid AND orders.bookid = book.bookid AND book.price = 20000;

select customer.name, saleprice from customer left outer join orders on customer.custid=orders.custid; -- join 조건 on 뒤에나오는거
select customer.name 
from customer left outer join orders on customer.custid=orders.custid
where saleprice is null;

select bookname from book where price = (select max(price) from book);

select name from customer where custid in(select custid from orders);
select DISTINCT name from customer, orders, book where customer.custid = orders.custid ;

select name from customer where custid in(select custid from orders where bookid in (select bookid from book where publisher ='대한미디어'));
select customer.name from customer, orders, book where customer.custid = orders.custid and orders.bookid = book.bookname and book.publisher = '대한미디어';

select name from customer where address like '대한민국%';
select name from customer where custid in (select custid from orders);

select name from customer where address like '대한민국%' and name not in(select name from customer where custid in(select custid from orders));
select name from customer where address like '대한민국%' and name in(select name from customer where custid in(select custid from orders));
