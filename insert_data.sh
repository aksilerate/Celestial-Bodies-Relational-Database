#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

#Read the csv file
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS

#inserting data into the teams table
do
#check for winners column first
#Ignore the first row
if [[ $WINNER != 'winner' ]]
  #check if team name exists
  then TEAM=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    #if not found
    if [[ -z $TEAM ]]
      #insert the record
      then INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        #print the inserted record
        if [[ $INSERT_WINNER == "INSERT 0 1" ]]
          then echo Winner team added: $WINNER
          fi 
      fi
  fi
#now check for opponent column
#Ignore the first row
if [[ $OPPONENT != 'opponent' ]]
  #check if team name exists
  then TEAM=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    #if not found
    if [[ -z $TEAM ]]
      #insert the record
      then INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        #print the inserted record
        if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
          then echo Opponent team added: $OPPONENT
          fi 
      fi
  fi

#insert data into the games table
#Ignore the first row
if [[ $YEAR != 'year' ]]
  #get the team ids
  W_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  O_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  #insert the record
  then INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$W_ID','$O_ID','$W_GOALS','$O_GOALS')")
    #print the inserted record
    if [[ $INSERT_GAME == "INSERT 0 1" ]]
      then echo Game added: $YEAR $ROUND
      fi 
  fi
done
