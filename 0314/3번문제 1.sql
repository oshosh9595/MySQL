--  출판사가 '이상미디어'인 도서의 이름과 가격을 보여주는 프로시저를 작성하시오
drop procedure if exists db0220.cuser_pro3;
delimiter &&
create procedure cuser_pro3()
begin
	declare myname varchar(40);
    declare myprice int;
    declare endOfRow boolean default false;
    declare bookCusor cursor for select bookname, price from book where publisher = "이상미디어";
    declare continue handler for not found set endOfRow = true;
    open bookCusor;
    cursor_loop: loop
		fetch bookCusor into myname, myprice;
		if endOfRow then leave cursor_loop;
		end if;
        select myname, myprice;
	end loop cursor_loop;
    close bookCusor;
end &&
delimiter ;