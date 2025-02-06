-- 2
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_name TEXT NOT NULL UNIQUE, -- Unique movie name
    genre TEXT NOT NULL,
    country TEXT NOT NULL,
    language TEXT NOT NULL,
    year INTEGER NOT NULL CHECK (year >= 2009), -- Ensures movie is from the last 15 years
    revenue REAL NOT NULL CHECK (revenue >= 0) -- Revenue in millions, cannot be negative
);

INSERT INTO movies (movie_name, genre, country, language, year, revenue) VALUES
('Oppenheimer', 'Biography', 'USA', 'English', 2023, 960),
('Barbie', 'Comedy', 'USA', 'English', 2023, 1440),
('Dune Part Two', 'Sci-Fi', 'USA', 'English', 2024, 700),
('John Wick 4', 'Action', 'USA', 'English', 2023, 440),
('Everything Everywhere All at Once', 'Sci-Fi', 'USA', 'English', 2022, 140),
('The Batman', 'Action', 'USA', 'English', 2022, 772),
('Spider Man No Way Home', 'Action', 'USA', 'English', 2021, 1920),
('Top Gun Maverick', 'Action', 'USA', 'English', 2022, 1490),
('The Whale', 'Drama', 'USA', 'English', 2022, 55),
('Guardians of the Galaxy Vol 3', 'Action', 'USA', 'English', 2023, 845),
('Parasite', 'Thriller', 'South Korea', 'Korean', 2019, 266),
('Train to Busan 2', 'Horror', 'South Korea', 'Korean', 2020, 92),
('Decision to Leave', 'Mystery', 'South Korea', 'Korean', 2022, 23),
('Joker', 'Drama', 'USA', 'English', 2019, 1074),
('Tenet', 'Sci-Fi', 'USA', 'English', 2020, 365),
('The Irishman', 'Crime', 'USA', 'English', 2019, 8),
('Ford v Ferrari', 'Drama', 'USA', 'English', 2019, 225),
('1917', 'War', 'UK', 'English', 2019, 385),
('The Farewell', 'Drama', 'USA', 'English/Chinese', 2019, 23),
('The Banshees of Inisherin', 'Comedy', 'Ireland', 'English', 2022, 49),
('Django Unchained', 'Western', 'USA', 'English', 2012, 426),
('Avengers Endgame', 'Action', 'USA', 'English', 2019, 2798),
('Black Panther', 'Action', 'USA', 'English', 2018, 1347),
('Coco', 'Animation', 'USA', 'English/Spanish', 2017, 807),
('Mad Max Fury Road', 'Action', 'Australia', 'English', 2015, 380),
('Inception', 'Sci-Fi', 'USA', 'English', 2010, 837),
('The Revenant', 'Adventure', 'USA', 'English', 2015, 532),
('La La Land', 'Musical', 'USA', 'English', 2016, 447),
('The Secret in Their Eyes', 'Crime', 'Argentina', 'Spanish', 2009, 34),
('No Time to Die', 'Action', 'UK', 'English', 2021, 774);

-- 2

-- A
SELECT COUNT (*) FROM movies
GROUP by GENRE;

-- B
SELECT year, sum (revenue)  FROM movies
GROUP by year;

-- C
SELECT GENRE ,avg (revenue) FROM movies
GROUP by GENRE;


-- D
SELECT language,GENRE ,avg (revenue) FROM movies
GROUP by language,GENRE; 

-- E
SELECT language, COUNT(language)from movies
GROUP by language
ORDER by language desc LIMIT 1;

-- F
SELECT country, COUNT(country)from movies
GROUP by country
ORDER by country desc LIMIT 1   

-- G
SELECT GENRE,COUNT (*) as COUNT_GENRE FROM movies
GROUP by GENRE
HAVING COUNT_GENRE > 2;

-- H
SELECT year, sum (revenue) as revenue_year  FROM movies
GROUP by year
HAVING revenue_year > 1000;

-- I
SELECT language, COUNT(*) as COUNT_language from movies
GROUP by language
HAVING COUNT_language >= 3;


-- 3
-- 3
CREATE TABLE tours (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tour_name TEXT NOT NULL UNIQUE, 
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date >= start_date), 
    price REAL NOT NULL CHECK (price >= 0), 
    max_participants INTEGER NOT NULL CHECK (max_participants >= 0), 
    guide_name TEXT NOT NULL,
    difficulty_level TEXT CHECK(difficulty_level IN ('Easy', 'Medium', 'Hard')) NOT NULL,
    pickup_location TEXT NOT NULL
);

