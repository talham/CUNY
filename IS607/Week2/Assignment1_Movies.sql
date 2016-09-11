-- Assignment 1 Talha Muhammad
-- 1) Create a database of the movie survey data
drop database IF EXISTS moviesurvey; 
CREATE database moviesurvey;
-- 2) Create three tables movie names, survey and respondents

DROP TABLE IF EXISTS movienames;
DROP TABLE IF EXISTS survey;
DROP TABLE IF EXISTS respondents;


CREATE TABLE movienames (
    movie_id INT PRIMARY KEY,
    title VARCHAR(75) NOT NULL
);

CREATE TABLE respondents (
    survey_id INT PRIMARY KEY
);

CREATE TABLE survey (
    id INT PRIMARY KEY,
    survey_id INT NOT NULL REFERENCES respondents,
    movie_id INT NOT NULL REFERENCES movienames,
    score INT NULL
);

INSERT INTO respondents (survey_id) VALUES (1);
INSERT INTO respondents (survey_id) VALUES (2);
INSERT INTO respondents (survey_id) VALUES (3);
INSERT INTO respondents (survey_id) VALUES (4);
INSERT INTO respondents (survey_id) VALUES (5);
INSERT INTO respondents (survey_id) VALUES (6);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/moviedata/movie_names.csv' 
INTO TABLE movienames
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(movie_id, title);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/moviedata/survey_data.csv' 
INTO TABLE survey
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(id, survey_id, movie_id, score);

SELECT 
    *
FROM
    movienames;

SELECT 
    *
FROM
    respondents;

SELECT 
    *
FROM
    survey;
    
SELECT 
    id, survey_id, survey.movie_id, score, title
FROM
    survey
        LEFT JOIN
    movienames ON survey.movie_id = movienames.movie_id
ORDER BY movie_id , survey_id;

SELECT id, survey_id, survey.movie_id, score, title INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/moviedata/survey_combined.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
FROM
    survey
        LEFT JOIN
    movienames ON survey.movie_id = movienames.movie_id
ORDER BY movie_id , survey_id;

