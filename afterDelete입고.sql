delimiter $$
create trigger afterDelete입고
after DELETE on 입고 for each row
begin
	update 상품
    set 재고수량 = 재고수량 - OLD.입고수량
    where 상품코드 = OLD.상품코드;
end;
delimiter;

-- update 입고 set 입고수량 =30 where 입고번호=1;