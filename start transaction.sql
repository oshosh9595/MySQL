start transaction;
savepoint A;
delete from book1;
savepoint B;
delete from book2;
rollback to savepoint B ;
commit;