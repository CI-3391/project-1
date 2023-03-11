create table test_unit (
	name varchar(100) primary key not null
);

insert into test_unit (
	select distinct tests_units from data where tests_units is not null
);