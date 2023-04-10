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