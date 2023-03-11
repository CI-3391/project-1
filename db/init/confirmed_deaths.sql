CREATE TABLE svr.confirmed_deaths
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
 	date date not null,
	
 	total_deaths numeric(16,4),
 	new_deaths numeric(16,4),
 	new_deaths_smoothed numeric(16,4),
 	total_deaths_per_million numeric(16,4),
 	new_deaths_per_million numeric(16,4),
 	new_deaths_smoothed_per_million numeric(16,4),
	
	primary key (iso_code, date)
);

insert into svr.confirmed_deaths (
	select 
		iso_code,
		date,
		total_deaths,
		new_deaths,
		new_deaths_smoothed,
		total_deaths_per_million,
		new_deaths_per_million,
		new_deaths_smoothed_per_million
	from svr.data
	WHERE
		total_deaths is not null
		or new_deaths is not null
		or new_deaths_smoothed is not null
		or total_deaths_per_million is not null
		or new_deaths_per_million is not null
		or new_deaths_smoothed_per_million is not null
);