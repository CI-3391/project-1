-- tests_units son son agregados en esta tabla puesto que solo existe uno por
-- country y cuendo este es nulo el resto de atributos tambien lo son.

CREATE TABLE tests_and_positivity (	
	iso_code varchar(100),
 	date date,
	
 	total_tests numeric(16,4),
	new_tests numeric(16,4),
	total_tests_per_thousand numeric(16,4),
	new_tests_per_thousand numeric(16,4),
	new_tests_smoothed numeric(16,4),
	new_tests_smoothed_per_thousand numeric(16,4),
	positive_rate numeric(16,4),
	tests_per_case numeric(16,4),
	
	primary key (iso_code, date)
);

insert into tests_and_positivity (
	select
		iso_code,
		date,
		total_tests,
		new_tests,
		total_tests_per_thousand,
		new_tests_per_thousand,
		new_tests_smoothed,
		new_tests_smoothed_per_thousand,
		positive_rate,
		tests_per_case
	from data
	where 
		total_tests is not null
		or new_tests is not null
		or total_tests_per_thousand is not null
		or new_tests_per_thousand is not null
		or new_tests_smoothed is not null
		or new_tests_smoothed_per_thousand is not null
		or positive_rate is not null
		or tests_per_case is not null
);