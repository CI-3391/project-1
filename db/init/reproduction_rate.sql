CREATE TABLE reproduction_rate
(	
	iso_code varchar(100),
 	date date,
	
 	reproduction_rate numeric(16,4),
	
	primary key (iso_code, date)
);

insert into reproduction_rate (
	select
		iso_code,
		date,
		reproduction_rate
	from data
	where 
		reproduction_rate is not null
);