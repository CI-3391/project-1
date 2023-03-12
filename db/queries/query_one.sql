/* 
	RESPONSE: QUERY ONE
*/

/* 
    ¿Son siempre iguales los datos de la columna new_cases_smoothed con los
    calculados en el script?


    Salvo por 257 casos, los resultados calculados son iguales.

    Se pueden encontrar estos casos ejecutando:

    SELECT iso_code, date, new_cases, new_cases_smoothed, new_cases_smoothed_calc 
    FROM svr.query_one
    where new_cases_smoothed <> new_cases_smoothed_calc

    Al validar los datos cercanos a cada fecha, usando por ejemplo 2021-10-13
    que se corresponde con uno de los valores desiguales se observa que las 7
    fechas previas no presentan valores diferentes y tampoco son null. Por lo
    tanto se desconoce la razón de por qué estos 257 casos son diferentes.

    Query utilizado para validar las fechas cercanas:

    SELECT iso_code, date, new_cases, new_cases_smoothed, new_cases_smoothed_calc 
    FROM svr.query_one
    where date < '2021-10-13'
    order by date asc
    limit 10
 */

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