INSERT INTO tours (tour_name, description, start_date, end_date, price, max_participants, guide_name, difficulty_level, pickup_location) VALUES
('Jerusalem Historical Tour', 'A guided tour through the Old City and Western Wall', '2025-03-10', '2025-03-10', 250.00, 25, 'Leonardo DiCaprio', 'Medium', 'Tel Aviv'),
('Jerusalem Night Tour', 'A magical night tour of historical sites', '2025-04-05', '2025-04-05', 280.00, 20, 'Jon Snow', 'Medium', 'Jerusalem'),
('Dead Sea Experience', 'A relaxing day at the Dead Sea with a visit to Masada', '2025-03-15', '2025-03-15', 320.00, 30, 'Brad Pitt', 'Easy', 'Tel Aviv'),
('Dead Sea Adventure', 'Floating in the Dead Sea and exploring Ein Gedi', '2025-05-02', '2025-05-02', 290.00, 28, 'Tyrion Lannister', 'Easy', 'Jerusalem'),
('Galilee and Sea of Galilee Tour', 'A scenic tour through the Galilee region', '2025-06-12', '2025-06-12', 350.00, 35, 'Scarlett Johansson', 'Medium', 'Haifa'),
('Mount Hermon Snow Trip', 'A winter adventure in Mount Hermon', '2025-02-20', '2025-02-21', 400.00, 20, 'Daenerys Targaryen', 'Hard', 'Tel Aviv'),
('Haifa and Akko Coastal Tour', 'A coastal journey through Haifa and Akko', '2025-07-07', '2025-07-07', 280.00, 30, 'Jaime Lannister', 'Easy', 'Haifa'),
('Eilat Desert Adventure', 'A thrilling jeep tour in the Eilat mountains', '2025-09-18', '2025-09-19', 500.00, 20, 'Tom Cruise', 'Hard', 'Eilat'),
('Negev Desert and Ramon Crater', 'Exploring the Negev and the famous Ramon Crater', '2025-10-10', '2025-10-11', 450.00, 25, 'Gandalf', 'Hard', 'Beersheba'),
('Nazareth and Christian Landmarks', 'A visit to the Holy Land sites in Nazareth', '2025-08-08', '2025-08-08', 300.00, 30, 'Legolas', 'Medium', 'Tel Aviv'),
('Tel Aviv City Tour', 'Exploring the modern and vibrant city of Tel Aviv', '2025-11-05', '2025-11-05', 260.00, 35, 'Frodo Baggins', 'Easy', 'Tel Aviv'),
('Judean Desert and Qumran Caves', 'A historical trip to the ancient caves of Qumran', '2025-12-01', '2025-12-01', 350.00, 25, 'Michael Jordan', 'Medium', 'Jerusalem');

CREATE TABLE countries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_name TEXT NOT NULL UNIQUE
);

INSERT INTO countries (country_name) VALUES 
('USA'),
('France'),
('Italy'),
('Spain'),
('Canada'),
('Japan'),
('Brazil'),
('Australia'),
('India'),
('Mexico');

CREATE TABLE tourists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    passport_number TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    country_id INTEGER NOT NULL,
    tour_id INTEGER NULL, -- Each tourist may be assigned to a tour or remain NULL
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (tour_id) REFERENCES tours(id) ON DELETE SET NULL
);

