#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams") 
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $WINNER != "winner" ]]
then
TEAM=$($PSQL "SELECT name FROM teams WHERE name ='$WINNER'")
if [[ -z $TEAM ]]
then
INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
if [[ $INSERT_TEAM == "INSERT 0 1" ]]
then
echo Inserted into teams $WINNER
fi
fi
fi   
done
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $OPPONENT != "opponent" ]]
then
TEAM=$($PSQL "SELECT name FROM teams WHERE name ='$OPPONENT'")
if [[ -z $TEAM ]]
then
INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
if [[ $INSERT_TEAM == "INSERT 0 1" ]]
then
echo Inserted into teams $OPPONENT
fi
fi
fi   
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != "year" ]]
then
WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
INSERT_RESULTS=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS)")


fi   
done