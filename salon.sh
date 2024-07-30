#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU(){
  #check if an argument is passed
  if [[ $1 ]]
    then
    echo -e "\n$1"
    else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  #check list of available services
  SERVICE_MENU=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICE_MENU" | while read SERVICE_ID BAR SERVICE_NAME
  do
    #print the menu
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  
  #collect the user's input
  read SERVICE_ID_SELECTED
  #if the input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
    #return the user to the main menu
    MAIN_MENU "I could not find that service. What would you like today?"
    #check if the service id is available
    else
    SERVICE_AVAILABLE=$($PSQL "SELECT service_id FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
    #if the service is not available
    if [[ -z $SERVICE_AVAILABLE ]]
      #send the user back to main menu
      then MAIN_MENU "I could not find that service. What would you like today?"
      else
      #else proceed to book an appointment
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      #check if the customer already exists
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #if phone number not found
      if [[ -z $CUSTOMER_NAME ]]
      #ask for customer name
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #update the customers database
        INSERT_INTO_CUSTOMERS=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")      
      fi
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
      read SERVICE_TIME
      #create an appointment
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
      INSERT_INTO_APPOINTMENTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
      #print confirmation
      echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi
  fi
}

MAIN_MENU
