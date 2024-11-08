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
  if [[ $YEAR != "year" ]]
  then
    TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $TEAM_ID_WIN ]]
    then
      INSERT_WIN_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      if [[ $INSERT_WIN_RESULT == 'INSERT 0 1' ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
    fi

    if [[ -z $TEAM_ID_OPP ]]
    then
      INSERT_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      if [[ $INSERT_OPP_RESULT == 'INSERT 0 1' ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
    fi

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID_WIN, $TEAM_ID_OPP, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo "Inserted into games, $YEAR $ROUND"
    fi
  fi
done
