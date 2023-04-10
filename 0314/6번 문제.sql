-- drop procedure if exists book_list;

delimiter &&
create procedure book_list()
begin
	select customer.name custid, count(*) as 구매건수, sum(saleprice)
	from customer
    left join orders on orders.custid = customer.custid
	group by customer.name;
end &&
delimiter ;

call book_list();
