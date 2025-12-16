SELECT current_database();

CREATE TABLE developers(
	id SERIAL PRIMARY KEY,
	company_name VARCHAR(100) NOT NULL,
	country VARCHAR(50),
	founded_year INT

);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    price NUMERIC(10,2),
    release_date DATE,
    rating NUMERIC(3,1),
    developer_id INT,
	
    CONSTRAINT fk_developer
        FOREIGN KEY (developer_id)
        REFERENCES developers(id)
);

CREATE TABLE  genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	description TEXT
);

CREATE TABLE games_genres (
    id SERIAL PRIMARY KEY,
    game_id INT,
    genre_id INT,
	
    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,
		
    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
        REFERENCES genres(id)
        ON DELETE CASCADE
);

INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland', 2002),
('Rockstar Games', 'USA', 1998),
('Valve', 'USA', 1996),
('Bethesda', 'USA', 1986),
('Ubisoft', 'France', 1986);

SELECT * FROM developers;

INSERT INTO genres ( name, description) VALUES 
('RPG', 'Role Playing Game'),
('Open World', 'Large open map and free exploration'),
('FPS', 'First Person Shooter'),
('Horror', 'Scary and suspense-based games'),
('Sports', 'Sports themed games');


-- genres tablosuna yanlışlıkla aynı veriler birden fazla kez eklendiğim için
-- tabloyu tamamen temizleyip ID sayacını sıfırlıdım.
-- SERIAL yapısı otomatik artan bir sayaç (sequence) kullandığı için
-- DELETE komutu bu sayacı sıfırlamaz.
-- Bu yüzden sequence'i manuel olarak 1’den başlatıyoruz.

--DELETE FROM genres;
--ALTER SEQUENCE genres_id_seq RESTART WITH 1;

-- ayrıca name alanına UNIQUE ekledim

ALTER TABLE genres
ADD CONSTRAINT unique_genre_name UNIQUE (name);
SELECT * FROM genres;

--aynı sorunu diğer tablolar için de düzeltiyorum.

DELETE FROM developers;
ALTER SEQUENCE developers_id_seq RESTART WITH 1;

ALTER TABLE developers
ADD CONSTRAINT unique_company_name UNIQUE (company_name);

SELECT * FROM developers;


ALTER TABLE games
ADD CONSTRAINT unique_title UNIQUE (title);


INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 599.99, '2015-05-19', 9.5, 1),
('Cyberpunk 2077', 499.99, '2020-12-10', 7.8, 1),
('GTA V', 799.99, '2013-09-17', 9.7, 2),
('Red Dead Redemption 2', 899.99, '2018-10-26', 9.8, 2),
('Counter-Strike 2', 0.00, '2023-09-27', 9.0, 3),
('Half-Life Alyx', 699.99, '2020-03-23', 9.6, 3),
('Skyrim', 399.99, '2011-11-11', 9.4, 4),
('Fallout 4', 349.99, '2015-11-10', 8.7, 4),
('Assassins Creed Valhalla', 549.99, '2020-11-10', 8.5, 5),
('Far Cry 6', 499.99, '2021-10-07', 8.0, 5);

SELECT * FROM games;

INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), (1, 2),   -- The Witcher 3 → RPG, Open World
(2, 1),           
(3, 2),          
(4, 2),           
(5, 3),           
(6, 3),          
(7, 1),          
(8, 1), (8, 4),   
(9, 1), (9, 2),   
(10, 3);          

SELECT * FROM games_genres;

-- The Witcher 3'ün bağlı olduğu türleri gösterir
SELECT 
    g.title,
    ge.name AS genre
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres ge ON gg.genre_id = ge.id
WHERE g.title = 'The Witcher 3';

-- Tüm oyunların fiyatını %10 düşür
UPDATE games
SET price = price * 0.9;

SELECT title, price FROM games;



-- Cyberpunk 2077 oyununun puanını güncelliyoruz
UPDATE games
SET rating = 9.0
WHERE title = 'Cyberpunk 2077';

SELECT title, rating  FROM games WHERE title = 'Cyberpunk 2077';



-- Far Cry 6 oyununu siliyoruz
DELETE FROM games WHERE title = 'Far Cry 6';

SELECT * FROM games WHERE title = 'Far Cry 6';


-- Oyunları geliştirici firmaları ile birlikte listeler
SELECT 
    g.title AS oyun_adi,
    g.price AS fiyat,
    d.company_name AS gelistirici
FROM games g
JOIN developers d ON g.developer_id = d.id;


-- Oyunlar ve ait oldukları türler
SELECT 
    g.title AS oyun_adi,
    ge.name AS tur
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres ge ON gg.genre_id = ge.id
ORDER BY g.title;


-- RPG türündeki oyunlar
SELECT 
    g.title AS oyun_adi,
    ge.name AS tur,
    g.rating AS puan
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres ge ON gg.genre_id = ge.id
WHERE ge.name = 'RPG';


