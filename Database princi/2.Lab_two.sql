CREATE TABLE animal_type (
    animal_type_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL UNIQUE,
    scientific_name VARCHAR(150) NOT NULL,
    conservation_status VARCHAR(50) NOT NULL  -- Specify the data type for conservation_status
);

CREATE TABLE menagerie (
    menagerie_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50)  NOT NULL,
    date_aquired date NOT NULL,
    gender CHAR(1) not null,
    aquired_from varchar(250) not null,
    Name varchar(50) not null,
    notes text,
    FOREIGN KEY (common_name) REFERENCES animal_type(common_name)
);

INSERT INTO animal_type (common_name, scientific_name, conservation_status)
VALUES 
    ('Bengal Tiger', 'Panthera tigris tigris', 'Endangered'),
    ('Arctic Wolf', 'Canis lupus arctos', 'Least Concern');

INSERT INTO menagerie (menagerie_id, common_name, date_aquired, gender, aquired_from, name, notes)
VALUES
    (1, 'Bengal Tiger', '2011-07-14', 'F', 'Dhaka Zoo', 'Ariel', 'Healthy coat at last exam'),
    (2, 'Arctic Wolf', '2008-09-30', 'F', 'National Zoo', 'Freddy', 'Strong appetite'),
    (3, 'Bengal Tiger', '2006-06-01', 'M', 'Scotland Zoo', 'Spark', 'Likes to play'),
    (4, 'Arctic Wolf', '2007-06-12', 'F', 'Southampton National Park', 'Mia', 'Doesn''t like sun');
