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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    hemisphere character varying
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
    name character varying NOT NULL,
    constellation_id integer,
    name_origin text,
    notes text
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
    name character varying NOT NULL,
    description text,
    planet_id integer,
    discovered integer,
    distance_from_planet_km integer
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
    name character varying NOT NULL,
    size integer,
    day_length integer,
    distance_from_earth integer,
    number_moons numeric,
    description text,
    is_dwarf boolean,
    has_life boolean,
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
    name character varying NOT NULL,
    description text,
    galaxy_id integer,
    notes text,
    constellation_id integer,
    notes2 text
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

INSERT INTO public.constellation VALUES (1, 'Lynx', NULL);
INSERT INTO public.constellation VALUES (2, 'Andromeda', NULL);
INSERT INTO public.constellation VALUES (3, 'Corvus', NULL);
INSERT INTO public.constellation VALUES (4, 'Centaurus', NULL);
INSERT INTO public.constellation VALUES (5, '', NULL);
INSERT INTO public.constellation VALUES (7, 'Coma Berenices', NULL);
INSERT INTO public.constellation VALUES (8, 'Serpens', NULL);
INSERT INTO public.constellation VALUES (9, 'Ursa Major', NULL);
INSERT INTO public.constellation VALUES (10, 'Virgo', NULL);
INSERT INTO public.constellation VALUES (11, 'Sculptor', NULL);
INSERT INTO public.constellation VALUES (13, 'Circinus', NULL);
INSERT INTO public.constellation VALUES (14, 'Canes Venatici', NULL);
INSERT INTO public.constellation VALUES (17, 'Pavo', NULL);
INSERT INTO public.constellation VALUES (18, 'Sextans', NULL);
INSERT INTO public.constellation VALUES (19, 'Camelopardalis', NULL);
INSERT INTO public.constellation VALUES (20, 'Eridanus', NULL);
INSERT INTO public.constellation VALUES (23, 'Pegasus', NULL);
INSERT INTO public.constellation VALUES (24, 'Perseus', NULL);
INSERT INTO public.constellation VALUES (29, 'Serpens Caput', NULL);
INSERT INTO public.constellation VALUES (30, 'Draco', NULL);
INSERT INTO public.constellation VALUES (32, 'Volans', NULL);
INSERT INTO public.constellation VALUES (39, 'Tucana', NULL);
INSERT INTO public.constellation VALUES (41, 'Sagittarius (centre)', NULL);
INSERT INTO public.constellation VALUES (44, 'Cetus', NULL);
INSERT INTO public.constellation VALUES (46, 'Hydra', NULL);
INSERT INTO public.constellation VALUES (54, 'Boötes', NULL);
INSERT INTO public.constellation VALUES (56, 'Ophiuchus', NULL);
INSERT INTO public.constellation VALUES (59, 'Reticulum', NULL);
INSERT INTO public.constellation VALUES (60, 'Triangulum', NULL);
INSERT INTO public.constellation VALUES (22, 'Cygnus, Cepheus', NULL);
INSERT INTO public.constellation VALUES (31, 'Dorado, Mensa', NULL);
INSERT INTO public.constellation VALUES (65, 'Canis Major', NULL);
INSERT INTO public.constellation VALUES (66, 'Orion', NULL);
INSERT INTO public.constellation VALUES (67, 'Carina', NULL);
INSERT INTO public.constellation VALUES (68, 'Auriga', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', 1, '', '');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2, '"Andromeda, which is shortened from ""Andromeda Galaxy"", gets its name from the area of the sky in which it appears, the constellation of Andromeda."', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.');
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 4, '"It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation."', '');
INSERT INTO public.galaxy VALUES (4, 'Blinking Galaxy', 8, 'Its difficulty of viewing in a small telescope and tendency to go in and out of view.', '');
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', 10, 'Looks are similar to a butterfly.', '');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 11, 'Its visual appearance is similar to that of a spoked cartwheel.', '"The largest in the Cartwheel Galaxy group, made up of four spiral galaxies"');
INSERT INTO public.galaxy VALUES (7, 'Cigar Galaxy', 9, 'Appears similar in shape to a cigar.', 'Also known as Messier 82 or M82');
INSERT INTO public.galaxy VALUES (8, 'Circinus Galaxy', 13, 'Named after the constellation it is located in (Circinus).', '');
INSERT INTO public.galaxy VALUES (9, 'Cocoon Galaxy', 14, 'Its resemblance in shape to cocoon', '');
INSERT INTO public.galaxy VALUES (10, 'Coma Pinwheel Galaxy', 7, 'Named after its resemblance to the Pinwheel Galaxy and its location in the Coma Berenices constellation.', 'Also known as Messier 99 or M99');
INSERT INTO public.galaxy VALUES (11, 'Comet Galaxy', 11, '"This galaxy is named after its unusual appearance, looking like a comet."', '"The comet effect is caused by tidal stripping by its galaxy cluster, Abell 2667."');
INSERT INTO public.galaxy VALUES (12, 'Condor Galaxy', 17, '"Named after a condor, a type of vulture that is one of the largest flying birds."', '"The largest known spiral galaxy, it has a diameter of over 665,300 light-years (204.0 kiloparsecs).[3] It is tidally disturbed by the smaller lenticular galaxy IC 4970.[4]"');
INSERT INTO public.galaxy VALUES (13, 'Cosmos Redshift 7', 18, '"The name of this galaxy is based on a Redshift (z) measurement of nearly 7 (actually, z = 6.604).[5]"', 'Galaxy Cosmos Redshift 7 is reported to be the brightest of distant galaxies (z > 6) and to contain some of the earliest first stars (first generation; Population III) that produced the chemical elements needed for the later formation of planets and life as we know it.[5]');
INSERT INTO public.galaxy VALUES (14, 'Dusty Hand Galaxy', 19, 'Named after the dust lanes and spiral arms of the galaxy.', '');
INSERT INTO public.galaxy VALUES (15, 'Eye of God', 20, 'Named after its structural appearance', 'A prototype for multi-arm spiral galaxies');
INSERT INTO public.galaxy VALUES (16, 'Eye of Sauron', 14, 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings.', '');
INSERT INTO public.galaxy VALUES (17, 'Fireworks Galaxy', 22, 'Due to its bright and spotty appearance', 'Active starburst galaxy');
INSERT INTO public.galaxy VALUES (18, 'Fried Egg Galaxy', 23, 'Due to its similar appearance to a fried egg', '');
INSERT INTO public.galaxy VALUES (19, 'Godzilla Galaxy', 24, 'Its extremely large size', '');
INSERT INTO public.galaxy VALUES (20, 'Helix Galaxy', 9, 'Its shape resembles a helix', '');
INSERT INTO public.galaxy VALUES (21, 'Grasshopper', 1, 'Named after its appearance to a grasshopper', 'Two colliding galaxies');
INSERT INTO public.galaxy VALUES (22, 'Hockey Stick Galaxies', 14, 'Its elongated and curved appearance resembles a hockey stick.', 'Also known as Crowbar Galaxy');
INSERT INTO public.galaxy VALUES (23, 'Large Magellanic Cloud', 31, 'Named after Ferdinand Magellan', '"This is the fourth-largest galaxy in the Local Group, and forms a pair with the SMC, and from recent research, may not be part of the Milky Way system of satellites at all.[6]"');
INSERT INTO public.galaxy VALUES (24, 'Lindsay-Shapley Ring', 32, '"Named after its discoverer, Eric Lindsay, his professor Harlow Shapley, and its nature as a ring galaxy."', 'The ring is the result of collision with another galaxy');
INSERT INTO public.galaxy VALUES (25, 'Little Sombrero Galaxy', 23, 'Named after its similarity to the Sombrero Galaxy.', '');
INSERT INTO public.galaxy VALUES (26, 'Malin 1', 7, 'Discovered and named by David Malin.', '');
INSERT INTO public.galaxy VALUES (27, 'Meathook Galaxy', 32, 'After its appearance resembling a meathook.', '');
INSERT INTO public.galaxy VALUES (28, 'Medusa Merger', 9, 'Ejected dust from the merging galaxies is said to look like the snakes that the Gorgon Medusa from Greek mythology had on her head.', '');
INSERT INTO public.galaxy VALUES (29, 'Sculptor Dwarf Galaxy', 11, 'Similar to the Sculpture Galaxies', '"Also known as Sculptor Dwarf Elliptical Galaxy, Sculptor Dwarf Spheroidal Galaxy, and formerly as the Sculptor System"');
INSERT INTO public.galaxy VALUES (30, 'Mice Galaxies', 7, 'Appearance is similar to a mouse.', '');
INSERT INTO public.galaxy VALUES (31, 'Small Magellanic Cloud', 39, 'Named after Ferdinand Magellan', '"This forms a pair with the LMC, and from recent research, may not be part of the Milky Way system of satellites at all."');
INSERT INTO public.galaxy VALUES (32, 'Milky Way', 41, 'The appearance from Earth of the galaxy—a band of light', '"The galaxy containing the Sun and its Solar System, and therefore Earth."');
INSERT INTO public.galaxy VALUES (33, 'Needle Galaxy', 7, 'Named due to its slender appearance.', 'Also known as Caldwell 38');
INSERT INTO public.galaxy VALUES (34, 'Wolf-Lundmark-Melotte', 44, 'Named for the three astronomers instrumental in its discovery and identification.', '');
INSERT INTO public.galaxy VALUES (35, 'Paramecium Galaxy', 23, 'Named after its appearance to the organism Paramecium', 'It is included in the Atlas of Peculiar Galaxies in the category galaxies with detached segments.');
INSERT INTO public.galaxy VALUES (36, 'Peekaboo Galaxy', 46, 'Galaxy (aka HIPASS J1131-31) was hidden behind a relatively fast-moving foreground star (TYC 7215-199-1) and became observable when the star moved aside.', '"Galaxy, relatively nearby, is considered one of the most metal-poor (""extremely metal-poor"" (XMP)), least chemically enriched, and seemingly primordial, galaxies known.[10][11]"');
INSERT INTO public.galaxy VALUES (37, 'Pinwheel Galaxy', 9, 'Similar in appearance to a pinwheel (toy).', 'Also known as Messier 101 or M101');
INSERT INTO public.galaxy VALUES (38, 'Porphyrion', 30, '', '');
INSERT INTO public.galaxy VALUES (39, 'Porpoise Galaxy', 46, 'Its appearance resembles a porpoise', 'Also known as the Penguin Galaxy');
INSERT INTO public.galaxy VALUES (40, 'Sculptor Galaxy', 11, '"Named after its location in the Sculptor Constellation. Also called the Silver Dollar or Silver Coin Galaxy, because of its light and circular appearance."', '"Also known as the Silver Coin, Silver Dollar Galaxy or Caldwell 65"');
INSERT INTO public.galaxy VALUES (41, 'Skyrocket Galaxy', 9, 'Its resemblance to a July 4th skyrocket', '');
INSERT INTO public.galaxy VALUES (42, 'Sombrero Galaxy', 10, 'Similar in appearance to a sombrero.', 'Also known as Messier Object 104 or M104');
INSERT INTO public.galaxy VALUES (43, 'Southern Pinwheel Galaxy', 46, 'Named after its resemblance to the Pinwheel Galaxy and its location in the southern celestial hemisphere.', '');
INSERT INTO public.galaxy VALUES (44, 'Spider Galaxy', 54, 'Named after its appearance of a spider', '');
INSERT INTO public.galaxy VALUES (45, 'Spiderweb Galaxy', 46, 'Its irregular shape and continuous structure resembles a spiderweb.', '');
INSERT INTO public.galaxy VALUES (46, 'Starfish Galaxy', 56, 'Similar in appearance to a starfish.', 'Merger of 3 galaxies');
INSERT INTO public.galaxy VALUES (47, 'Sunflower Galaxy', 14, 'Similar in appearance to a sunflower.', '');
INSERT INTO public.galaxy VALUES (48, 'Tadpole Galaxy', 30, 'The name comes from the resemblance of the galaxy to a tadpole.', 'This shape resulted from tidal interaction that drew out a long tidal tail.');
INSERT INTO public.galaxy VALUES (49, 'Topsy Turvy Galaxy', 59, 'The disorganized and chaotic appareance makes it look topsy turvy.', '');
INSERT INTO public.galaxy VALUES (50, 'Triangulum Galaxy', 60, 'Named after its location within the Triangulum constellation.', '');
INSERT INTO public.galaxy VALUES (51, 'UFO Galaxy', 1, 'Named after its resemblance to a UFO.', '');
INSERT INTO public.galaxy VALUES (52, 'Whale Galaxy', 14, 'Named after its supposed resemblance to a whale.', '');
INSERT INTO public.galaxy VALUES (53, 'Whirlpool Galaxy', 14, 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits.', '');
INSERT INTO public.galaxy VALUES (55, 'Antennae Galaxies', 3, 'Appearance is similar to an insect"s antennae.', 'Two colliding galaxies');
INSERT INTO public.galaxy VALUES (56, 'Bear Paw Galaxy', 1, 'It resembles the appearance of a bear"s claw.', '"Also known as ""Bear Claw Galaxy."""');
INSERT INTO public.galaxy VALUES (57, 'Black Eye Galaxy', 7, '"It has a spectacular dark band of absorbing dust in front of the galaxy"s bright nucleus, giving rise to its nicknames of the ""Black Eye"" or ""Evil Eye"" galaxy."', '"Also known as ""Sleeping Beauty Galaxy."""');
INSERT INTO public.galaxy VALUES (58, 'Bode"s Galaxy', 9, 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 'Also known as Messier 81. The largest galaxy in the M81 Group. It harbors a supermassive black hole 70 million times the mass of the Sun.');
INSERT INTO public.galaxy VALUES (59, 'Hidden Galaxy', 19, 'The difficulty in observing this object makes it "hidden"', '');
INSERT INTO public.galaxy VALUES (60, 'Hoag"s Object', 29, '"This is named after Art Hoag, who discovered this ring galaxy."', '"It is of the subtype Hoag-type galaxy, and may in fact be a polar-ring galaxy with the ring in the plane of rotation of the central object."');
INSERT INTO public.galaxy VALUES (61, 'Knife Edge Galaxy', 30, '"Named after its thin shape, similar to knife"s edge."', '');
INSERT INTO public.galaxy VALUES (62, 'Mayall"s Object', 9, '"This is named after Nicholas Mayall, of the Lick Observatory, who discovered it.[7][8][9]"', '"Also called VV 32 and Arp 148, this is a very peculiar looking object, and is likely to be not one galaxy, but two galaxies undergoing a collision. Event in images is a spindle shape and a ring shape."');
INSERT INTO public.galaxy VALUES (63, 'Perseus Cluster', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Luna)', NULL, 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Adrastea', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Aitne', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Ananke', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Aoede', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Arche', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Autonoe', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Carme', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Callirrhoe', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Carpo', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Chaldene', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Cyllene', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Elara', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Erinome', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Euanthe', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Eukelade', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Euporie', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Europa', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Eurydome', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Ganymede', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Harpalyke', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Hegemone', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Helike', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Hermippe', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Himalia', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'Io', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'Iocaste', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'Isonone', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'Kale', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'Kallichore', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'Kalyke', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'Kore', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'Leda', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (38, 'Lysithea', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (39, 'Magaclite', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (40, 'Metis', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (41, 'Mneme', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (42, 'Orthosie', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (43, 'Pasiphae', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (44, 'Pasithee', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (45, 'Praxidike', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (46, 'Sinope', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (47, 'Sponde', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (48, 'S/2000 J11', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (49, 'S/2003 J2', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (50, 'S/2003 J3', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (51, 'S/2003 J4', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (52, 'S/2003 J5', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (53, 'S/2003 J9', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (54, 'S/2003 J10', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (55, 'S/2003 J12', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (56, 'S/2003 J15', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (57, 'S/2003 J16', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (58, 'S/2003 J17', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (59, 'S/2003 J18', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (60, 'S/2003 J19', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (61, 'S/2003 J 23', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (62, 'S/2010 J 1', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (63, 'S/2010 J 2', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (64, 'S/2011 J 2', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (65, 'S/2011 J 1', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (66, 'Taygete', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (67, 'Thebe', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (68, 'Thelxinoe', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (69, 'Themisto', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (70, 'Thyone', NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (71, 'Aegir', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (72, 'Albiorix', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (73, 'Anthe', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (74, 'Atlas', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (75, 'Bebhionn', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (76, 'Bergelmir', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (77, 'Bestla', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (78, 'Calypso', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (79, 'Daphnis', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (80, 'Dione', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (81, 'Enceladus', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (82, 'Epimetheus', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (83, 'Erriapo', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (84, 'Farbauti', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (85, 'Fenrir', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (86, 'Fornjot', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (87, 'Greip', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (88, 'Hati', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (89, 'Helene', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (90, 'Hyperion', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (91, 'Hyrokkin', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (92, 'Iapetus', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (93, 'Ijiraq', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (94, 'Janus', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (95, 'Jarnsaxa', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (96, 'Kari', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (97, 'Kiviuq', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (98, 'Loge', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (99, 'Methone', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (100, 'Mimas', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (101, 'Mundilfari', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (102, 'Narvi', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (103, 'Paaliaq', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (104, 'Pallene', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (105, 'Pan', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (106, 'Pandora', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (107, 'Phoebe', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (108, 'Polydeuces', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (109, 'Prometheus', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (110, 'Rhea', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (111, 'Siarnaq', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (112, 'Skathi', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (113, 'Skoll', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (114, 'Surtur', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (115, 'Suttungr', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (116, 'S/2004 S07', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (117, 'S/2004 S12', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (118, 'S/2004 S13', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (119, 'S/2004 S17', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (120, 'S/2006 S1', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (121, 'S/2006 S3', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (122, 'S/2007 S2', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (123, 'S/2007 S3', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (124, 'Tarqeq', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (125, 'Tarvos', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (126, 'Telesto', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (127, 'Tethys', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (128, 'Thrymr', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (129, 'Titan', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (130, 'Ymir', NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (131, 'Ariel', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (132, 'Belinda', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (133, 'Bianca', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (134, 'Caliban', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (135, 'Cordelia', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (136, 'Cressida', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (137, 'Cupid', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (138, 'Desdemona', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (139, 'Ferdinand', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (140, 'Francisco', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (141, 'Juliet', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (142, 'Mab', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (143, 'Margaret', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (144, 'Miranda', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (145, 'Oberon', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (146, 'Ophelia', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (147, 'Perdita', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (148, 'Portia', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (149, 'Prospero', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (150, 'Puck', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (151, 'Rosalind', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (152, 'Setebos', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (153, 'Stephano', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (154, 'Sycorax', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (155, 'Titania', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (156, 'Trinculo', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (157, 'Umbriel', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (158, 'Despina', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (159, 'Galatea', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (160, 'Halimede', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (161, 'Larissa', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (162, 'Laomedeia', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (163, 'Naiad', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (164, 'Nereid', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (165, 'Neso', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (166, 'Proteus', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (167, 'Psamathe', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (168, 'Sao', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (169, 'Thalassa', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (170, 'Triton', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (171, 'S/2004 N 1', NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (172, 'Charon', NULL, 10, NULL, NULL);
INSERT INTO public.moon VALUES (173, 'Nix', NULL, 10, NULL, NULL);
INSERT INTO public.moon VALUES (174, 'Hydra', NULL, 10, NULL, NULL);
INSERT INTO public.moon VALUES (175, 'Kerberos', NULL, 10, NULL, NULL);
INSERT INTO public.moon VALUES (176, 'Styx', NULL, 10, NULL, NULL);
INSERT INTO public.moon VALUES (177, 'Dysnomia', NULL, 13, NULL, NULL);
INSERT INTO public.moon VALUES (178, 'Namaka', NULL, 11, NULL, NULL);
INSERT INTO public.moon VALUES (179, 'Hi"iaka', NULL, 11, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, NULL, 0, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, NULL, 0, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, NULL, 1, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, 2, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, 95, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, 146, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, 28, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, 16, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', NULL, NULL, NULL, 0, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, NULL, NULL, 5, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, NULL, NULL, 2, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', NULL, NULL, NULL, 1, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (13, 'Eris', NULL, NULL, NULL, 1, NULL, true, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 32, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Kepler-90', NULL, 32, NULL, 30, NULL);
INSERT INTO public.star VALUES (9, 'Algol', NULL, 63, 'Algol, designated Beta Persei, known colloquially as the Demon Star, is a bright multiple star in the constellation of Perseus and one of the first non-nova variable stars to be discovered.', 24, '');
INSERT INTO public.star VALUES (10, 'Mirach', NULL, 2, 'Mirach, Bayer designation Beta Andromedae, Latinized from ? Andromedae, is a prominent star in the northern constellation of Andromeda. It is northeast of the Great Square of Pegasus and is potentially visible to all observers north of latitude 54° S. It is commonly used by stargazers to find the Andromeda Galaxy.', 2, '');
INSERT INTO public.star VALUES (3, 'Sirius', NULL, 2, 'Sirius is the brightest star in the night sky. Its name is derived from the Greek word ???????, meaning lit. "glowing" or "scorching". The star is designated ? Canis Majoris, Latinized to Alpha Canis Majoris, and abbreviated ? CMa or Alpha CMa.', 65, '');
INSERT INTO public.star VALUES (4, 'Betelgeuse', NULL, 2, 'Betelgeuse is a red supergiant star in the constellation of Orion. It is usually the tenth-brightest star in the night sky and, after Rigel, the second-brightest in its constellation.', 66, '');
INSERT INTO public.star VALUES (5, 'Rigel', NULL, 2, 'Rigel is a blue supergiant star in the constellation of Orion. It has the Bayer designation ? Orionis, which is Latinized to Beta Orionis and abbreviated Beta Ori or ? Ori.', 66, '');
INSERT INTO public.star VALUES (6, 'Canopus', NULL, 2, 'Canopus is the brightest star in the southern constellation of Carina and the second-brightest star in the night sky. It is also designated ? Carinae, which is romanized to Alpha Carinae. With a visual apparent magnitude of ?0.74, it is outshone only by Sirius.', 67, '');
INSERT INTO public.star VALUES (7, 'Arcturus', NULL, 2, 'Arcturus is the brightest star in the northern constellation of Boötes. With an apparent visual magnitude of ?0.05, it is the fourth-brightest star in the night sky, and the brightest in the northern celestial hemisphere.', 54, '');
INSERT INTO public.star VALUES (8, 'Capella', NULL, 2, 'Capella is the brightest star in the northern constellation of Auriga. It has the Bayer designation ? Aurigae, which is Latinised to Alpha Aurigae and abbreviated Alpha Aur or ? Aur. ', 68, 'Capella is a yellow giant star, like our own Sun, but much larger. Astronomers classify it as a type G5 and know that it lies some 41 light-years away from the ...');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 68, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 63, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 179, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

