use db2021;
delimiter //
CREATE PROCEDURE 새학과(
IN 학과번호 INTEGER,
IN 학과명 VARCHAR(40),
IN 전화번호 VARCHAR(40))
BEGIN
INSERT INTO 학과(학과번호, 학과명, 전화번호)
VALUES(08, '컴퓨터보안학과', '022-200-7000');
END;
//
delimiter ;

/* 프로시저 InsertBook을 테스트하는 부분 */
CALL 새학과(08member, '컴퓨터보안학과', '022-200-7000');
SELECT * FROM 학과;