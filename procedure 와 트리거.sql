delimiter $$
create trigger `account_BEFORE_UPDATE` before update on `account` for each row
begin
	if (new.amount <0) then
		signal sqlstat '45000';
    end if;
end
delimiter;

delimiter $$
create procedure `account_transaction`(
in sender char(15),
in recip char(15), 
in pamount int
)
begin
	declare exit handler for sqlexception rollback;
	start transaction;
		update account
		set pamount = pamount - pamount
		where accNum = sender;
		update account
		set pamount = pamount + pamount
		where accNum = recip;
        commit;
END;
delimiter;
