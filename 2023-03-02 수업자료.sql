-- 테이블의 색인 정보를 확인
show index from dept_emp;

-- 테이블과 관련된 정보를 조회
show table status like 'dept_emp';
-- 'index_length' 열은 기본키를 제외한 색인을 저장하는 페이지 수에 페이지 크기를 곱한 결과로 바이트 수이다.

-- dept_emp 테이블에 설정된 색인을 삭제
-- 외래키 설정과 dept_emp 열에 설정된 색인만 삭제
alter table dept_emp drop foreign key dept_emp_ibfk_1;
alter table dept_emp drop foreign key dept_emp_ibfk_2;
drop index dept_no on dept_emp;

-- 테이블을 다시 분석해서 관련 정보를 업데이트하고 테이블의 색인 정보를 확인
analyze table `demp_emp`;
show index from dept_emp;

-- 테이블의 기본키 정보까지 삭제
alter table `dept_emp` drop primary key;

-- 데이터베이스 내부에서 색인 index 사용 여부와 검색 조건등에 따라서 어떻게 데이터를 필터링해서 데이터조회하는지, 내부적으로 쿼리문을 실행하는 ..
-- `실행 계획`을 확인 하는 방법으로 "explain", "describe", "desc"사용

-- 테이블에서 첫 번쨰 행의 데이터를 조회
select * from dept_emp order by emp_no asc limit 1;

-- 테이블에서 마지막 행의 데이터를 조회
select * from dept_emp order by emp_no desc limit 1;

-- 첫번쨰 행과 마지막 행의 실행 계획의 결과? Full scan
select count(*) from dept_emp;
explain select * from dept_emp where emp_no = 10001;
explain select * from dept_emp where emp_no = 499999;

-- 모두 삭제한 색인 중 기본키를 다시 설정
alter table dept_emp add primary key (emp_no,dept_no);
explain select * from dept_emp where emp_no = 10001;
explain select * from dept_emp where emp_no = 499999;

-- 색인을 이용하여 데이터를 조회하면 조회하려는 데이터만 읽고 비교하여 결과를 반환하기 때문에..
-- 데이터를 조회하는 시간이 최소화된다. 이것이 색인 index 를 사용하는 목적이다.

-- 색인이 설정되지 않은 `dept_no` 열을 사용하여 데이터를 조회하는쿼리
select count(*) from dept_no  where dept_no = 'd006';
explain select * from dept_no where dept_no = 'd006';

-- 'rows' 열의 값을 비교하면 dept_no 열을 사용할 떄 검색 대상 행 수가 줄어든것을 볼수있다
-- 중복 데이터가 많은 경우에는 실제 필요한 데이터만 짧은 시간에 검색되도록 가능한 많은 색인을 ..
create index dept_emp on dept_emp(dept_no);
explain select * from dept_emp where dept_no = 'd006';

-- 하나의 테이블에 많은 색인을 생성하면 insert, update 및 delete 하는 시간이많이 소요되면 ...
-- 검색 조건과 색인 생성을 조화롭게 해야한다

-- 색인을 설정한 dept_no 열과 색인을 설정하지 않은 from_date 열을 사용하여 복한 조건을 설정한 select...
select * from dept_emp where dept_no = 'd006' and from_date = '1996-11-24';
explain select * from dept_emp where dept_no = 'd006' and from_date = '1996-11-24';

create index from_date on dept_emp(from_date);
select * from dept_emp where dept_no = 'd006' and from_date = '1996-11-24';
explain select * from dept_emp where dept_no = 'd006' and from_date = '1996-11-24';

-- dept_emp 테이블과 employees 테이블을 join 하는경우
-- 색인 설정 여부에 따라 실행 계획의 차이를 확인하기 위해 다음의 쿼리문을 실행하여..
-- 두개의 테이블에 설정된 모든 색이 삭제
-- 먼저 demp_emp 테이블의 색인을 다음의 쿼리문을 실행하여 삭제하고 테이블 분석
alter table `dept_emp` drop primary key;
alter table `dept_emp` drop index `dept_emp`;
alter table `dept_emp` drop index `from_date`;
analyze table dept_emp;

alter table dept_manager drop foreign key dept_manager_ibfk_1;
alter table titles drop foreign key titles_ibfk_1;
alter table employees drop primary key;
analyze table employees, dept_emp;

explain select a.emp_no, b.first_name, b.last_name
from dept_emp a inner join employees b
on a.emp_no = b.emp_no;

explain select a.emp_no, b.first_name, b.last_name
from dept_emp a inner join employees b
on a.emp_no = b.emp_no
where a.emp_no = 10001;

-- 밑에 프라이머리키 실행하고 다시 조인문 실행
alter table employees add primary key (`emp_no`);
alter table demt_emp add primary key (`emp_no`, `dept_no`);

explain select a.emp_no, b.first_name, b.last_name
from dept_emp a inner join employees b
on a.emp_no = b.emp_no;

explain select a.emp_no, b.first_name, b.last_name
from dept_emp a inner join employees b
on a.emp_no = b.emp_no
where a.emp_no = 10001;
