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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    num_of_craters integer,
    distance_to_earth numeric(12,2),
    has_life boolean,
    has_dark_side boolean,
    description text NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    num_stars integer,
    distance_to_earth numeric(12,2),
    is_spiral boolean,
    description text NOT NULL,
    has_center_black_hole boolean
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
    name character varying(50) NOT NULL,
    age integer,
    num_of_craters integer,
    distance_to_earth numeric(12,2),
    has_life boolean,
    has_dark_side boolean,
    description text NOT NULL,
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
    name character varying(50) NOT NULL,
    age integer,
    num_orbiting_moons integer,
    distance_to_earth numeric(12,2),
    has_life boolean,
    is_gas_planet boolean,
    description text NOT NULL,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    num_orbiting_planets integer,
    distance_to_earth numeric(12,2),
    is_red_dwarf boolean,
    will_die_in_supernova boolean,
    description text NOT NULL,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'sfsgfgdfg2345435', 345435, 54345, 543543.43, true, true, 'sdfkgdflkg');
INSERT INTO public.comet VALUES (2, 'kdfjsnkjsnfgkg234534', 676565, 45656, 345345.54, true, true, 'sdfkjgkdfgkgf');
INSERT INTO public.comet VALUES (3, 'sldfngkjsn23452', 234324, 423434, 4324324.43, false, false, 'dfgldfkgfdkg');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 13610000, 100000000, 0.00, true, 'The Milky Way, our galaxy, is a barred spiral with billions of stars', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10010000, 100000000, 2537000.00, true, 'Andromeda is the sister galaxy to our Milky Way. Both are gravitationally bound to each other, and are moving closer together at 3 million miles an hour.', true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 13250000, 100000000, 29350000.00, true, 'The Sombrero lies at the southern edge of the rich Virgo cluster of galaxies and is one of the most massive objects in that group, equivalent to 800 billion suns', true);
INSERT INTO public.galaxy VALUES (4, 'The Cigar Galaxy', NULL, 30000000, 11420000.00, true, 'The Cigar galaxy experiences gravitational interactions with its galactic neighbor, M81, causing it to have an extraordinarily high rate of star formation', true);
INSERT INTO public.galaxy VALUES (5, 'NGC 2865', 10000000, NULL, 100000000.00, false, 'NGC 2865 is an isolated elliptical galaxy in the equatorial constellation of Hydra', false);
INSERT INTO public.galaxy VALUES (6, 'NGC 4886', NULL, NULL, 327000000.00, false, 'NGC 4886 is an elliptical galaxy located about 327 million light-years away in the constellation Coma Berenices', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (16, 'ierhginuhg43543', 435435, 324, 45656.76, false, true, 'sdfghdsgfh', 7);
INSERT INTO public.moon VALUES (17, 'aisdfisdg345345', 2455, 67, 456456.65, true, true, 'sdlfjngdfs', 8);
INSERT INTO public.moon VALUES (18, 'skjdfnkjdfs435345', 23, 79, 456546.65, false, false, 'sdjgnkdg', 2);
INSERT INTO public.moon VALUES (19, 'sgfkhdfgkl534534', 567, 567, 346467.65, true, false, 'sdfggfhhg', 1);
INSERT INTO public.moon VALUES (20, 'nfgjnsdfg34534', 6787, 4545645, 3456456.65, true, false, 'jsfngjsng', 2);
INSERT INTO public.moon VALUES (21, 'sehgjhdskjghdgh5435', 658768, 65765765, 5346456456.65, false, false, '45645e656', 8);
INSERT INTO public.moon VALUES (22, 'jsdfvnilsdhifsd345345', 456453, 456456, 6546456.65, true, true, 'adfgdsfg', 2);
INSERT INTO public.moon VALUES (23, 'sjrngsjghgfd5345', 987768, 467676, 4565465.54, false, true, 'sdfgdsfg', 1);
INSERT INTO public.moon VALUES (24, 'sjfngkjdfnkjgfd435435', 345435435, 5675878, 435345.54, true, false, 'dgdfg', 7);
INSERT INTO public.moon VALUES (25, 'jsdfnglksdfng2345', 43534, 5435435, 45345.54, true, false, 'sgdtsgthhf', 1);
INSERT INTO public.moon VALUES (26, 'sdjfngjsdfg234543', 6797, 456456, 467657.65, true, false, 'sdfghgdfh', 2);
INSERT INTO public.moon VALUES (27, 'dosifjgm2345435', 95468, 345435, 435435.54, false, false, 'dfgfdg', 4);
INSERT INTO public.moon VALUES (28, 'sjgnsdjfg2354', 34534, 543543, 5435.54, true, true, 'sdkjfsdkg', 5);
INSERT INTO public.moon VALUES (29, 'sdjfngkj32534', 2343, 4324, 43434.43, false, true, 'dfgfdg', 5);
INSERT INTO public.moon VALUES (30, 'sdjfngkj234534', 678787, 7546456, 6456456.54, false, false, 'dfgdfkgdfg', 3);
INSERT INTO public.moon VALUES (31, 'kjdfngkjdfsngg234543', 35434656, 57567657, 546456546.54, false, true, 'sdjfngdfjsngilaerg', 2);
INSERT INTO public.moon VALUES (32, 'aeurgihsgg34543', 123423424, 5645645, 4565445.54, true, true, 'sdflgdsflkgskfggf', 3);
INSERT INTO public.moon VALUES (33, 'kjadnfkdfngkj2345234', 39453495, 834578435, 34534545.67, false, false, 'sfjgksfgkf', 4);
INSERT INTO public.moon VALUES (34, 'lkdfsjgjsfdgg2345234', 2342343, 234234, 23434.43, true, true, 'sdfsdf', 1);
INSERT INTO public.moon VALUES (35, 'sfsgfgdfg2345435', 345435, 54345, 543543.43, true, true, 'sdfkgdflkg', 1);
INSERT INTO public.moon VALUES (36, 'kdfjsnkjsnfgkg234534', 676565, 45656, 345345.54, true, true, 'sdfkjgkdfgkgf', 1);
INSERT INTO public.moon VALUES (37, 'sldfngkjsn23452', 234324, 423434, 4324324.43, false, false, 'dfgldfkgfdkg', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A', 345654, 3, 7896.54, false, true, 'A is A', 4);
INSERT INTO public.planet VALUES (2, 'B', 354256, 6, 24543.45, true, true, 'B is awesome', 2);
INSERT INTO public.planet VALUES (3, 'C', 859786, 2, 644536.65, true, false, 'C knows it all', 1);
INSERT INTO public.planet VALUES (4, 'D', 5676435, 7, 546345665.65, false, false, 'D cup is cool', 1);
INSERT INTO public.planet VALUES (5, 'LALA', 325636, 8, 34534453.43, true, true, 'sdkfjgldsfkg', 2);
INSERT INTO public.planet VALUES (6, 'sfgsdfg', 3245345, 23, 345436456.76, false, true, 'srthgrswthsh', 5);
INSERT INTO public.planet VALUES (7, 'srthgsrth', 325634, 345, 2345.54, false, false, 'dsfgdfsgb', 2);
INSERT INTO public.planet VALUES (8, 'dncmsdfmsdf', 345345, 21, 346467.54, true, true, 'fdgsefgd', 4);
INSERT INTO public.planet VALUES (9, 'afsdvf', 3245345, 34, 3435435.54, true, true, 'sfgsdfg', 3);
INSERT INTO public.planet VALUES (10, 'fdkgnsdkf', 789578, 3456, 23455.54, false, false, 'sfgsdfg', 2);
INSERT INTO public.planet VALUES (11, 'sergte', 435435, 65465, 345435.54, true, false, 'sdfgsdf', 1);
INSERT INTO public.planet VALUES (12, 'rtkhmdglkh', 345345, 56764, 245435.32, false, false, '345345', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1000202, 9, 134234.35, false, true, 'The Sun of our Solar System', 1);
INSERT INTO public.star VALUES (2, 'Sun 3', 2342, 5, 4356456.60, true, true, 'Some Sun Somewhere Else', 1);
INSERT INTO public.star VALUES (3, 'XD 45', 234, 4, 876455.00, false, false, 'No Clue', 5);
INSERT INTO public.star VALUES (4, 'Stuff', 43543, 3, 435.54, true, true, 'Something here', 6);
INSERT INTO public.star VALUES (5, 'Here', 2344, 2, 543635.56, false, false, 'No idea', 1);
INSERT INTO public.star VALUES (6, 'Final', 345, 6, 45656.34, true, true, 'Final star of all', 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
