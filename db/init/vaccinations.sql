CREATE TABLE svr.vaccinations (	
	iso_code varchar(100) references svr.country(iso_code) not null,
 	date date not null,
	
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
	
	primary key (iso_code, date)
);

insert into svr.vaccinations (
	select
		iso_code,
		date,
		total_vaccinations,
		people_vaccinated,
		people_fully_vaccinated,
		total_boosters,
		new_vaccinations,
		new_vaccinations_smoothed,
		total_vaccinations_per_hundred,
		people_vaccinated_per_hundred,
		people_fully_vaccinated_per_hundred,
		total_boosters_per_hundred,
		new_vaccinations_smoothed_per_million,
		new_people_vaccinated_smoothed,
		new_people_vaccinated_smoothed_per_hundred
	from svr.data
	where 
		total_vaccinations is not null
		or people_vaccinated is not null
		or people_fully_vaccinated is not null
		or total_boosters is not null
		or new_vaccinations is not null
		or new_vaccinations_smoothed is not null
		or total_vaccinations_per_hundred is not null
		or people_vaccinated_per_hundred is not null
		or people_fully_vaccinated_per_hundred is not null
		or total_boosters_per_hundred is not null
		or new_vaccinations_smoothed_per_million is not null
		or new_people_vaccinated_smoothed is not null
		or new_people_vaccinated_smoothed_per_hundred is not null
);