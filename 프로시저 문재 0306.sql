use db2021;
delimiter //
CREATE PROCEDURE 새학과(
IN 학과번호 char,
IN 학과명 char(20),
IN 전화번호 char(20))
BEGIN
INSERT INTO 학과(학과번호, 학과명, 전화번호)
VALUES(학과번호, 학과명, 전화번호);
END;
//
delimiter ;

/* 프로시저 InsertBook을 테스트하는 부분 */
CALL 새학과(08member, '컴퓨터보안학과', '0과목22-200-7000');
SELECT * FROM 학과;

CALL 통계(@a, @b, @c);
SELECT @a AS 학생수, @b AS 교수수, @c AS 과목수;

CALL 과목수강자수('K20002',@Count);
select @Count;	

CALL 새수강신청('1804003', @수강신청번호);
SELECT @수강신청_번호;
