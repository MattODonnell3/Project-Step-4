--TABLES
--divisions
--teams
--players
--player_statistics
--games

--creates all the tables and initializes them with values

DROP TABLE IF EXISTS divisions;

CREATE TABLE divisions (
  div_id int(11) NOT NULL AUTO_INCREMENT,
  div_name varchar(255) NOT NULL,
  PRIMARY KEY (div_id)
);

DROP TABLE IF EXISTS teams;


CREATE TABLE teams (
  team_id int(11) NOT NULL AUTO_INCREMENT,
  team_name varchar(255) NOT NULL,
  hometown varchar(255),
  div_id int(11),
  PRIMARY KEY (team_id),
  FOREIGN KEY (div_id) REFERENCES divisions (div_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

DROP TABLE IF EXISTS players;

CREATE TABLE players (
  player_id int(11) NOT NULL AUTO_INCREMENT,
  fname varchar(255),
  mname varchar(255),
  lname varchar(255) NOT NULL,
  player_number varchar(255),
  player_birthdate date,
  position varchar(255),
  team_id int(11),
  PRIMARY KEY (player_id),
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

DROP TABLE IF EXISTS games;
CREATE TABLE games (
  game_id int(11) NOT NULL AUTO_INCREMENT,
  game_date date DEFAULT CURRENT_DATE,
  home_team int(11),
  away_team int(11),
  home_score int DEFAULT 0,
  away_score int DEFAULT 0,
  PRIMARY KEY (game_id),
  FOREIGN KEY (home_team) REFERENCES teams (team_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  FOREIGN KEY (away_team) REFERENCES teams (team_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

DROP TABLE IF EXISTS player_statistics;

CREATE TABLE player_statistics (
  player_id int(11),
  game_id int(11),
  points int,
  assists int,
  rebounds int,
  PRIMARY KEY (player_id, game_id),
  FOREIGN KEY (player_id) REFERENCES players(player_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (game_id) REFERENCES games(game_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

--insert values
