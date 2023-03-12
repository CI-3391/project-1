/* 
	RESPONSE: QUERY TWO (svr.policy_responses)
*/

create table svr.total_cases (
	iso_code varchar(100) references svr.country(iso_code) not null,
	
 	max_total_case numeric(16,4),
	
	primary key (iso_code)
);

insert into svr.total_cases (
	select
		c.iso_code,
		case when max(total_cases) is null then 0 else max(total_cases) end as max
	from svr.country as c
	left join svr.confirmed_cases as n on c.iso_code = n.iso_code
	group by c.iso_code
);

create table svr.query_two (
	iso_code varchar(100) references svr.country(iso_code) not null,
	date date,
	
	primary key (iso_code)
);

insert into svr.query_two (
	select o.iso_code, min(i.date) as date
	from svr.total_cases as o
	left join svr.confirmed_cases as i on o.iso_code = i.iso_code
	where i.total_cases >= o.max_total_case / 2 or i.total_cases is null
	group by o.iso_code
	order by o.iso_code
);