INSERT INTO tourists (first_name, last_name, passport_number, date_of_birth, gender, email, phone, country_id, tour_id) VALUES
('Leonardo', 'DiCaprio', 'P123456', '1974-11-11', 'Male', 'leo.d@gmail.com', '+1-555123456', 1, NULL),
('Brad', 'Pitt', 'P234567', '1963-12-18', 'Male', 'brad.p@hotmail.com', '+1-555234567', 1, NULL),
('Tom', 'Cruise', 'P345678', '1962-07-03', 'Male', 'tom.c@amazon.com', '+1-555345678', 1, NULL),
('Scarlett', 'Johansson', 'P456789', '1984-11-22', 'Female', 'scarlett.j@gmail.com', '+1-555456789', 2, NULL),
('Natalie', 'Portman', 'P567890', '1981-06-09', 'Female', 'natalie.p@hotmail.com', '+1-555567890', 2, NULL),
('Tyrion', 'Lannister', 'P678901', '1978-05-25', 'Male', 'tyrion.l@amazon.com', '+1-555678901', 3, 11),
('Jon', 'Snow', 'P789012', '1986-12-26', 'Male', 'jon.s@gmail.com', '+1-555789012', 3, 6),
('Arya', 'Stark', 'P890123', '1996-03-10', 'Female', 'arya.s@hotmail.com', '+1-555890123', 4, 11),
('Daenerys', 'Targaryen', 'P901234', '1990-04-20', 'Female', 'dany.t@amazon.com', '+1-555901234', 4, 10),
('Jaime', 'Lannister', 'P012345', '1975-09-17', 'Male', 'jaime.l@gmail.com', '+1-555012345', 5, 5),
('Peter', 'Dinklage', 'P112345', '1969-06-11', 'Male', 'peter.d@hotmail.com', '+1-555112345', 5, 4),
('Jason', 'Momoa', 'P212345', '1979-08-01', 'Male', 'jason.m@amazon.com', '+1-555212345', 6, 9),
('Kit', 'Harington', 'P312345', '1986-12-26', 'Male', 'kit.h@gmail.com', '+1-555312345', 6, 8),
('Emilia', 'Clarke', 'P412345', '1986-10-23', 'Female', 'emilia.c@hotmail.com', '+1-555412345', 7, 7),
('Nikolaj', 'Coster-Waldau', 'P512345', '1970-07-27', 'Male', 'nikolaj.c@amazon.com', '+1-555512345', 7, 4),
('Sean', 'Bean', 'P612345', '1959-04-17', 'Male', 'sean.b@gmail.com', '+1-555612345', 8, 7),
('Lena', 'Headey', 'P712345', '1973-10-03', 'Female', 'lena.h@hotmail.com', '+1-555712345', 8, 3),
('Sophie', 'Turner', 'P812345', '1996-02-21', 'Female', 'sophie.t@amazon.com', '+1-555812345', 9, 10),
('Maisie', 'Williams', 'P912345', '1997-04-15', 'Female', 'maisie.w@gmail.com', '+1-555912345', 9, 5),
('Mark', 'Addy', 'P1012345', '1964-01-14', 'Male', 'mark.a@hotmail.com', '+1-5551012345', 10, 3),
('Rory', 'McCann', 'P1112345', '1969-04-24', 'Male', 'rory.m@amazon.com', '+1-5551112345', 10, 6),
('Gwendoline', 'Christie', 'P1212345', '1978-10-28', 'Female', 'gwendoline.c@gmail.com', '+1-5551212345', 1, 8),
('Alfie', 'Allen', 'P1312345', '1986-09-12', 'Male', 'alfie.a@hotmail.com', '+1-5551312345', 2, 2),
('Isaac', 'Hempstead Wright', 'P1412345', '1999-04-09', 'Male', 'isaac.h@amazon.com', '+1-5551412345', 3, 12),
('Jack', 'Gleeson', 'P1512345', '1992-05-20', 'Male', 'jack.g@gmail.com', '+1-5551512345', 4, 5),
('Iain', 'Glen', 'P1612345', '1961-06-24', 'Male', 'iain.g@hotmail.com', '+1-5551612345', 5, 9),
('Conleth', 'Hill', 'P1712345', '1964-11-24', 'Male', 'conleth.h@amazon.com', '+1-5551712345', 6, 5),
('Carice', 'van Houten', 'P1812345', '1976-09-05', 'Female', 'carice.v@gmail.com', '+1-5551812345', 7, 9),
('Hafþór', 'Júlíus Björnsson', 'P1912345', '1988-11-26', 'Male', 'hafthor.b@hotmail.com', '+1-5551912345', 8, 5),
('Richard', 'Madden', 'P2012345', '1986-06-18', 'Male', 'richard.m@amazon.com', '+1-5552012345', 9, 9);


-- 3

-- A

select tourists.*,countries.* from tourists
inner join countries ON tourists.country_id = countries.id;

-- B
select tourists.*,tours.* from tourists
inner join tours ON tourists.tour_id = tours.id;

-- C
select tourists.*,tours.* from tourists
left join tours ON tourists.tour_id = tours.id ;

-- D

select tourists.*,tours.* from tourists
full join tours ON tourists.tour_id = tours.id;

-- E
-- 1
select tourists.*,tours.* from tourists
left join tours ON tourists.tour_id = tours.id 
where tourists.tour_id is null;

-- 2
delete from tourists where id = 4;

-- F
-- 1
select tours.*, tourists.* from tours
left join tourists ON tours.id = tourists.tour_id
where tourists.tour_id is null;

-- 2
UPDATE tours SET start_date = '2026-03-10', end_date = '2026-03-10' WHERE ID = 1;

-- G
select count (*) from tours
left join tourists ON tours.id = tourists.tour_id
where tourists.tour_id is null;

-- H
SELECT tourists.*,tours.* from tourists
CROSS JOIN tours;

part 4- bonos
    
-- 5
    
