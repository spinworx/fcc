#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e "\n~~ Script to insert data from games.csv into TABLE teams and TABLE games ~~\n";
DB_SELECTION="~~ If you like to connect the script with the TEST DATABASE\n\t please run the script using => ./insert_data.sh test ~~\n";
echo -e $DB_SELECTION;

echo $($PSQL "TRUNCATE teams, games");

# year,round,winner,opponent,winner_goals,opponent_goals
# 2018,Final,France,Croatia,4,2

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
      then
        # get winner_id
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
        # if winner_id not found
        if [[ -z $WINNER_ID ]]
          then
        # insert WINNER
            INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
          if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
            then
            echo Inserted into teams, $WINNER
          fi
          #get new major_id
          WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
        fi


        # get opponent_id
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
        # if opponent_id not found
        if [[ -z $OPPONENT_ID ]]
          then
        # insert OPPONENT
        INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
            then
            echo Inserted into teams, $OPPONENT
          fi
          #get new major_id
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
        fi

        # insert game
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
        if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
          then
            echo Inserted into games, $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS $YEAR $ROUND
        fi
  fi
done
