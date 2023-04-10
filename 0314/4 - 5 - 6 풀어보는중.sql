drop procedure if exists db0220.cuser_pro3;
-- 4 출판사별로 출판사 이름과 도서의 판매 총액을 보이시오(판매 총액은 Orders 테이블에 있다).
delimiter &&
create procedure prices_order()
begin
	select publisher, sum(saleprice)
	from book, orders
	where book.bookid=orders.bookid
	group by publisher;
end&&
delimiter ;

call prices_order;

-- 5 출판사별로 도서의 평균가보다 비싼 도서의 이름을 보이시오(예를 들어 A 출판사 도서의 평균가가 20,000원이라면 A 출판사 도서 중 20,000원 이상인 도서를 보이면 된다).
delimiter &&
create procedure avg_list()
begin
	select b1.bookname
	from book b1
	where b1.price > (select avg(b2.price)
						from book b2
						where b2.publisher = b1.publisher);
end&&
delimiter ;

call avg_list;

-- 6 고객별로 도서를 몇 권 구입했는지와 총 구매액을 보이시오.
delimiter &&
create procedure book_list()
begin
	select custid, count(*) as 구매건수, sum(saleprice)
	from orders
	group by custid;
end&&
delimiter ;

call book_list;

