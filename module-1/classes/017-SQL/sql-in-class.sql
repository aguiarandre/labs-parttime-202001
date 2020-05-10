SELECT building_id FROM public.buildings;

SELECT * FROM public.buildings;

-- isto é um comentário

/* 
isto é um comentário multi-linha

SELECT * FROM movies;
*/

SELECT * FROM public.movies;

SELECT *
  FROM public.movies 
 LIMIT 5;
 
 /* Nao fazer !!!!!!!
 
 SELECT id
	   ,title
	   ,director
	   ,year
	   ,length_minutes
  FROM public.movies 
 LIMIT 5;
 */
 
SELECT * 
  FROM public.movies 
 WHERE year < 2000;
 
 SELECT * 
  FROM public.movies 
 WHERE year > 2000 
   AND year < 2005;
   
SELECT * 
  FROM public.movies 
 WHERE year = 2009;

SELECT * 
  FROM public.movies 
 WHERE director = 'Brad Bird';
 
 SELECT * 
  FROM public.movies 
 WHERE director = 'Brad Bird' 
    OR director = 'John Lasseter';

 SELECT * 
  FROM public.movies AS A
 WHERE A.director = 'Brad Bird' AND A.length_minutes <= 115;

 SELECT * 
  FROM public.movies 
 WHERE director IN ('Brad Bird', 'John Lasseter');
 
 
 SELECT id AS movie_id,
	    title,
	    director,
	    year,
	    length_minutes
   FROM public.movies
  WHERE length_minutes < 100 
  ORDER BY length_minutes DESC
  LIMIT 3 OFFSET 1;
  
  
 
SELECT * FROM public.employees;
-- CONTAR NUMERO DE LINHAS NAO NULAS

SELECT COUNT(building) FROM public.employees;

SELECT MAX(years_employed) FROM public.employees;

SELECT * FROM public.employees;

SELECT role,
	   AVG(years_employed) AS avg_years_employed 
  FROM public.employees
 GROUP BY role;


SELECT role,
	     AVG(years_employed) AS avg_years_employed 
  FROM public.employees
 GROUP BY 1;