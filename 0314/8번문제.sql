-- select custid, orderid, saleprice, fnc_Interest
-- 고객의 주문 총액을 계산하여 20,000원 이상이면 '우수', 20,000원 미만이면 '보통'을 반환하는 함수 Grade()를
-- 작성하시오. Grade()를 호출하여 고객의 이름과 등급을 보이는 SQL 문도 작성하시오.
drop procedure if exists grade;

-- userFunc 함수 생성
delimiter &&
CREATE FUNCTION grade(cid int) 
RETURNS varchar(10)
BEGIN
DECLARE total INT;
    SELECT SUM(saleprice) INTO total FROM orders WHERE custid = cid;
    IF total >= 20000 THEN
        RETURN '우수';
    ELSE
        RETURN '보통';
    END IF;
END &&
delimiter ;

-- 쿼리문날리기
SELECT name, Grade(custid) as total from customer;