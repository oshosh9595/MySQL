delimiter //
CREATE PROCEDURE `학과_입력_수정`(
IN 학과번호1 char,
IN 학과명1 char(20),
IN 전화번호1 char(20))
BEGIN
declare cnt int;
select count(*) into cnt from 학과 where 학과번호 = 학과번호1; 
if (cnt = 0) then 
	insert into 학과 value(학과번호1, 학과명1, 전화번호1);
else
	update 학과 set 학과명 = 학과명1, 전화번호 = 전화번호1 where 학과번호 = 학과번호1;
end if
END;
//
delimiter;