CREATE DATABASE universe;

CREATE TABLE IF NOT EXISTS galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  age INT,
  num_stars INT,
  distance_to_earth NUMERIC(12, 2),
  is_spiral BOOLEAN,
  description TEXT NOT NULL,
  has_center_black_hole BOOLEAN
);

CREATE TABLE IF NOT EXISTS star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  age INT,
  num_orbiting_planets INT,
  distance_to_earth NUMERIC(12, 2),
  is_red_dwarf BOOLEAN,
  will_die_in_supernova BOOLEAN,
  description TEXT NOT NULL,
  galaxy_id INT,
  CONSTRAINT fk_galaxy 
  FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE IF NOT EXISTS planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  age INT,
  num_orbiting_moons INT,
  distance_to_earth NUMERIC(12, 2),
  has_life BOOLEAN,
  is_gas_planet BOOLEAN,
  description TEXT NOT NULL,
  star_id INT,
  CONSTRAINT fk_star
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE TABLE IF NOT EXISTS moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  age INT,
  num_of_craters INT,
  distance_to_earth NUMERIC(12, 2),
  has_life BOOLEAN,
  has_dark_side BOOLEAN,
  description TEXT NOT NULL,
  planet_id INT,
  CONSTRAINT fk_planet
  FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE IF NOT EXISTS comet(
  comet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  age INT,
  num_of_craters INT,
  distance_to_earth NUMERIC(12, 2),
  has_life BOOLEAN,
  has_dark_side BOOLEAN,
  description TEXT NOT NULL
);
-- Add 6 galaxies
INSERT INTO galaxy (name, age, num_stars, distance_to_earth, is_spiral, description, has_center_black_hole) 
VALUES
    (
        'The Milky Way',
        13610000,
        100000000,
        0.00,
        TRUE,
        'The Milky Way, our galaxy, is a barred spiral with billions of stars',
        TRUE
    ),
    (
        'Andromeda',
        10010000,
        100000000,
        2537000.00,
        TRUE,
        'Andromeda is the sister galaxy to our Milky Way. Both are gravitationally bound to each other, and are moving closer together at 3 million miles an hour.',
        TRUE
    ),
    (
        'Sombrero',
        13250000,
        100000000,
        29350000.00,
        TRUE,
        'The Sombrero lies at the southern edge of the rich Virgo cluster of galaxies and is one of the most massive objects in that group, equivalent to 800 billion suns',
        TRUE
    ),
    (
        'The Cigar Galaxy',
        NULL,
        30000000,
        11420000.00,
        TRUE,
        'The Cigar galaxy experiences gravitational interactions with its galactic neighbor, M81, causing it to have an extraordinarily high rate of star formation',
        TRUE
    ),
    (
        'NGC 2865',
        10000000,
        NULL,
        100000000.00,
        FALSE,
        'NGC 2865 is an isolated elliptical galaxy in the equatorial constellation of Hydra',
        FALSE
    ),
    (
      'NGC 4886',
      NULL,
      NULL,
      327000000.00,
      FALSE,
      'NGC 4886 is an elliptical galaxy located about 327 million light-years away in the constellation Coma Berenices',
      FALSE
    );

INSERT INTO star (name, age, num_orbiting_planets, distance_to_earth, is_red_dwarf, will_die_in_supernova, description, galaxy_id)
VALUES (
  'Sun',
  1000202,
  9,
  134234.35,
  FALSE,
  TRUE,
  'The Sun of our Solar System',
  1
),
(
  'Sun 3',
  2342,
  5,
  4356456.60,
  TRUE,
  TRUE,
  'Some Sun Somewhere Else',
  1
),
(
  'XD 45',
  234,
  4,
  876455,
  FALSE,
  FALSE,
  'No Clue',
  5
),
(
  'Stuff',
  43543,
  3,
  435.54,
  TRUE,
  TRUE,
  'Something here',
  6
),
(
  'Here',
  2344,
  2,
  543635.56,
  FALSE,
  FALSE,
  'No idea',
  1
),
(
  'Final',
  345.4,
  6,
  45656.34,
  TRUE,
  TRUE,
  'Final star of all',
  1
);

INSERT INTO planet (name, age, num_orbiting_moons, distance_to_earth, has_life, is_gas_planet, description, star_id)
VALUES
(
  'A',
  345654,
  3,
  7896.54,
  FALSE,
  TRUE,
  'A is A',
  4
),
(
  'B',
  354256,
  6,
  24543.45,
  TRUE,
  TRUE,
  'B is awesome',
  2
),
(
  'C',
  859786,
  2,
  644536.65,
  TRUE,
  FALSE,
  'C knows it all',
  1
),
(
  'D',
  5676435,
  7,
  546345665.65,
  FALSE,
  FALSE,
  'D cup is cool',
  1
),
(
  'LALA',
  325636,
  8,
  34534453.43,
  TRUE,
  TRUE,
  'sdkfjgldsfkg',
  2
),
(
  'sfgsdfg',
  3245345,
  23,
  345436456.76,
  FALSE,
  TRUE,
  'srthgrswthsh',
  5
),
(
  'srthgsrth',
  325634,
  345,
  2345.543,
  FALSE,
  FALSE,
  'dsfgdfsgb',
  2
),
(
  'dncmsdfmsdf',
  345345,
  21,
  346467.54,
  TRUE,
  TRUE,
  'fdgsefgd',
  4
),
(
  'afsdvf',
  3245345,
  34,
  3435435.54,
  TRUE,
  TRUE,
  'sfgsdfg',
  3
),
(
  'fdkgnsdkf',
  789578,
  3456,
  23455.54,
  FALSE,
  FALSE,
  'sfgsdfg',
  2
),
(
  'sergte',
  435435,
  65465,
  345435.54,
  TRUE,
  FALSE,
  'sdfgsdf',
  1
),
(
  'rtkhmdglkh',
  345345,
  56764,
  245435.32,
  FALSE,
  FALSE,
  '345345',
  4
);