CREATE TABLE tours (
    id_tours INTEGER PRIMARY KEY AUTOINCREMENT,
    tour_name TEXT NOT NULL UNIQUE, 
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date >= start_date), 
    price REAL NOT NULL CHECK (price >= 0), 
    max_participants INTEGER NOT NULL CHECK (max_participants >= 0), 
    guide_name TEXT NOT NULL,
    difficulty_level TEXT CHECK(difficulty_level IN ('Easy', 'Medium', 'Hard')) NOT NULL,
    pickup_location TEXT NOT NULL
);

INSERT INTO tours (tour_name, description, start_date, end_date, price, max_participants, guide_name, difficulty_level, pickup_location) VALUES
('Jerusalem Historical Tour', 'A guided tour through the Old City and Western Wall', '2025-03-10', '2025-03-10', 250.00, 25, 'Leonardo DiCaprio', 'Medium', 'Tel Aviv'),
('Jerusalem Night Tour', 'A magical night tour of historical sites', '2025-04-05', '2025-04-05', 280.00, 20, 'Jon Snow', 'Medium', 'Jerusalem'),
('Dead Sea Experience', 'A relaxing day at the Dead Sea with a visit to Masada', '2025-03-15', '2025-03-15', 320.00, 30, 'Brad Pitt', 'Easy', 'Tel Aviv'),
('Dead Sea Adventure', 'Floating in the Dead Sea and exploring Ein Gedi', '2025-05-02', '2025-05-02', 290.00, 28, 'Tyrion Lannister', 'Easy', 'Jerusalem'),
('Galilee and Sea of Galilee Tour', 'A scenic tour through the Galilee region', '2025-06-12', '2025-06-12', 350.00, 35, 'Scarlett Johansson', 'Medium', 'Haifa'),
('Mount Hermon Snow Trip', 'A winter adventure in Mount Hermon', '2025-02-20', '2025-02-21', 400.00, 20, 'Daenerys Targaryen', 'Hard', 'Tel Aviv'),
('Haifa and Akko Coastal Tour', 'A coastal journey through Haifa and Akko', '2025-07-07', '2025-07-07', 280.00, 30, 'Jaime Lannister', 'Easy', 'Haifa'),
('Eilat Desert Adventure', 'A thrilling jeep tour in the Eilat mountains', '2025-09-18', '2025-09-19', 500.00, 20, 'Tom Cruise', 'Hard', 'Eilat'),
('Negev Desert and Ramon Crater', 'Exploring the Negev and the famous Ramon Crater', '2025-10-10', '2025-10-11', 450.00, 25, 'Gandalf', 'Hard', 'Beersheba'),
('Nazareth and Christian Landmarks', 'A visit to the Holy Land sites in Nazareth', '2025-08-08', '2025-08-08', 300.00, 30, 'Legolas', 'Medium', 'Tel Aviv'),
('Tel Aviv City Tour', 'Exploring the modern and vibrant city of Tel Aviv', '2025-11-05', '2025-11-05', 260.00, 35, 'Frodo Baggins', 'Easy', 'Tel Aviv'),
('Judean Desert and Qumran Caves', 'A historical trip to the ancient caves of Qumran', '2025-12-01', '2025-12-01', 350.00, 25, 'Michael Jordan', 'Medium', 'Jerusalem');

CREATE TABLE countries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_name TEXT NOT NULL UNIQUE
);

INSERT INTO countries (country_name) VALUES 
('USA'),
('France'),
('Italy'),
('Spain'),
('Canada'),
('Japan'),
('Brazil'),
('Australia'),
('India'),
('Mexico');

CREATE TABLE tourists (
    id_tourists INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    passport_number TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    country_id INTEGER NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE SET NULL
);

