SELECT
  actor_name, film_name
FROM
  table_name
  JOIN table_name ON table1.attr = table2.attr
  JOIN table_name ON table3.attr = table4.attr
WHERE
  table.attr = 'X'; 
CREATE TABLE Language (
    LanguageID INT PRIMARY KEY,
    LanguageName VARCHAR(50)
);

CREATE TABLE Actor (
    ActorID INT PRIMARY KEY,
    ActorName VARCHAR(100),
    DateOfBirth DATE
);

CREATE TABLE Film (
    FilmID INT PRIMARY KEY,
    Title VARCHAR(100),
    ReleaseDate DATE,
    LanguageID INT,
    FOREIGN KEY (LanguageID) REFERENCES Language(LanguageID)
   
);

CREATE TABLE Film_Actor (
    ActorID INT,
    FilmID INT,
    PRIMARY KEY (ActorID, FilmID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID)
);


CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Film_Category (
    FilmID INT,
    CategoryID INT,
    PRIMARY KEY (FilmID, CategoryID),
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Populate the Language table
INSERT INTO Language (LanguageID, LanguageName) VALUES
(1, 'English'),
(2, 'French'),
(3, 'Spanish');

-- Populate the Actor table
INSERT INTO Actor (ActorID, ActorName, DateOfBirth) VALUES
(1, 'Tom Hanks', '1956-07-09'),
(2, 'Meryl Streep', '1949-06-22'),
(3, 'Leonardo DiCaprio', '1974-11-11');

-- Populate the Film table
INSERT INTO Film (FilmID, Title, ReleaseDate, LanguageID) VALUES
(101, 'The Shawshank Redemption', '1994-09-10', 1),
(102, 'Forrest Gump', '1994-07-06', 1),
(103, 'Titanic', '1997-12-19', 1);

-- Populate the Film_Actor table
INSERT INTO Film_Actor (ActorID, FilmID) VALUES
(1, 101),
(1, 102),
(3, 103);

-- Populate the Category table
INSERT INTO Category (CategoryID, CategoryName) VALUES
(201, 'Drama'),
(202, 'Romance'),
(203, 'Adventure');

-- Populate the Film_Category table
INSERT INTO Film_Category (FilmID, CategoryID) VALUES
(101, 201),
(102, 201),
(103, 201),
(103, 202);

SELECT
    Film.Title AS FilmTitle,
    Film.ReleaseDate,
    Category.CategoryName,
    Actor.ActorName
FROM
    Film
JOIN
    Film_Category ON Film.FilmID = Film_Category.FilmID
JOIN
    Category ON Film_Category.CategoryID = Category.CategoryID
JOIN
    Film_Actor ON Film.FilmID = Film_Actor.FilmID
JOIN
    Actor ON Film_Actor.ActorID = Actor.ActorID
WHERE
    Category.CategoryName = 'Drama'
ORDER BY
    Film.ReleaseDate;

INSERT INTO Film (FilmID, Title, ReleaseDate, LanguageID) VALUES
(104, 'The Godfather', '1972-03-24', 1);

UPDATE Film
SET ReleaseDate = '2022-01-01'
WHERE Film.FilmID IN (
    SELECT Film.FilmID
    FROM Film
    JOIN Film_Category ON Film.FilmID = Film_Category.FilmID
    JOIN Category ON Film_Category.CategoryID = Category.CategoryID
    WHERE Category.CategoryName = 'Romance'

DELETE FROM Film_Actor
WHERE FilmID IN (
    SELECT FilmID
    FROM Film
    WHERE EXTRACT(YEAR FROM ReleaseDate) < 1995
);
