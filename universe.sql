--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    brightest_star character varying(30),
    size_square_degrees integer,
    main_stars integer,
    stars_with_planets integer,
    fans integer,
    haters integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    mass numeric NOT NULL,
    size numeric NOT NULL,
    number_of_stars character varying(30),
    fans integer,
    haters integer
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
    name character varying(30),
    planet_id integer NOT NULL,
    alt_names text,
    mean_radius integer,
    gravity integer
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
    name character varying(30),
    star_id integer NOT NULL,
    number_of_moons integer,
    has_rings boolean,
    is_dwarf boolean,
    gravity integer
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
    name character varying(30),
    distance_from_sun numeric NOT NULL,
    magnitude numeric NOT NULL,
    galaxy_id integer,
    rotation_days integer,
    gravity integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Alpha Andromedae', 722, 16, 12, NULL, NULL);
INSERT INTO public.constellation VALUES (2, 'Sagittarius', 'Epsilon Sagittarii', 867, 12, 32, NULL, NULL);
INSERT INTO public.constellation VALUES (3, 'Dorado', 'Alpha Doradus', 179, 3, 5, NULL, NULL);
INSERT INTO public.constellation VALUES (4, 'Mensa', 'Alpha Mensae', 153, 4, 3, NULL, NULL);
INSERT INTO public.constellation VALUES (5, 'Tucana', 'Alpha Tucanae', 295, 3, 5, NULL, NULL);
INSERT INTO public.constellation VALUES (6, 'Triangulum', 'Beta Trianguli', 132, 3, 3, NULL, NULL);
INSERT INTO public.constellation VALUES (7, 'Centaurus', 'Alpha Centauri', 1060, 11, 15, NULL, NULL);
INSERT INTO public.constellation VALUES (8, 'Ursa Major', 'Epsilon Ursa Majoris', 1280, 7, 21, NULL, NULL);
INSERT INTO public.constellation VALUES (9, 'Sculptor', 'Alpha Sculptoris', 475, 4, 6, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 21.5, 46.56, '1 trillion', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 5.3502501054737112, 26.8, '100 to 400 Billion', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 1, 9.86, 'unknown', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 2.7, 5.78, 'unknown', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 5.7, 890, 'Unkonwn', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus', 6.84, 4.2, 'Unknown', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 'Luna', 1738, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, 9380, NULL);
INSERT INTO public.moon VALUES (3, 'DEIMOS', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, NULL, 69, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 5, NULL, 43, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, NULL, 30, NULL);
INSERT INTO public.moon VALUES (12, 'Sinope', 5, NULL, 19, NULL);
INSERT INTO public.moon VALUES (13, 'Lysithea', 5, NULL, 18, NULL);
INSERT INTO public.moon VALUES (14, 'Carme', 5, NULL, 23, NULL);
INSERT INTO public.moon VALUES (15, 'Ananke', 5, NULL, 14, NULL);
INSERT INTO public.moon VALUES (16, 'Leda', 5, NULL, 10, NULL);
INSERT INTO public.moon VALUES (17, 'Thebe', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Mimas', 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Enceladus', 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Tethys', 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Dione', 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Rhea', 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Titan', 6, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 6, 1, false, false, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 6, 2, false, false, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 6, 80, true, false, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 6, 83, true, false, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 6, 27, true, false, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 6, 14, true, false, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 6, 0, false, true, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', 6, 5, false, true, NULL);
INSERT INTO public.planet VALUES (11, 'Haumea', 6, 2, true, true, NULL);
INSERT INTO public.planet VALUES (12, 'Makemake', 6, 1, false, true, NULL);
INSERT INTO public.planet VALUES (13, 'Eris', 6, 1, false, true, NULL);
INSERT INTO public.planet VALUES (1, 'Mercury', 6, 0, false, false, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 6, 0, false, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Sol', 0, 0, 2, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Procyon', 11.5, 0.40, 3, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Groombridge', 15.9, 6.60, 5, NULL, NULL);
INSERT INTO public.star VALUES (1, 'Alpha Centauri', 4.37, 1.35, 6, 36, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 8.60, 1.44, 4, 16, NULL);
INSERT INTO public.star VALUES (3, 'Epsilon Eridani', 10.5, 3.72, 3, 11, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: constellation constellation_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_unique UNIQUE (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (galaxy_id);


--
-- Name: galaxy id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT id_unique UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (moon_id);


--
-- Name: constellation name_special; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT name_special UNIQUE (name);


--
-- Name: star name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: galaxy new_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT new_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

