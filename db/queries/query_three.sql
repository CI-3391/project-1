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