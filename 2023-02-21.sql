CREATE TABLE 학과
(
학과번호 char(2) NOT NULL,
학과명 char(20) NOT NULL,
전화번호 char(20)NOT NULL,
PRIMARY KEY(학과번호)
);

CREATE TABLE 교수
(
사번 char(7) NOT NULL,
이름 char(20) NOT NULL,
학과 char(2) NOT NULL,
전자우편 char(50) NOT NULL,
전화번호 char(20) NULL,
PRIMARY KEY(사번),
FOREIGN KEY (학과) REFERENCES 학과(학과번호)
);

CREATE TABLE 학생
(
학번 char(7) NOT NULL,
학과 char(2) NOT NULL,
이름 char(20) NOT NULL,
학년 ENUM ('1', '2', '3', '4') NOT NULL,
주소 char(200) NULL,
시군구 char(20) NULL,
시도 char(20) NULL,
우편번호 char(20) NULL,
전자우편 char(50) NULL,
PRIMARY KEY(학번),
FOREIGN KEY (학과) REFERENCES 학과(학과번호)
);

CREATE TABLE 과목
(
과목번호 char(6) NOT NULL,
과목명 char(50) NOT NULL,
영문명 char(50) NOT NULL,
담당교수 char(7) NOT NULL,
학점 int NOT NULL,
시수 int NOT NULL,
이수구분 ENUM('교양', '전공') NOT NULL,
학기 ENUM ('1', '여름', '2', '겨울') NOT NULL,
학년 ENUM ('1', '2', '3', '4') NOT NULL,
설명 text,
PRIMARY KEY(과목번호),
FOREIGN KEY (담당교수) REFERENCES 교수(사번)
);

CREATE TABLE 수강신청
(
수강신청번호 char(7) NOT NULL,
학번 char(7) NOT NULL,
날짜 datetime NOT NULL,
연도 char(4) NOT NULL,
학기 ENUM ('1', '여름', '2', '겨울') NOT NULL,
PRIMARY KEY(수강신청번호),
FOREIGN KEY (학번) REFERENCES 학생(학번)
);

CREATE TABLE 수강신청내역
(
수강신청번호 char(7) NOT NULL,
일련번호 int NOT NULL,
과목번호 char(6) NOT NULL,
평점 int NOT NULL DEFAULT -1,
PRIMARY KEY(수강신청번호, 일련번호),
FOREIGN KEY (수강신청번호) REFERENCES 수강신청(수강신청번호),
FOREIGN KEY (과목번호) REFERENCES 과목(과목번호)
);



-- 학과 테이블 데이터 입력
INSERT INTO 학과(학과번호, 학과명, 전화번호) VALUES('01', '컴퓨터정보학과', '022-200-3000');
INSERT INTO 학과(학과번호, 학과명, 전화번호) VALUES('02', '전자공학과', '022-200-4000');
INSERT INTO 학과(학과번호, 학과명, 전화번호) VALUES('03', '전기공학과', '022-200-5000');
INSERT INTO 학과(학과번호, 학과명, 전화번호) VALUES('04', '정보통신공학과', '022-200-6000');

-- 교수 테이블 데이터 입력
INSERT INTO 교수(사번, 이름, 학과, 전자우편, 전화번호) VALUES('1000001', '김교수', '01', 'kim@school.ac.kr', '010-000-0001');
INSERT INTO 교수(사번, 이름, 학과, 전자우편, 전화번호) VALUES('1000002', '이교수', '01', 'lee@school.ac.kr', '010-000-0002');
INSERT INTO 교수(사번, 이름, 학과, 전자우편, 전화번호) VALUES('1000003', '박교수', '01', 'park@school.ac.kr', '010-000-0003');
INSERT INTO 교수(사번, 이름, 학과, 전자우편, 전화번호) VALUES('1000004', '최교수', '01', 'choi@school.ac.kr', NULL);
INSERT INTO 교수(사번, 이름, 학과, 전자우편, 전화번호) VALUES('1000005', '한교수', '04', 'han@school.ac.kr', NULL);


-- 학생 테이블 데이터 입력
INSERT INTO 학생(학번, 학과, 이름, 학년, 주소, 시군구, 시도, 우편번호, 전자우편) VALUES('1801001', '01', '김민준', '1', '일번길100', '우리구', '특별시', '01234', 'minjoon@school.ac.kr');
INSERT INTO 학생(학번, 학과, 이름, 학년, 주소, 시군구, 시도, 우편번호, 전자우편) VALUES('1601001', '01', '이서준', '1', '이번길200', '신한구', '특별시', '02345', 'seojoon@school.ac.kr');
INSERT INTO 학생(학번, 학과, 이름, 학년, 주소, 시군구, 시도, 우편번호, 전자우편) VALUES('1801002', '01', '박주원', '1', '삼번길300', '국민시', '그래도', '03456',NULL);
INSERT INTO 학생(학번, 학과, 이름, 학년, 주소, 시군구, 시도, 우편번호, 전자우편) VALUES('1601002', '01', '최예준', '1', '사번길400', '산업시', '그래도', '04567', NULL);
INSERT INTO 학생(학번, 학과, 이름, 학년, 주소, 시군구, 시도, 우편번호, 전자우편) VALUES('1804003', '04', '윤서연', '1', '오번길500', '하나시', '그래도', '05678', 'seoyone@school.ac.kr');

