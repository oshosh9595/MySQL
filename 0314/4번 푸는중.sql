-- drop procedure if exists price_orders;

delimiter &&
create procedure price_orders()
begin
	declare mypublisher varchar(40);
    declare myprice int;
    declare endOfRow boolean default false;
    declare ordersCusor cursor for select publisher, sum(saleprice) as myprice
	from book, orders where book.bookid = orders.bookid group by publisher;
    declare continue handler for not found set endOfRow = true;
    open ordersCusor;
    cursor_loop: loop
		fetch ordersCusor into mypublisher, myprice;
		if endOfRow then leave cursor_loop;
		end if;
        select mypublisher, myprice;
	end loop cursor_loop;
    close ordersCursor;
end &&
delimiter ;

call price_orders();