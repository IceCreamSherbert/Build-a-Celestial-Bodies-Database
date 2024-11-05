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
    name character varying(50),
    galaxy_type text,
    estimated_stars_in_billions integer NOT NULL,
    distance_from_earth_millions_of_light_years integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    has_atmosphere boolean,
    surface_composition text,
    estimated_orbital_period_in_days integer NOT NULL,
    average_temp_in_degrees_celsius integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer,
    number_of_moons integer NOT NULL,
    planet_type text NOT NULL,
    orbital_period_in_days integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: probe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.probe (
    probe_id integer NOT NULL,
    name character varying(30) NOT NULL,
    launch_year numeric NOT NULL,
    has_completed_mission boolean
);


ALTER TABLE public.probe OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    number_of_planets integer NOT NULL,
    age_in_millions_of_years integer,
    star_type text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 100, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000, 3);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40, 3);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 2400, 54);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Lenticular', 800, 31);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Spiral', 100, 23);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 'Rocky', 27, -20);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 'Rocky', 0, -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 'Rocky', 1, -40);
INSERT INTO public.moon VALUES (4, 'Io', 3, true, 'Volcanic', 2, -143);
INSERT INTO public.moon VALUES (5, 'Europa', 3, true, 'Icy', 4, -160);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, false, 'Icy', 7, -150);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, false, 'Icy', 17, -139);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 'Methane and Icy', 16, -179);
INSERT INTO public.moon VALUES (9, 'Enceladuc', 4, true, 'Icy', 1, -198);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, false, 'Rocky and Icy', 1, -200);
INSERT INTO public.moon VALUES (11, 'Tethys', 4, false, 'Icy', 2, -187);
INSERT INTO public.moon VALUES (12, 'Dione', 4, false, 'Icy', 3, -186);
INSERT INTO public.moon VALUES (13, 'Rhea', 4, false, 'Icy', 5, -174);
INSERT INTO public.moon VALUES (14, 'Triton', 9, true, 'Icy', 6, -235);
INSERT INTO public.moon VALUES (15, 'Nereid', 9, false, 'Rocky and Icy', 360, -200);
INSERT INTO public.moon VALUES (16, 'Hypothetica', 11, false, 'Rocky', 40, -100);
INSERT INTO public.moon VALUES (17, 'Hypothetica II', 12, false, 'Rocky', 45, -105);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, false, 'Icy', 14, -193);
INSERT INTO public.moon VALUES (19, 'Titania', 7, false, 'Rocky and Icy', 9, -190);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, false, 'Icy', 1, -187);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 'Terrestrial', 365);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, 'Terrestrial', 687);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 79, 'Gas Giant', 4333);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 82, 'Gas Giant', 10759);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 0, 'Terrestrial', 11);
INSERT INTO public.planet VALUES (6, 'PA 99 N2 c', 3, 1, 'Gas Giant', 3);
INSERT INTO public.planet VALUES (7, 'PA 99 N2 d', 3, 0, 'Terrestrial', 36);
INSERT INTO public.planet VALUES (8, 'RX J00426 4114 b', 4, 0, 'Ice Giant', 13);
INSERT INTO public.planet VALUES (9, 'M33 V1 a', 5, 2, 'Gas Giant', 207);
INSERT INTO public.planet VALUES (10, 'M33 V1 b', 5, 1, 'Terrestrial', 362);
INSERT INTO public.planet VALUES (11, 'M87 Exo 1', 6, 0, 'Hypothetical', 480);
INSERT INTO public.planet VALUES (12, 'M87 Exo 2', 6, 0, 'Hypothetical', 820);


--
-- Data for Name: probe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.probe VALUES (1, 'Voyager 1', 1977, true);
INSERT INTO public.probe VALUES (2, 'New Horizons', 2006, true);
INSERT INTO public.probe VALUES (3, 'James Webb', 2021, false);
INSERT INTO public.probe VALUES (4, 'Voyager 2', 1977, true);
INSERT INTO public.probe VALUES (5, 'Hubble Telescope', 1990, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 8, 4600, 'G Type Main Sequence');
INSERT INTO public.star VALUES (2, 'Alpha Centari A', 1, 1, 5000, 'G Type Main Sequence');
INSERT INTO public.star VALUES (3, 'PA 99 N2', 2, 3, 100, 'Red Giant');
INSERT INTO public.star VALUES (4, 'J004357 4134', 2, 2, 19, 'Neutron Star');
INSERT INTO public.star VALUES (5, 'M33 V1', 3, 4, 12, 'Red Supergiant');
INSERT INTO public.star VALUES (6, 'M87 Black Hole', 4, 1, 13000, 'Supermassive Black Hole');


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
-- Name: probe probe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.probe
    ADD CONSTRAINT probe_name_key UNIQUE (name);


--
-- Name: probe probe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.probe
    ADD CONSTRAINT probe_pkey PRIMARY KEY (probe_id);


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

