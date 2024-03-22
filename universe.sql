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
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    description text,
    age_in_billions_of_years integer
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
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
-- Name: more_galaxy_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_galaxy_info (
    more_galaxy_info_id integer NOT NULL,
    diameter_in_ly integer,
    galaxy_id integer NOT NULL,
    number_of_stars_billions numeric,
    name character varying(20)
);


ALTER TABLE public.more_galaxy_info OWNER TO freecodecamp;

--
-- Name: more_galaxy_info_more_galaxy_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_galaxy_info_more_galaxy_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_galaxy_info_more_galaxy_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_galaxy_info_more_galaxy_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_galaxy_info_more_galaxy_info_id_seq OWNED BY public.more_galaxy_info.more_galaxy_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    planet_type character varying(20),
    star_id integer,
    description text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_ly numeric(5,1),
    is_binary boolean,
    description text,
    galaxy_id integer,
    age_in_billions_of_years numeric(6,3)
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
-- Name: more_galaxy_info more_galaxy_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_galaxy_info ALTER COLUMN more_galaxy_info_id SET DEFAULT nextval('public.more_galaxy_info_more_galaxy_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 'Home of our solar system', 14);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 'Closest major galaxy to Milky Way', 10);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'dwarf irregular', 'Small galaxy near Milky Way', 6);
INSERT INTO public.galaxy VALUES (4, 'NGC 6872', 'spiral', 'Largest known spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'ESO 383-76', 'elliptical', 'Largest known galaxy', NULL);
INSERT INTO public.galaxy VALUES (6, 'Baby Boom', 'starburst', 'Brightest starburst galaxy with high rate of star formation', 12);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Only moon of Earth', true, 3);
INSERT INTO public.moon VALUES (4, 'Io', '4th largest in Solar System', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Galilean moon', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Galilean moon', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Galilean moon', true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', true, 6);
INSERT INTO public.moon VALUES (9, 'Amalthea', 'Inner moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (10, 'Triton', 'Largest moon of Neptune', true, 8);
INSERT INTO public.moon VALUES (11, 'Titania', 'Largest moon of Uranus', true, 7);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Saturn VIII', true, 6);
INSERT INTO public.moon VALUES (15, 'Charon', 'Pluto I; largest', true, 9);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Uranus II', true, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Uranus I', true, 7);
INSERT INTO public.moon VALUES (18, 'Dione', 'Saturn IV', true, 6);
INSERT INTO public.moon VALUES (19, 'Pasiphae', 'Jupiter VIII', false, 5);
INSERT INTO public.moon VALUES (20, 'Nix', 'Pluto II', false, 9);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars I', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars II', false, 4);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Saturn V', true, 6);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Uranus IV', true, 7);


--
-- Data for Name: more_galaxy_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_galaxy_info VALUES (1, 87400, 1, 0.3, 'Milky Way');
INSERT INTO public.more_galaxy_info VALUES (2, 152000, 2, 1000.0, 'Andromeda');
INSERT INTO public.more_galaxy_info VALUES (3, 1760000, 5, NULL, 'ESO 383-76');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'terrestrial', 1, 'Closest planet to Sun');
INSERT INTO public.planet VALUES (2, 'Venus', false, 'terrestrial', 1, '2nd planet from Sun');
INSERT INTO public.planet VALUES (3, 'Earth', true, 'terrestrial', 1, '3rd planet from Sun');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'gas giant', 1, '5th from Sun, largest in Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'gas giant', 1, '6th from Sun, 2nd largest in Solar System');
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'ice giant', 1, '7th from Sun');
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'ice giant', 1, '8th from Sun');
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'dwarf', 1, 'Former planet, now Kuiper belt object');
INSERT INTO public.planet VALUES (4, 'Mars', false, 'terrestrial', 1, '4th planet from Sun');
INSERT INTO public.planet VALUES (10, 'Proxima b', false, 'terrestrial', 2, 'Exoplanet in habitable zone of Proxima Centauri');
INSERT INTO public.planet VALUES (11, 'Proxima d', false, 'terrestrial', 2, 'Exoplanet, innermost in Proxima Centauri system');
INSERT INTO public.planet VALUES (12, 'Luyten b', false, 'terrestrial', 7, 'Exoplanet in habitable zone of Luyten''s Star');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.0, false, 'Parent star of Earth', 1, 4.600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.0, true, 'Nearest star to the Sun, trinary sys', 1, 4.853);
INSERT INTO public.star VALUES (3, 'Sirius', 8.7, true, 'Brightest star in the night sky', 1, 0.230);
INSERT INTO public.star VALUES (4, 'Canopus', 310.0, false, 'Second brightest star in night sky', 1, 0.025);
INSERT INTO public.star VALUES (5, 'Procyon', 11.5, true, 'Brightest star in Canis Major', 1, 1.870);
INSERT INTO public.star VALUES (6, 'VY Canis Majoris', 3820.0, false, 'Extremely large red hypergiant', 1, 0.008);
INSERT INTO public.star VALUES (7, 'Luyten''s Star', 12.3, false, 'Nearby red dwarf', 1, 8.000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_galaxy_info_more_galaxy_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_galaxy_info_more_galaxy_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: more_galaxy_info more_galaxy_info_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_galaxy_info
    ADD CONSTRAINT more_galaxy_info_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: more_galaxy_info more_galaxy_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_galaxy_info
    ADD CONSTRAINT more_galaxy_info_pkey PRIMARY KEY (more_galaxy_info_id);


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
-- Name: more_galaxy_info more_galaxy_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_galaxy_info
    ADD CONSTRAINT more_galaxy_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

