delimiter //
CREATE PROCEDURE Interest()
BEGIN
	DECLARE myInterest INTEGER DEFAULT 0.0;
	DECLARE Price INTEGER;
	DECLARE endOfRow BOOLEAN DEFAULT FALSE; /* 행의 끝 여부 */
	DECLARE InterestCursor CURSOR FOR /* 커서 선언*/
		SELECT saleprice FROM Orders;
	DECLARE CONTINUE handler /* 행의 끝일 때 Handler 정의 */
		FOR NOT FOUND SET endOfRow=TRUE;
	OPEN InterestCursor; /* 커서 열기 */
	cursor_loop: LOOP
		FETCH InterestCursor INTO Price;
		IF endOfRow THEN LEAVE cursor_loop;
		END IF;
		IF Price >= 30000 THEN
			SET myInterest = myInterest + Price * 0.1;
		ELSE
			SET myInterest = myInterest + Price * 0.05;
		END IF;
	END LOOP cursor_loop;
	CLOSE InterestCursor;
	SELECT CONCAT(' 전체 이익 금액 = ', myInterest);
END;
//
delimiter ;

/* Interest 프로시저를 실행하여 판매된 도서에 대한 이익금을 계산 */
CALL Interest();