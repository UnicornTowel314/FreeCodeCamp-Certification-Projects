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
    description text,
    distance_from_earth_in_mly numeric(6,1),
    galaxy_type character varying(30),
    size_in_ly integer
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
    planet_id integer,
    has_sister_moons boolean,
    surface_gravity numeric(8,1),
    surface_area_in_hunthousandkm integer
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
-- Name: notable_features; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.notable_features (
    description text,
    planet_id integer,
    name character varying(30) NOT NULL,
    notable_features_id integer NOT NULL
);


ALTER TABLE public.notable_features OWNER TO freecodecamp;

--
-- Name: notable_features_notable_features_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.notable_features_notable_features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notable_features_notable_features_id_seq OWNER TO freecodecamp;

--
-- Name: notable_features_notable_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.notable_features_notable_features_id_seq OWNED BY public.notable_features.notable_features_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    type character varying(30),
    size_in_millionskm numeric(8,1),
    has_moons boolean
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
    galaxy_id integer,
    distance_in_ly integer,
    visible_magnitude numeric(6,1)
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
-- Name: notable_features notable_features_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_features ALTER COLUMN notable_features_id SET DEFAULT nextval('public.notable_features_notable_features_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The nearest major galaxy to the Milky Way. Named for the constellation it appears in.', 2.5, 'Barred Spiral', 152000);
INSERT INTO public.galaxy VALUES (2, 'Black Eye', 'A relatively isolated galaxy. In the constellation Coma Berenices.', 17.3, 'Spiral', 53800);
INSERT INTO public.galaxy VALUES (3, 'Bodes', 'It is a popular target for amateur astronomers. It is located in the constellation Ursa Major.', 11.8, 'Grand Design Spiral', 96000);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 'Dominant member of the Cartwheel Galaxy Group, which consists of four physically associated spiral galaxies.', 500.0, 'Lenticular Ring', 144300);
INSERT INTO public.galaxy VALUES (5, 'Cigar', 'It is about five times more luminous than the Milky Way, and it is in the constellation Ursa Major.', 11.4, 'Starburst', 40800);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'It includes the solar system, and its name is derived from its appearance from Earth.', 0.0, 'Barred Spiral', 87400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', 3, false, 1.6, 379);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, true, 0.0, 522000);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, true, 0.0, 164000);
INSERT INTO public.moon VALUES (4, 'Amalthea', 5, true, 0.0, 1);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, true, 1.2, 730);
INSERT INTO public.moon VALUES (6, 'Europa', 5, true, 1.3, 309);
INSERT INTO public.moon VALUES (7, 'Ganymede', 5, true, 1.4, 872);
INSERT INTO public.moon VALUES (8, 'Io', 5, true, 1.8, 416);
INSERT INTO public.moon VALUES (9, 'Dione', 6, true, 0.2, 39);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, true, 0.1, 8);
INSERT INTO public.moon VALUES (11, 'Hyperion', 6, true, 0.0, 233);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, true, 0.2, 67);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, true, 0.1, 5);
INSERT INTO public.moon VALUES (14, 'Phoebe', 6, true, 0.0, 1);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, true, 0.3, 73);
INSERT INTO public.moon VALUES (16, 'Tethys', 6, true, 0.0, 36);
INSERT INTO public.moon VALUES (17, 'Titan', 6, true, 1.4, 83);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, true, 0.2, 42);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, true, 0.1, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, true, 0.4, 73);
INSERT INTO public.moon VALUES (21, 'Titania', 7, true, 0.4, 78);
INSERT INTO public.moon VALUES (22, 'Umbriel', 7, true, 0.2, 43);
INSERT INTO public.moon VALUES (23, 'Nereid', 8, true, 0.2, 43);
INSERT INTO public.moon VALUES (24, 'Triton', 8, true, 0.8, 230);


--
-- Data for Name: notable_features; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.notable_features VALUES ('A persistent anticyclonic storm located south of Jupiter''s equator. It rotates counter-clockwise, and is larger than the earth.', 5, 'Great Red Spot', 1);
INSERT INTO public.notable_features VALUES ('Uranus rotates at a nearly 90 degree angle from the plane of its orbit, making it appear to spin on its side.', 7, 'Tilted Axis', 2);
INSERT INTO public.notable_features VALUES ('Venus''s thick atmosphere traps heat in a runaway greenhouse effect, making it the hotest planet in the solar system.', 2, 'Greenhouse Effect', 3);
INSERT INTO public.notable_features VALUES ('Saturn''s rings are the most complex of any planet in the solar system, consisting almost entirely of ice.', 6, 'Rings', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 74.8, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 460.0, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Ocean', 510.0, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 140.0, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 64000.0, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 44000.0, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 8100.0, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 7700.0, true);
INSERT INTO public.planet VALUES (9, 'PA-99-N2', 3, 'Possible Exoplanet', 405760.0, NULL);
INSERT INTO public.planet VALUES (10, 'Epsilon Eridani b', 6, 'Exoplanet', 42240.0, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 5, 'Exoplanet', 125664.0, NULL);
INSERT INTO public.planet VALUES (12, 'Proxima Centarui d', 6, 'Exoplanet', 4.3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 6, 0, -27.0);
INSERT INTO public.star VALUES (2, 'Alpheratz', 1, 97, 2.1);
INSERT INTO public.star VALUES (3, 'Nembus', 1, 174, 3.6);
INSERT INTO public.star VALUES (4, 'Sadiradra', 1, 101, 3.3);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 6, 4, 10.4);
INSERT INTO public.star VALUES (6, 'Epsilon Eridani', 6, 10, 3.7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: notable_features_notable_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.notable_features_notable_features_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: notable_features notable_features_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_features
    ADD CONSTRAINT notable_features_name_key UNIQUE (name);


--
-- Name: notable_features notable_features_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_features
    ADD CONSTRAINT notable_features_pkey PRIMARY KEY (notable_features_id);


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
-- Name: notable_features notable_features_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_features
    ADD CONSTRAINT notable_features_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

