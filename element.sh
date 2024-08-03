#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

MAIN (){
  #Check whether the QUERY is a number or string
  #If the QUERY is not a number
  if [[ ! $1 =~ ^[0-9]+$ ]]
    then
      #Check if a match is found in elements table at symbol or name
      VALID_QUERY=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements LEFT JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE symbol = '$1' OR name = '$1'") 
      if [[ -z $VALID_QUERY ]]
        then
          echo "I could not find that element in the database."
        else
          echo "$VALID_QUERY" | while read NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR MASS BAR MELTING BAR BOILING
          do
            echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
          done
      fi
    else
      #Check if a match is found in elements table at atomic number
      VALID_QUERY=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements LEFT JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE atomic_number = $1") 
      if [[ -z $VALID_QUERY ]]
        then
          echo "I could not find that element in the database."
        else
          echo "$VALID_QUERY" | while read NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR MASS BAR MELTING BAR BOILING
          do
            echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
          done
      fi
  fi
}

#check if an argument is present
if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    MAIN $1
fi
