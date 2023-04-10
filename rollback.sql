-- 트랜잭션
commit;
rollback;

select @@autocommit;

SET autocommit = 0;

create table book1 (select * from book);
create table book2 (select * from book);

delete from book1;
rollback;

delete from book2;
commit; -- 롤백적용안됨 이거쓰면
rollback;

start transaction;
delete from book1;
delete from book2;
rollback;