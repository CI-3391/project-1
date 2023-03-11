-- Esta tabla tiene la bondad de que se pueden elimar las columnas que contiene null puesto que no
-- existe alguna columna que tenga un atributo null pero el resto no.

CREATE TABLE svr.excess_mortality
(	
	iso_code varchar(100)  references svr.country(iso_code) not null,
 	date date,
	
 	excess_mortality numeric(16,4),
 	excess_mortality_cumulative numeric(16,4),
 	excess_mortality_cumulative_absolute numeric(16,4),
 	excess_mortality_cumulative_per_million numeric(16,4),
	
	primary key (iso_code, date)
);

insert into svr.excess_mortality (
	select
		iso_code,
		date,
		excess_mortality,
		excess_mortality_cumulative,
		excess_mortality_cumulative_absolute,
		excess_mortality_cumulative_per_million
	from svr.data
	where 
		excess_mortality is not null
		or excess_mortality_cumulative is not null
		or excess_mortality_cumulative_absolute is not null
		or excess_mortality_cumulative_per_million is not null
);