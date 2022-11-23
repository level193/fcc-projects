#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~Welcome to Jeremy's Salon~~"

SERVICE_MENU() {
if [[ $1 ]]
  then
    echo -e "\n$1"
fi
# get list of services
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
#display numbered list of services
echo "$SERVICES" | while read SERVICE_ID BAR NAME 
do
echo "$SERVICE_ID) $NAME"
done
#get service_id
echo -e "\nHow can we be of service?"
read SERVICE_ID_SELECTED
#if service doesn't exist
if [[ ! $SERVICE_ID_SELECTED =~ [1-5] ]]
  then
  #return to service menu
  SERVICE_MENU "Sorry but that is not a valid option.\nPlease Try again\n"
  else
  SERVICE_CHOSEN=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  #get phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #check if customer exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
    #get new customer name 
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    #insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    else
    echo -e "\nWelcome back $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')." 
    fi 
    #get service time
    echo -e "What time would you like your appointment?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone = '$CUSTOMER_PHONE'")
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VAlUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')") 
   
    #confirm appointment
    echo -e "I have put you down for a $(echo $SERVICE_CHOSEN | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    
  fi


}

SERVICE_MENU