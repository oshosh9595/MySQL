create table account(
accNum char(10) primary key,
amount int not null default 0);

insert into account values('A', 45000);
insert into account values('B', 100000);

start transaction;
	update account
	set amount = amount - 40000
	where accNum = 'A';

	update account
	set amount = amount + 40000
	where accNum = 'B';
    
    update account
    set amount = amount / 0
    where accNum = 'A';
rollback;