/* 
	RESPONSE: QUERY FIVE
*/

-- NOTES:
-- Por alguna razón desconocida, al insertar los datos ordenados por growth_rate
-- en la tabla final, estos se vuelve a desordenar al momento de hacer la 
-- solicitud. Por lo tanto se recomienda consultar el resultado con el siguiente
-- query:
/* 
    select * from svr.query_five order by growth_rate
 */

create table svr.query_five (
	iso_code varchar(100) references svr.country(iso_code) not null,
	
	growth_rate numeric(16,4),
	
	primary key(iso_code)
);

insert into svr.query_five (
	select *
	from (
		select 
			cn.iso_code, 
			case 
				when max(cs.total_cases) is null or max(cs.total_cases) is null or cn.population is null then 0 
				else ( max(cs.total_cases) - min(cs.total_cases) / cn.population )  
			end as growth_rate
		from svr.country cn
		left join svr.confirmed_cases as cs on cn.iso_code = cs.iso_code
		group by cn.iso_code, cn.population
	) as res
	order by res.growth_rate desc
);