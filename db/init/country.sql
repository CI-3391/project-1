create table svr.country (
	iso_code varchar(100) primary key not null,
	
	continent varchar(100),
	location varchar(100),
	population numeric(16,4),
	population_density numeric(16,4),
	median_age numeric(16,4),
	aged_65_older numeric(16,4),
	aged_70_older numeric(16,4),
	gdp_per_capita numeric(16,4),
	extreme_poverty numeric(16,4),
	cardiovasc_death_rate numeric(16,4),
	diabetes_prevalence numeric(16,4),
	female_smokers numeric(16,4),
	male_smokers numeric(16,4),
	handwashing_facilities numeric(16,4),
	hospital_beds_per_thousand numeric(16,4),
	life_expectancy numeric(16,4),
	human_development_index numeric(16,4),
	
	test_unit varchar(100) references test_unit(name)
);

insert into svr.country(
	(
		select distinct
			iso_code,
			continent,
			location,
			population,
			population_density,
			median_age,
			aged_65_older,
			aged_70_older,
			gdp_per_capita,
			extreme_poverty,
			cardiovasc_death_rate,
			diabetes_prevalence,
			female_smokers,
			male_smokers,
			handwashing_facilities,
			hospital_beds_per_thousand,
			life_expectancy,
			human_development_index,
			null as tests_units
		from svr.data

		except

		select distinct
			iso_code,
			continent,
			location,
			population,
			population_density,
			median_age,
			aged_65_older,
			aged_70_older,
			gdp_per_capita,
			extreme_poverty,
			cardiovasc_death_rate,
			diabetes_prevalence,
			female_smokers,
			male_smokers,
			handwashing_facilities,
			hospital_beds_per_thousand,
			life_expectancy,
			human_development_index,
			null as tests_units
		from svr.data
		where 
			tests_units is not null
	)

	union

	select distinct
		iso_code,
		continent,
		location,
		population,
		population_density,
		median_age,
		aged_65_older,
		aged_70_older,
		gdp_per_capita,
		extreme_poverty,
		cardiovasc_death_rate,
		diabetes_prevalence,
		female_smokers,
		male_smokers,
		handwashing_facilities,
		hospital_beds_per_thousand,
		life_expectancy,
		human_development_index,
		tests_units
	from svr.data
	where 
		tests_units is not null
	order by iso_code
);