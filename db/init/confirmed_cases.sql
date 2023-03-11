CREATE TABLE svr.confirmed_cases
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
 	date date not null,

 	total_cases numeric(16,4),
 	new_cases numeric(16,4),
 	new_cases_smoothed numeric(16,4),
	total_cases_per_million numeric(16,4),
	new_cases_per_million numeric(16,4),
	new_cases_smoothed_per_million numeric(16,4),
    
	primary key (iso_code, date)
);

insert into svr.confirmed_cases (
	select 
		iso_code,
		date,
		total_cases,
		new_cases,
		new_cases_smoothed,
		total_cases_per_million,
		new_cases_per_million,
		new_cases_smoothed_per_million
	from svr.data
	WHERE
		total_cases is not null
		or new_cases is not null
		or new_cases_smoothed is not null
		or total_cases_per_million is not null
		or new_cases_per_million is not null
		or new_cases_smoothed_per_million is not null
);