INSERT INTO tourists (first_name, last_name, passport_number, date_of_birth, gender, email, phone, country_id) VALUES
('Leonardo', 'DiCaprio', 'P123456', '1974-11-11', 'Male', 'leo.d@gmail.com', '+1-555123456', 1),
('Brad', 'Pitt', 'P234567', '1963-12-18', 'Male', 'brad.p@hotmail.com', '+1-555234567', 1),
('Tom', 'Cruise', 'P345678', '1962-07-03', 'Male', 'tom.c@amazon.com', '+1-555345678', 1),
('Scarlett', 'Johansson', 'P456789', '1984-11-22', 'Female', 'scarlett.j@gmail.com', '+1-555456789', 2),
('Natalie', 'Portman', 'P567890', '1981-06-09', 'Female', 'natalie.p@hotmail.com', '+1-555567890', 2),
('Tyrion', 'Lannister', 'P678901', '1978-05-25', 'Male', 'tyrion.l@amazon.com', '+1-555678901', 3),
('Jon', 'Snow', 'P789012', '1986-12-26', 'Male', 'jon.s@gmail.com', '+1-555789012', 3),
('Arya', 'Stark', 'P890123', '1996-03-10', 'Female', 'arya.s@hotmail.com', '+1-555890123', 4),
('Daenerys', 'Targaryen', 'P901234', '1990-04-20', 'Female', 'dany.t@amazon.com', '+1-555901234', 4),
('Jaime', 'Lannister', 'P012345', '1975-09-17', 'Male', 'jaime.l@gmail.com', '+1-555012345', 5),
('Peter', 'Dinklage', 'P112345', '1969-06-11', 'Male', 'peter.d@hotmail.com', '+1-555112345', 5),
('Jason', 'Momoa', 'P212345', '1979-08-01', 'Male', 'jason.m@amazon.com', '+1-555212345', 6),
('Kit', 'Harington', 'P312345', '1986-12-26', 'Male', 'kit.h@gmail.com', '+1-555312345', 6),
('Emilia', 'Clarke', 'P412345', '1986-10-23', 'Female', 'emilia.c@hotmail.com', '+1-555412345', 7),
('Nikolaj', 'Coster-Waldau', 'P512345', '1970-07-27', 'Male', 'nikolaj.c@amazon.com', '+1-555512345', 7),
('Sean', 'Bean', 'P612345', '1959-04-17', 'Male', 'sean.b@gmail.com', '+1-555612345', 8),
('Lena', 'Headey', 'P712345', '1973-10-03', 'Female', 'lena.h@hotmail.com', '+1-555712345', 8),
('Sophie', 'Turner', 'P812345', '1996-02-21', 'Female', 'sophie.t@amazon.com', '+1-555812345', 9),
('Maisie', 'Williams', 'P912345', '1997-04-15', 'Female', 'maisie.w@gmail.com', '+1-555912345', 9),
('Mark', 'Addy', 'P1012345', '1964-01-14', 'Male', 'mark.a@hotmail.com', '+1-5551012345', 10),
('Rory', 'McCann', 'P1112345', '1969-04-24', 'Male', 'rory.m@amazon.com', '+1-5551112345', 10),
('Gwendoline', 'Christie', 'P1212345', '1978-10-28', 'Female', 'gwendoline.c@gmail.com', '+1-5551212345', 1),
('Alfie', 'Allen', 'P1312345', '1986-09-12', 'Male', 'alfie.a@hotmail.com', '+1-5551312345', 2),
('Isaac', 'Hempstead Wright', 'P1412345', '1999-04-09', 'Male', 'isaac.h@amazon.com', '+1-5551412345', 3),
('Jack', 'Gleeson', 'P1512345', '1992-05-20', 'Male', 'jack.g@gmail.com', '+1-5551512345', 4),
('Iain', 'Glen', 'P1612345', '1961-06-24', 'Male', 'iain.g@hotmail.com', '+1-5551612345', 5),
('Conleth', 'Hill', 'P1712345', '1964-11-24', 'Male', 'conleth.h@amazon.com', '+1-5551712345', 6),
('Carice', 'van Houten', 'P1812345', '1976-09-05', 'Female', 'carice.v@gmail.com', '+1-5551812345', 7),
('Hafþór', 'Júlíus Björnsson', 'P1912345', '1988-11-26', 'Male', 'hafthor.b@hotmail.com', '+1-5551912345', 8),
('Richard', 'Madden', 'P2012345', '1986-06-18', 'Male', 'richard.m@amazon.com', '+1-5552012345', 9);

CREATE TABLE tourists_tours (
    id_tourists INTEGER NOT NULL,
    id_tours INTEGER NOT NULL,
    PRIMARY KEY(id_tourists, id_tours),
    FOREIGN KEY (id_tourists) REFERENCES tourists(id_tourists),
    FOREIGN KEY (id_tours) REFERENCES tours(id_tours)
);

INSERT INTO tourists_tours (id_tourists, id_tours) VALUES
(1, 5),
(2, 1),
(4, 6),
(3, 2),
(7, 7),
(9, 4),
(5, 12),
(8, 3),
(10, 10),
(12, 1),
(11, 9),
(13, 11),
(6, 8);

-- 6 
-- יצירת טבלה ב POSTGRESQL
CREATE TABLE movies (
    id SERIAL PRIMARY KEY  ,
    movie_name TEXT NOT NULL UNIQUE, 
    genre TEXT NOT NULL,
    country TEXT NOT NULL,
    language TEXT NOT NULL,
    year INTEGER NOT NULL CHECK (year >= 2009),
    revenue REAL NOT NULL CHECK (revenue >= 0) 
);



