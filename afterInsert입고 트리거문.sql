delimiter $$
CREATE TRIGGER afterInsert입고
AFTER insert ON 입고 FOR EACH ROW
BEGIN
	update 상품
    set 재고수량 = 재고수량 + NEW.입고수량
    where 상품코드 = NEW.상품코드;
END;
delimiter;

INSERT INTO 입고 (입고번호, 상품코드, 입고일자, 입고수량, 입고단가) VALUES (1, 'AAAAAA', '2004-10-10', 5, 50000);

-- drop trigger 입고_AFTER_INSERT;