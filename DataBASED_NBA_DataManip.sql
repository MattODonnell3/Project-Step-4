
-- Teams
-- View teams
SELECT team_id, hometown, team_name, div_id FROM teams ORDER BY div_id;

-- Add team
INSERT INTO teams (team_id, hometown, team_name, div_id) VALUES (:team_id_Input, :hometownInput, :team_name_Input, :div_id_Input);
-- Update Team
UPDATE teams SET team_name = :team_nameInput, wins = :winsInput, losses = :lossesInput, hometown = :hometownInput WHERE team_id= :team_id_selected
-- Delete Team via ID
DELETE FROM teams WHERE team_id = :team_id_to_delete;

-- Players
-- View players (maybe use team_id to get team name)
SELECT player_name, player_number, player_birthday, player_position FROM players ORDER BY team_id;
-- Add player
INSERT INTO players (player_name, player_number, player_birthday, player_position) VALUES (:player_nameInput, :player_numberInput, :player_birthdayInput, :player_positionInput)
-- Update player
UPDATE players SET player_name = :player_nameInput, player_number = :player_numberInput, player_birthday = :player_birthdayInput, player_position = :player_positionInput WHERE player_id= :player_id_selected
-- Delete player via ID
DELETE FROM players WHERE players_id = :player_id_selected

-- Games
-- view games (sort by date?)
SELECT home_team, away_team, away_score, home_score, game_date FROM games ORDER BY game_date;
-- Add Game
INSERT INTO games (home_team, away_team, away_score, home_score, game_date) VALUES (:home_teamInput, :away_teamInput, :away_scoreInput, :home_scoreInput, :game_dateInput)
-- Update Games
UPDATE games SET home_team = :home_teameInput, away_team = :away_teamInput, away_score = :away_scoreInput, home_score = :home_scoreInput, game_date = :game_dateInput WHERE game_id = :game_id_selected
-- Delete Game
DELETE FROM games WHERE game_id = :game_id_to_delete

-- PLayer Statistics
-- view player stats (per game)
SELECT points, assists, rebounds FROM player_statistics ORDER BY player_id;
-- Add player statistic
INSERT INTO player_statistics (points, assists, rebounds) VALUES (:pointsInput, :assistsInput, :reboundsInput)
-- Update player statistic
UPDATE player_statistics SET points = :pointsInput, assists = :assistsInput, rebounds = :reboundsInput WHERE game_id = :game_id_selected AND player_id = player_id_selected
-- Delete player statistic
DELETE FROM player_statistics WHERE player_id = :player_ID_selected AND game_id = :game_ID_selected