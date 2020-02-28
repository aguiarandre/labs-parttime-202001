--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-02-26 00:01:49 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3171 (class 1262 OID 16500)
-- Name: sql_queries; Type: DATABASE; Schema: -; Owner: postgres
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 16547)
-- Name: buildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buildings (
    building_id bigint,
    building_name text,
    height bigint
);


ALTER TABLE public.buildings OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16522)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    "City" text,
    "Country" text,
    "Population" bigint,
    "Latitude" double precision,
    "Longitude" double precision
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16528)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    role text,
    name text,
    years_employed bigint,
    building text
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16513)
-- Name: movie_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_info (
    movie_id bigint,
    rating double precision,
    domestic_sales bigint,
    international_sales bigint
);


ALTER TABLE public.movie_info OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16507)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id bigint,
    title text,
    director text,
    year bigint,
    length_minutes bigint
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16543)
-- Name: new_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.new_view AS
 SELECT movies.id
   FROM public.movies;


ALTER TABLE public.new_view OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16553)
-- Name: user_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_info (
    username text,
    password text
);


ALTER TABLE public.user_info OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 16547)
-- Dependencies: 207
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.buildings (building_id, building_name, height) VALUES (1, 'Burj Khalifa', 828);
INSERT INTO public.buildings (building_id, building_name, height) VALUES (2, 'Central Plaza', 374);
INSERT INTO public.buildings (building_id, building_name, height) VALUES (3, 'Gevora Tower', 356);
INSERT INTO public.buildings (building_id, building_name, height) VALUES (4, 'Empire State', 381);


--
-- TOC entry 3162 (class 0 OID 16522)
-- Dependencies: 204
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Guadalajara', 'Mexico', 1500800, 20.659699, -103.349609);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Toronto', 'Canada', 2795060, 43.653226000000004, -79.383184);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Houston', 'United States', 2195914, 29.760427000000004, -95.369803);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('New York', 'United States', 8405837, 40.712784, -74.005941);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Philadelphia', 'United States', 1553165, 39.952584, -75.165222);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Havana', 'Cuba', 2106146, 23.05407, -82.345189);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Mexico City', 'Mexico', 8555500, 19.432608, -99.133208);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Phoenix', 'United States', 1513367, 33.448377, -112.074037);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Los Angeles', 'United States', 3884307, 34.052234000000006, -118.24368500000001);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Ecatepec de Morelos', 'Mexico', 1742000, 19.601841, -99.050674);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Montreal', 'Canada', 1717767, 45.501689, -73.567256);
INSERT INTO public.cities ("City", "Country", "Population", "Latitude", "Longitude") VALUES ('Chicago', 'United States', 2718782, 41.878114000000004, -87.629798);


--
-- TOC entry 3163 (class 0 OID 16528)
-- Dependencies: 205
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Engineer', 'Becky A.', 4, 'Burj Khalifa');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Engineer', 'Dan B.', 2, 'Burj Khalifa');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Engineer', 'Sharon F.', 6, 'Burj Khalifa');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Engineer', 'Dan M.', 4, 'Burj Khalifa');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Engineer', 'Malcom S.', 1, 'Burj Khalifa');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Artist', 'Tylar S.', 2, 'Empire State');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Artist', 'Sherman D.', 8, 'Empire State');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Artist', 'Jakob J.', 6, 'Empire State');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Artist', 'Lillia A.', 7, 'Empire State');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Artist', 'Brandon J.', 7, 'Empire State');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Manager', 'Scott K.', 9, 'Burj Khalifa');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Manager', 'Shirlee M.', 3, 'Burj Khalifa');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Manager', 'Daria O.', 6, 'Empire State');
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Engineer', 'Yancy I.', 0, NULL);
INSERT INTO public.employees (role, name, years_employed, building) VALUES ('Artist', 'Oliver P.', 0, NULL);


--
-- TOC entry 3161 (class 0 OID 16513)
-- Dependencies: 203
-- Data for Name: movie_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (5, 8.2, 380843261, 555900000);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (14, 7.4, 268492764, 475066843);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (8, 8, 206445654, 417277164);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (12, 6.4, 191452396, 368400000);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (3, 7.9, 245852179, 239163000);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (6, 8, 261441092, 370001000);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (9, 8.5, 223808164, 297503696);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (11, 8.4, 415004880, 648167031);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (1, 8.3, 191796233, 170162503);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (7, 7.2, 244082982, 217900167);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (10, 8.3, 293004164, 438338580);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (4, 8.1, 289916256, 272900000);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (2, 7.2, 162798565, 200600000);
INSERT INTO public.movie_info (movie_id, rating, domestic_sales, international_sales) VALUES (13, 7.2, 237283207, 301700000);


--
-- TOC entry 3160 (class 0 OID 16507)
-- Dependencies: 202
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (1, 'Toy Story', 'John Lasseter', 1995, 81);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (2, 'A Bug''s Life', 'John Lasseter', 1998, 95);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (3, 'Toy Story 2', 'John Lasseter', 1999, 93);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (4, 'Monsters, Inc.', 'Pete Docter', 2001, 92);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (5, 'Finding Nemo', 'Andrew Stanton', 2003, 107);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (6, 'The Incredibles', 'Brad Bird', 2004, 116);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (7, 'Cars', 'John Lasseter', 2006, 117);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (8, 'Ratatouille', 'Brad Bird', 2007, 115);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (9, 'WALL-E', 'Andrew Stanton', 2008, 104);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (10, 'Up', 'Pete Docter', 2009, 101);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (11, 'Toy Story 3', 'Lee Unkrich', 2010, 103);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (12, 'Cars 2', 'John Lasseter', 2011, 120);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (13, 'Brave', 'Brenda Chapman', 2012, 102);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (14, 'Monsters University', 'Dan Scanlon', 2013, 110);
INSERT INTO public.movies (id, title, director, year, length_minutes) VALUES (87, 'WALL-G', 'Brenda Chapman', 2042, 97);


--
-- TOC entry 3165 (class 0 OID 16553)
-- Dependencies: 208
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_info (username, password) VALUES ('andre', 'admin');
INSERT INTO public.user_info (username, password) VALUES ('lucas', 'qwerty');
INSERT INTO public.user_info (username, password) VALUES ('rai', '123456789');


-- Completed on 2020-02-26 00:01:49 -03

--
-- PostgreSQL database dump complete
--