-- 과목 테이블 데이터 입력
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20002', '컴퓨터네트워크', 'Computer Network', '1000001',2, 2, '전공', '1', '1', '컴퓨터 네트워크에 대한 기본적 이해');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20045', '컴퓨터소프트웨어개론', 'Introduction to Computer Software','1000002', 3, 3, '전공', '1', '1', '컴퓨터 소프트웨어에 대한 기본적 이해');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20056', '컴퓨터활용', 'Computer Practical Use', '1000003',2, 3, '전공', '1', '1', '컴퓨터 활용에 대한 기본적 이해');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20077', '컴퓨터개론', 'Introduction to Computer', '1000004',3, 3, '전공', '1','1', '컴퓨터에 대한 기본적 이해');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20012', '정보보호개론', 'Introduction to Infromation Protection', '1000001', 4, 3, '전공', '2', '1', '정보보호 기술과 솔루션에 대한 기본적 이해') ;
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20013', '인터넷프로그래밍','Internet Programming','1000001',3, 4, '전공','2', '1', 'HTML과 CSS에 대한 학습');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20023', '프로그래밍언어', 'Programming Language', '1000002',4, 4, '전공','2', '1','프로그래밍 언어의 기본 원리');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20033', '데이터베이스', 'Database', '1000002', 3, 3, '전공', '2', '1', '데이터 모델링 SQL 언어 습득');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('K20035', '운영체제', 'Operating System', '1000004', 3, 3, '전공', '2', '1', '운영체제의 주요 역할 이해');
INSERT INTO 과목(과목번호, 과목명, 영문명, 담당교수, 학점, 시수, 이수구분, 학기, 학년, 설명) VALUES('Y00132', '의사소통능력', 'Communication Skills', '1000004', 1, 1, '교양', '2', '1','의사소통능력과 대인관계능력 계발');

-- 수강신청 테이블 데이터 입력
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1810001', '1801001', '2018-03-02', '2018', '1');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1820001', '1801001', '2018-08-28', '2018', '2');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1610001', '1601001', '2016-03-02', '2016', '1');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1820002', '1601001', '2018-08-29', '2018', '2');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1810002', '1801002', '2018-03-02', '2018', '1');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1820003', '1801002', '2018-08-25', '2018', '2');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1610002', '1601002', '2016-03-01', '2016', '1');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1820004', '1601002', '2018-08-26', '2018', '2');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1810003', '1804003', '2018-03-01', '2018', '1');
INSERT INTO 수강신청(수강신청번호, 학번, 날짜, 연도, 학기) VALUES('1820005', '1804003', '2018-08-27', '2018', '2');

-- 수강신청내역 테이블 데이터 입력
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810001', 1, 'K20002', 4);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810001', 2, 'K20045', 0);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810001', 3, 'K20056', 4);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1610001', 1, 'K20045', 3);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1610001', 2, 'K20056', 3);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1610001', 3, 'K20077', 3);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810002', 1, 'K20077', 0);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810002', 2, 'K20002', 2);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810002', 3, 'K20045', 3);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1610002', 1, 'K20045', 4);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1610002', 2, 'K20056', 3);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1610002', 3, 'K20077', 0);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810003', 1, 'K20077', 1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810003', 2, 'K20002', 3);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1810003', 3, 'K20045', 1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820001', 1, 'K20012', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820001', 2, 'K20013', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820001', 3, 'K20023', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820002', 1, 'K20013', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820002', 2, 'K20023', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820002', 3, 'K20033', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820003', 1, 'K20033', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820003', 2, 'K20035', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820003', 3, 'K20012', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820003', 4, 'Y00132', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820004', 1, 'K20012', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820004', 2, 'K20012', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호, 평점) VALUES('1820004', 3, 'K20023', -1);
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호) VALUES('1820005', 1, 'K20023');
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호) VALUES('1820005', 2, 'K20033');
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호) VALUES('1820005', 3, 'K20035');
INSERT INTO 수강신청내역(수강신청번호, 일련번호, 과목번호) VALUES('1820005', 4, 'K20012');
INSERT INTO 수강신청내역 (수강신청번호, 일련번호, 과목번호) VALUES('1820005', 5, 'Y00132');