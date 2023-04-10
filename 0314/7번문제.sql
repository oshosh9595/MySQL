-- drop procedure if exists test_proc7;
delimiter &&
create procedure test_proc7()
begin
	declare done boolean default false;
    declare v_sum int;
    declare v_id int;
    declare v_name varchar(20);
    -- select 한 결과를 cursor 1로 정의
    declare cursor1 cursor for select custid, name from Customer;
    declare continue handler for not found set done = true;
    open cursor1;
		my_loop: loop
        -- loop 하며 curson1 의 데이터를 불러와 변수에 넣는다.
	fetch cursor1 into v_id, v_name;
		select sum(saleprice) into v_sum from Orders where custid=v_id;
        if done then
			leave my_loop;
		end if;
        select v_name, v_sum;  -- 조건문
		end loop my_loop;
	close curson1;
end &&
delimiter ;

call test_proc7();