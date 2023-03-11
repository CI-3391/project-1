CREATE TABLE svr.hostpital_and_icu
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
 	date date,
	
 	icu_patients numeric(16,4),
 	icu_patients_per_million numeric(16,4),
 	hosp_patients numeric(16,4),
	hosp_patients_per_million numeric(16,4),
	weekly_icu_admissions numeric(16,4),
	weekly_icu_admissions_per_million numeric(16,4),
	weekly_hosp_admissions numeric(16,4),
	weekly_hosp_admissions_per_million numeric(16,4),
	
	primary key (iso_code, date)
);

insert into svr.hostpital_and_icu (
	select 
		iso_code,
		date, 
		icu_patients,
		icu_patients_per_million,
		hosp_patients,
		hosp_patients_per_million,
		weekly_icu_admissions,
		weekly_icu_admissions_per_million,
		weekly_hosp_admissions,
		weekly_hosp_admissions_per_million
	from svr.data
	where
		icu_patients is not null
		or icu_patients_per_million is not null
		or hosp_patients is not null
		or hosp_patients_per_million is not null
		or weekly_icu_admissions is not null
		or weekly_icu_admissions_per_million is not null
		or weekly_hosp_admissions is not null
		or weekly_hosp_admissions_per_million is not null
);