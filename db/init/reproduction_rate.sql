CREATE TABLE svr.reproduction_rate
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
 	date date not null,
	
 	reproduction_rate numeric(16,4),
	
	primary key (iso_code, date)
);

insert into svr.reproduction_rate (
	select
		iso_code,
		date,
		reproduction_rate
	from svr.data
	where 
		reproduction_rate is not null
);