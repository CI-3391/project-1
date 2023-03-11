CREATE TABLE policy_responses (	
	iso_code varchar(100),
 	date date,
	
 	stringency_index numeric(16,4),
	
	primary key (iso_code, date)
);

insert into policy_responses (
	select
		iso_code,
		date,
		stringency_index
	from data
	where 
		stringency_index is not null
);