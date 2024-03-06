--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_spherical boolean,
    diameter_in_kiloparsec integer NOT NULL,
    distance_from_earth_in_kiloparsecs integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius_in_km integer NOT NULL,
    orbit_in_km integer,
    gravity_in_g numeric(4,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius_in_km integer NOT NULL,
    has_life boolean,
    temperature_c integer,
    mass_in_earth numeric(4,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: race; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.race (
    race_id integer NOT NULL,
    name character varying(20) NOT NULL,
    about text NOT NULL
);


ALTER TABLE public.race OWNER TO freecodecamp;

--
-- Name: race_race_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.race_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_race_id_seq OWNER TO freecodecamp;

--
-- Name: race_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.race_race_id_seq OWNED BY public.race.race_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass_in_suns numeric(5,1) NOT NULL,
    radius_in_suns numeric(10,1),
    temperature_in_kelvins integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: race race_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race ALTER COLUMN race_id SET DEFAULT nextval('public.race_race_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', false, 47, 800, NULL);
INSERT INTO public.galaxy VALUES (2, 'Triangle', false, 19, 850, NULL);
INSERT INTO public.galaxy VALUES (3, 'Small Magellan Cloud', false, 6, 56, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellan Cloud', false, 10, 50, NULL);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', false, 32, 0, NULL);
INSERT INTO public.galaxy VALUES (6, 'M32', true, 3, 760, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 384399, 1.68, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 23, 9377, 0.01, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 23458, 0.00, 2);
INSERT INTO public.moon VALUES (4, 'Pegasus', 3456, 10928, 2.78, 3);
INSERT INTO public.moon VALUES (5, 'Elfo', 345, 10928, 2.78, 3);
INSERT INTO public.moon VALUES (6, 'Iurakvaks', 435, 45346, 3.56, 3);
INSERT INTO public.moon VALUES (7, 'Thorin', 224, 24889, 3.01, 3);
INSERT INTO public.moon VALUES (8, 'Husky', 1208, 123478, 1.14, 4);
INSERT INTO public.moon VALUES (9, 'Korgi', 458, 76987, 0.67, 4);
INSERT INTO public.moon VALUES (10, 'Hildi', 112, 27098, 0.24, 5);
INSERT INTO public.moon VALUES (11, 'Senya', 223, 56739, 0.46, 5);
INSERT INTO public.moon VALUES (12, 'Midya', 87, 25091, 0.09, 6);
INSERT INTO public.moon VALUES (13, 'Liberty', 124, 34509, 0.17, 6);
INSERT INTO public.moon VALUES (14, 'Noway', 567, 100456, 1.12, 7);
INSERT INTO public.moon VALUES (15, 'Runfools', 876, 201765, 1.56, 7);
INSERT INTO public.moon VALUES (16, 'Imperius', 187, 87099, 0.56, 8);
INSERT INTO public.moon VALUES (17, 'Voldemort', 245, 145630, 0.89, 8);
INSERT INTO public.moon VALUES (18, 'Lestrange', 189, 90876, 0.89, 9);
INSERT INTO public.moon VALUES (19, 'Longbottom', 367, 145098, 1.23, 9);
INSERT INTO public.moon VALUES (20, 'Kiljedenus', 1907, 345098, 1.98, 10);
INSERT INTO public.moon VALUES (21, 'Archimond', 2239, 435637, 2.95, 10);
INSERT INTO public.moon VALUES (22, 'Musha', 1209, 198709, 1.89, 11);
INSERT INTO public.moon VALUES (23, 'Eluna', 1567, 298760, 2.22, 11);
INSERT INTO public.moon VALUES (24, 'Durotan', 599, 95666, 0.78, 12);
INSERT INTO public.moon VALUES (25, 'Irel', 777, 145600, 1.00, 12);
INSERT INTO public.moon VALUES (26, 'Itil', 1101, 234098, 1.34, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra', 6371, true, 18, 1.0, 5);
INSERT INTO public.planet VALUES (2, 'Mars', 3390, true, -60, 0.1, 5);
INSERT INTO public.planet VALUES (3, 'Centaurus G', 4563, false, -10, 1.3, 1);
INSERT INTO public.planet VALUES (4, 'Canis Lupus', 3987, true, 13, 0.8, 2);
INSERT INTO public.planet VALUES (5, 'Pusis Bellas A', 5671, true, 15, 1.1, 3);
INSERT INTO public.planet VALUES (6, 'Kildizapa', 4673, true, 14, 1.2, 4);
INSERT INTO public.planet VALUES (7, 'UHH EBAT 404', 11456, false, 187, 56.6, 6);
INSERT INTO public.planet VALUES (8, 'Avada Kedavra', 7653, false, 76, 35.6, 7);
INSERT INTO public.planet VALUES (9, 'Crucio Largo', 5903, false, -80, 10.2, 7);
INSERT INTO public.planet VALUES (10, 'Argus', 4316, true, 19, 0.7, 8);
INSERT INTO public.planet VALUES (11, 'Azeroth', 6234, true, 18, 1.1, 9);
INSERT INTO public.planet VALUES (12, 'Draenor', 4376, true, 18, 0.9, 9);
INSERT INTO public.planet VALUES (13, 'Arda', 5109, true, 20, 1.0, 10);


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.race VALUES (1, 'Human', 'Great spirit but also great wish to kill themselves');
INSERT INTO public.race VALUES (2, 'Elf', 'Noble, patient and pointed-eared');
INSERT INTO public.race VALUES (3, 'Dwarf', 'Incredible hospitality and love to drink');
INSERT INTO public.race VALUES (4, 'Marcian', 'Green and small but very smart');
INSERT INTO public.race VALUES (5, 'Unicorn', 'One horn, seven colors of rainbow and love from all the girls');
INSERT INTO public.race VALUES (6, 'Werewolf', 'One day it is a human, another day it is a big mad wolf');
INSERT INTO public.race VALUES (8, 'Drainei', 'Pious exiles travelling through the space');
INSERT INTO public.race VALUES (9, 'Orc', 'Big, stupid, green-skinned - a perfect murder weapon');
INSERT INTO public.race VALUES (10, 'Goblin', 'Tricky but weak. Likes caves and darkness');
INSERT INTO public.race VALUES (7, 'Elephant', 'Big, king and very very cute');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxyma Centaura', 0.1, 0.1, 3080, 5);
INSERT INTO public.star VALUES (2, 'Sirius', 2.0, 1.7, 9940, 5);
INSERT INTO public.star VALUES (3, 'Clarius', 1.5, 1.3, 3058, 1);
INSERT INTO public.star VALUES (4, 'Amarante', 2.4, 1.8, 4200, 1);
INSERT INTO public.star VALUES (5, 'Sun', 1.0, 1.0, 5772, 5);
INSERT INTO public.star VALUES (6, 'WOH G64', 40.0, 1788.0, 3500, 4);
INSERT INTO public.star VALUES (7, 'Bellatrix', 17.8, 24.0, 3965, 6);
INSERT INTO public.star VALUES (8, 'Antorus', 8.2, 7.4, 5674, 2);
INSERT INTO public.star VALUES (9, 'Anshe', 1.3, 1.3, 6123, 3);
INSERT INTO public.star VALUES (10, 'Anar', 1.8, 1.4, 5523, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: race_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.race_race_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: race race_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_name_key UNIQUE (name);


--
-- Name: race race_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_pkey PRIMARY KEY (race_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

