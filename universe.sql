--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying,
    earthdistance integer,
    galaxy_id integer NOT NULL,
    reachable boolean,
    size integer NOT NULL
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
    name character varying NOT NULL,
    earth_distance bigint,
    planet_id integer,
    moon_id integer NOT NULL,
    size integer
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
    name character varying NOT NULL,
    earth_distance integer,
    gravity_strength numeric,
    reachable boolean,
    planet_id integer NOT NULL,
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    name character varying NOT NULL,
    solar_system_id integer NOT NULL,
    earth_distance numeric
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_systems_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_systems_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_systems_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_systems_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_systems_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying NOT NULL,
    earth_distance numeric,
    star_id integer NOT NULL,
    colour text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_seq OWNER TO freecodecamp;

--
-- Name: star_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_seq OWNED BY public.star.star_id;


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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_systems_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 0, 1, true, 100000);
INSERT INTO public.galaxy VALUES ('Andromeda', 2500000, 2, false, 170000);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf', 25000, 3, false, 5000);
INSERT INTO public.galaxy VALUES ('Sagittarius Dwarf', 70000, 4, false, 10000);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 170000, 5, false, 20000);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 200000, 6, false, 7000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 384400, 1, 1, 3475);
INSERT INTO public.moon VALUES ('Phobos', 225000000, 4, 2, 22);
INSERT INTO public.moon VALUES ('Deimos', 225000000, 4, 3, 12);
INSERT INTO public.moon VALUES ('Io', 715000000, 5, 4, 3643);
INSERT INTO public.moon VALUES ('Europa', 715000000, 5, 5, 3122);
INSERT INTO public.moon VALUES ('Ganymede', 715000000, 5, 6, 5268);
INSERT INTO public.moon VALUES ('Callisto', 715000000, 5, 7, 4821);
INSERT INTO public.moon VALUES ('Titan', 1400000000, 6, 8, 5150);
INSERT INTO public.moon VALUES ('Rhea', 1400000000, 6, 9, 1527);
INSERT INTO public.moon VALUES ('Iapetus', 1400000000, 6, 10, 1469);
INSERT INTO public.moon VALUES ('Dione', 1400000000, 6, 11, 1123);
INSERT INTO public.moon VALUES ('Tethys', 1400000000, 6, 12, 1060);
INSERT INTO public.moon VALUES ('Enceladus', 1400000000, 6, 13, 504);
INSERT INTO public.moon VALUES ('Mimas', 1400000000, 6, 14, 396);
INSERT INTO public.moon VALUES ('Titania', 2900000000, 7, 15, 1578);
INSERT INTO public.moon VALUES ('Oberon', 2900000000, 7, 16, 1523);
INSERT INTO public.moon VALUES ('Ariel', 2900000000, 7, 17, 1158);
INSERT INTO public.moon VALUES ('Miranda', 2900000000, 7, 18, 471);
INSERT INTO public.moon VALUES ('Triton', 4500000000, 8, 19, 2707);
INSERT INTO public.moon VALUES ('Umbriel', 2900000000, 7, 20, 1169);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 0, 9.8, true, 1, 1);
INSERT INTO public.planet VALUES ('Mercury', 150, 3.7, false, 2, 1);
INSERT INTO public.planet VALUES ('Venus', 150, 8.87, false, 3, 1);
INSERT INTO public.planet VALUES ('Mars', 225, 3.71, true, 4, 1);
INSERT INTO public.planet VALUES ('Jupiter', 760, 23.12, false, 5, 1);
INSERT INTO public.planet VALUES ('Saturn', 1400, 10.44, false, 6, 1);
INSERT INTO public.planet VALUES ('Uranus', 2850, 8.87, false, 7, 1);
INSERT INTO public.planet VALUES ('Neptune', 4500, 11.15, false, 8, 1);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 4240, 10.0, false, 9, 4);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 39600, 8.0, false, 10, 8);
INSERT INTO public.planet VALUES ('55 Cancri e', 41000, 22.5, false, 11, 9);
INSERT INTO public.planet VALUES ('Kepler-452b', 1800000, 18.0, false, 12, 10);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES ('Solar System', 1, 0);
INSERT INTO public.solar_system VALUES ('TRAPPIST-1', 2, 40);
INSERT INTO public.solar_system VALUES ('55 Cancri', 3, 41);
INSERT INTO public.solar_system VALUES ('Proxima Centauri', 4, 4.25);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 0.0000158, 1, 'White', 1);
INSERT INTO public.star VALUES ('Sirius', 8.6, 2, 'Blue-White', 1);
INSERT INTO public.star VALUES ('Betelgeuse', 670, 3, 'Orange-Red', 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 4.25, 4, 'Red', 1);
INSERT INTO public.star VALUES ('S Andromedae', 2600000, 5, 'Red', 2);
INSERT INTO public.star VALUES ('WOH G64', 160000, 6, 'Red', 5);
INSERT INTO public.star VALUES ('S Doradus', 170000, 7, 'Blue', 5);
INSERT INTO public.star VALUES ('TRAPPIST-1', 40, 8, 'Red', 1);
INSERT INTO public.star VALUES ('55 Cancri A', 41, 9, 'Yellow', 1);
INSERT INTO public.star VALUES ('Kepler-452', 1600, 10, 'Yellow', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_systems_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_systems_solar_system_id_seq', 4, true);


--
-- Name: star_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_seq', 10, true);


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
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_systems_pkey PRIMARY KEY (solar_system_id);


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
-- Name: moon moon_parent_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_parent_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

