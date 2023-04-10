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