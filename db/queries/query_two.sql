create table svr.total_cases (
	iso_code varchar(100) references svr.country(iso_code) not null,
	
 	max_total_case numeric(16,4),
	
	primary key (iso_code)
);

insert into svr.total_cases (
	select iso_code, max(total_cases)
	from svr.confirmed_cases
	group by iso_code
);

select o.iso_code, min(o.date) as date
from svr.confirmed_cases as o
join svr.total_cases as i on o.iso_code = i.iso_code
where o.total_cases >= i.max_total_case / 2
group by o.iso_code
order by o.iso_code