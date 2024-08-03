#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing --tuples-only -c"

MAIN(){
echo -e "\nEnter your username:"
read USERNAME

#ensure username is less than 22 characters
CCOUNT=$(echo -n $USERNAME | wc -c)
if [[ $CCOUNT -gt 22 ]]
then
  echo "Username must be less than 22 characters"
else
  #check whether username already exists in DB
  DATA_CHECK=$($PSQL"SELECT username, games_played, best_game FROM gamedata WHERE username = '$USERNAME'")
  #if it does not exist, create a new entry
  if [[ -z $DATA_CHECK ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO gamedata(username,games_played,best_game) VALUES('$USERNAME',0,0)")
    if [[ $INSERT_USER == "INSERT 0 1" ]]
    then 
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    fi
  #otherwise fetch user's data and welcome them back
  else
    DATA_CHECK=$($PSQL"SELECT username, games_played, best_game FROM gamedata WHERE username = '$USERNAME'")
    echo "$DATA_CHECK" | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
    do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi

  #generate a random number for the game
  SECRET_NUMBER=$(echo $(($RANDOM % 1000 +1)))

  #ask the user to guess
  echo -e "\nGuess the secret number between 1 and 1000:"
  
  #Guessing game loop
  #Update the player's games_played
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE gamedata SET games_played = games_played + 1 WHERE username = '$USERNAME'")

  #declare variable for counting turns
  declare -i turn=0
  
  ANSWER=ABC
  while [[ $ANSWER != $SECRET_NUMBER ]]
  do
    read ANSWER
    #if answer is not an integer
    if [[ ! $ANSWER =~ ^[0-9]+$ ]] || [[ $ANSWER == 0 ]]
    then
      turn+=1
      echo -e "\nThat is not an integer, guess again:"
    #if answer is lower than secret number
    elif [[ $ANSWER -lt $SECRET_NUMBER ]]
    then
      turn+=1
      echo -e "\nIt's higher than that, guess again:"
    #if answer is greater than secret number
    elif [[ $ANSWER -gt $SECRET_NUMBER ]]
    then
      turn+=1
      echo -e "\nIt's lower than that, guess again:"
    fi
  done
  #when the loop breaks on guessing the number correctly
  turn+=1
  echo -e "\nYou guessed it in $turn tries. The secret number was $SECRET_NUMBER. Nice job!"
  #update score for best game
  UPDATE_BEST_GAME=$($PSQL "UPDATE gamedata SET best_game = $turn WHERE username = '$USERNAME' AND (best_game = 0 OR best_game > $turn)")
fi
}

MAIN
