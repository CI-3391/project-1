CREATE TABLE data
(	
	iso_code varchar(100),
 	continent varchar(100),
 	location varchar(100),
 	date date,
 	total_cases numeric(16,4),
 	new_cases numeric(16,4),
 	new_cases_smoothed numeric(16,4),
 	total_deaths numeric(16,4),
 	new_deaths numeric(16,4),
 	new_deaths_smoothed numeric(16,4),
 	total_cases_per_million numeric(16,4),
 	new_cases_per_million numeric(16,4),
 	new_cases_smoothed_per_million numeric(16,4),
 	total_deaths_per_million numeric(16,4),
 	new_deaths_per_million numeric(16,4),
 	new_deaths_smoothed_per_million numeric(16,4),
 	reproduction_rate numeric(16,4),
	icu_patients numeric(16,4),
 	icu_patients_per_million numeric(16,4),
 	hosp_patients numeric(16,4),
 	hosp_patients_per_million numeric(16,4),
 	weekly_icu_admissions numeric(16,4),
 	weekly_icu_admissions_per_million numeric(16,4),
 	weekly_hosp_admissions numeric(16,4),
 	weekly_hosp_admissions_per_million numeric(16,4),
 	total_tests numeric(16,4),
 	new_tests numeric(16,4),
 	total_tests_per_thousand numeric(16,4),
 	new_tests_per_thousand numeric(16,4),
 	new_tests_smoothed numeric(16,4),
 	new_tests_smoothed_per_thousand numeric(16,4),
 	positive_rate numeric(16,4),
 	tests_per_case numeric(16,4),
 	tests_units varchar(100),
 	total_vaccinations numeric(16,4),
 	people_vaccinated numeric(16,4),
 	people_fully_vaccinated numeric(16,4),
 	total_boosters numeric(16,4),
 	new_vaccinations numeric(16,4),
 	new_vaccinations_smoothed numeric(16,4),
 	total_vaccinations_per_hundred numeric(16,4),
 	people_vaccinated_per_hundred numeric(16,4),
 	people_fully_vaccinated_per_hundred numeric(16,4),
 	total_boosters_per_hundred numeric(16,4),
 	new_vaccinations_smoothed_per_million numeric(16,4),
 	new_people_vaccinated_smoothed numeric(16,4),
 	new_people_vaccinated_smoothed_per_hundred numeric(16,4),
 	stringency_index numeric(16,4),
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
 	population numeric(16,4),
 	excess_mortality_cumulative_absolute numeric(16,4),
 	excess_mortality_cumulative numeric(16,4),
 	excess_mortality numeric(16,4),
 	excess_mortality_cumulative_per_million numeric(16,4)
);