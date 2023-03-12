/* 
	CREATE AND LOAD TABLE (svr.test_unit)
*/

create table svr.test_unit (
	name varchar(100) primary key not null
);

insert into svr.test_unit (
	select distinct tests_units from svr.data where tests_units is not null
);