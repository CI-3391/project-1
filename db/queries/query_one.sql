create table svr.query_one (
	iso_code varchar(100) references svr.country(iso_code) not null,
	date date not null,
	
	new_cases numeric(16,4),
	new_cases_smoothed numeric(16,4),
	new_cases_smoothed_calc numeric(16,4),
	
	primary key(iso_code, date)
);

insert into svr.query_one (
	SELECT iso_code, date, new_cases, new_cases_smoothed, avg(new_cases) OVER w as new_cases_smoothed_calc 
	FROM svr.confirmed_cases
	WINDOW w AS (
		PARTITION BY iso_code 
		ORDER BY date 
		ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
	)
);