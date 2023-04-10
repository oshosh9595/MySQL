--  InsertBook() 프로시저를 수정하여 고객을 새로 등록하는 InsertCustomer() 프로시저를 작성하시오.
use madang
delimiter //
CREATE PROCEDURE  InsertCustomer(
 IN mycustid INTEGER,
 IN myname VARCHAR(40),
 IN myaddress VARCHAR(40),
 IN myphone INTEGER)
BEGIN
 INSERT INTO customer(custid, name, address, phone)
 VALUES(mycustid, myname, myaddress, myphone);
END;
//
delimiter ;
CALL InsertCustomer(18, '스포츠과학1', '마당과학서적1', 250001);





-- 출판사별로 도서의 평균가보다 비싼 도서의 이름을 보이시오
-- (예를 들어 A 출판사 도서의 평균가가 20,000원이라면 A 출판사 도서 중 20,000원 이상인 도서를 보이면 된다).

-- 고객별로 도서를 몇 권 구입했는지와 총 구매액을 보이시오.

-- 주문이 있는 고객의 이름과 주문 총액을 출력하고, 주문이 없는 고객은 이름만 출력하는 프로시저를 작성하시오.