INSERT INTO moon (name, age, num_of_craters, distance_to_earth, has_life, has_dark_side, description, planet_id)
VALUES
(
  'ierhginuhg43543',
  435435,
  324,
  45656.76,
  FALSE,
  TRUE,
  'sdfghdsgfh',
  7
),
(
  'aisdfisdg345345',
  2455,
  67,
  456456.65,
  TRUE,
  TRUE,
  'sdlfjngdfs',
  8
),
(
  'skjdfnkjdfs435345',
  23,
  79,
  456546.65,
  FALSE,
  FALSE,
  'sdjgnkdg',
  2
),
(
  'sgfkhdfgkl534534',
  567,
  567,
  346467.65,
  TRUE,
  FALSE,
  'sdfggfhhg',
  1
),
(
  'nfgjnsdfg34534',
  6787,
  4545645,
  3456456.65,
  TRUE,
  FALSE,
  'jsfngjsng',
  2
),
(
  'sehgjhdskjghdgh5435',
  658768,
  65765765,
  5346456456.65,
  FALSE,
  FALSE,
  '45645e656',
  8
),
(
  'jsdfvnilsdhifsd345345',
  456453,
  456456,
  6546456.65,
  TRUE,
  TRUE,
  'adfgdsfg',
  2
),
(
  'sjrngsjghgfd5345',
  987768,
  467676,
  4565465.54,
  FALSE,
  TRUE,
  'sdfgdsfg',
  1
),
(
  'sjfngkjdfnkjgfd435435',
  345435435,
  5675878,
  435345.54,
  TRUE,
  FALSE,
  'dgdfg',
  7
),
(
  'jsdfnglksdfng2345',
  43534,
  5435435,
  45345.54,
  TRUE,
  FALSE,
  'sgdtsgthhf',
  1
),
(
  'sdjfngjsdfg234543',
  6797,
  456456,
  467657.65,
  TRUE,
  FALSE,
  'sdfghgdfh',
  2
),
(
  'dosifjgm2345435',
  95468,
  345435,
  435435.54,
  FALSE,
  FALSE,
  'dfgfdg',
  4
),
(
  'sjgnsdjfg2354',
  34534,
  543543,
  5435.54,
  TRUE,
  TRUE,
  'sdkjfsdkg',
  5
),
(
  'sdjfngkj32534',
  2343,
  4324,
  43434.43,
  FALSE,
  TRUE,
  'dfgfdg',
  5
),
(
  'sdjfngkj234534',
  678787,
  7546456,
  6456456.54,
  FALSE,
  FALSE,
  'dfgdfkgdfg',
  3
),
(
  'kjdfngkjdfsngg234543',
  35434656,
  57567657,
  546456546.54,
  FALSE,
  TRUE,
  'sdjfngdfjsngilaerg',
  2
),
(
  'aeurgihsgg34543',
  123423424,
  5645645,
  4565445.54,
  TRUE,
  TRUE,
  'sdflgdsflkgskfggf',
  3
),
(
  'kjadnfkdfngkj2345234',
  39453495,
  834578435,
  34534545.67,
  FALSE,
  FALSE,
  'sfjgksfgkf',
  4
),
(
  'lkdfsjgjsfdgg2345234',
  2342343,
  234234,
  23434.43,
  TRUE,
  TRUE,
  'sdfsdf',
  1
),
(
  'sfsgfgdfg2345435',
  345435,
  54345,
  543543.43,
  TRUE,
  TRUE,
  'sdfkgdflkg',
  1
),
(
  'kdfjsnkjsnfgkg234534',
  676565,
  45656,
  345345.54,
  TRUE,
  TRUE,
  'sdfkjgkdfgkgf',
  1
),
(
  'sldfngkjsn23452',
  234324,
  423434,
  4324324.43,
  FALSE,
  FALSE,
  'dfgldfkgfdkg',
  2
);

INSERT INTO comet (name, age, num_of_craters, distance_to_earth, has_life, has_dark_side, description) VALUES 
(
  'sfsgfgdfg2345435',
  345435,
  54345,
  543543.43,
  TRUE,
  TRUE,
  'sdfkgdflkg'
),
(
  'kdfjsnkjsnfgkg234534',
  676565,
  45656,
  345345.54,
  TRUE,
  TRUE,
  'sdfkjgkdfgkgf'
),
(
  'sldfngkjsn23452',
  234324,
  423434,
  4324324.43,
  FALSE,
  FALSE,
  'dfgldfkgfdkg'
);