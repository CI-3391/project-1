/* 
	CREATE AND LOAD TABLE (svr.policy_responses)
*/

CREATE TABLE svr.policy_responses (	
	iso_code varchar(100) references svr.country(iso_code) not null,
 	date date not null,
	
 	stringency_index numeric(16,4),
	
	primary key (iso_code, date)
);

insert into svr.policy_responses (
	select
		iso_code,
		date,
		stringency_index
	from svr.data
	where 
		stringency_index is not null
);