/* 
	RESPONSE: QUERY three (svr.policy_responses)
*/

CREATE TABLE svr.total_vaccinations
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
	
 	max_total_vaccinations numeric(16,4),
	
	primary key (iso_code)
);

insert into svr.total_vaccinations (
	select iso_code, Max(total_vaccinations) as max_total_vaccinations
	from svr.vaccinations
	group by iso_code
);

CREATE TABLE svr.total_vaccinations_date_on_66
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
	date date not null,
	
	primary key (iso_code)
);

insert into svr.total_vaccinations_date_on_66 (
	select o.iso_code, min(o.date) as date
	from svr.vaccinations as o
	join svr.total_vaccinations as i on o.iso_code = i.iso_code
	where o.total_vaccinations >= i.max_total_vaccinations * 0.6666
	group by o.iso_code,i.max_total_vaccinations
	order by o.iso_code
);

CREATE TABLE svr.total_deaths_before_66
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
	
 	min_total_deaths numeric(16,4),
	max_total_deaths numeric(16,4),
	count_total_deaths int,
	
	primary key (iso_code)
);

insert into svr.total_deaths_before_66 (
	select c.iso_code, min(c.total_deaths), max(c.total_deaths), count(c.date)
	from svr.confirmed_deaths as c
	join svr.total_vaccinations_date_on_66 as d on c.iso_code = d.iso_code
	where c.date < d.date
	group by c.iso_code
);

CREATE TABLE svr.total_deaths_after_66
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
	
 	min_total_deaths numeric(16,4),
	max_total_deaths numeric(16,4),
	count_total_deaths int,
	
	primary key (iso_code)
);

insert into svr.total_deaths_after_66 (
	select c.iso_code, min(c.total_deaths), max(c.total_deaths), count(c.date)
	from svr.confirmed_deaths as c
	join svr.total_vaccinations_date_on_66 as d on c.iso_code = d.iso_code
	where c.date >= d.date
	group by c.iso_code
);


CREATE TABLE svr.query_three
(	
	iso_code varchar(100) references svr.country(iso_code) not null,
	
 	rate_deaths_before numeric(16,3),
	rate_deaths_after numeric(16,3),
	
	primary key (iso_code)
);

insert into svr.query_three (
	select 
		c.iso_code,
		case 
			when b.max_total_deaths is null or b.min_total_deaths is null or b.count_total_deaths is null then 0 
			else ((b.max_total_deaths - b.min_total_deaths) / b.count_total_deaths) 
		end as before,
		case 
			when a.max_total_deaths is null or a.min_total_deaths is null or a.count_total_deaths is null then 0 
			else ((a.max_total_deaths - a.min_total_deaths) / a.count_total_deaths) 
		end as before
	from svr.country as c
	left join svr.total_deaths_before_66 as b on c.iso_code = b.iso_code
	left join svr.total_deaths_after_66 as a on c.iso_code = a.iso_code
);
