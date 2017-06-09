#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

OWNER="owner"
TOKEN="token"
DATE="2017-06-05"
RESORT="Loon"
EQUIPTYPE="Ski"
CONDITIONS="Spring conditions."
NUMRUNS="24"
FAVORITERUN="Ripsaw"
COMMENTS="Awesome in the morning but got slushy in the afternoon.  Great spring day!"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "trip": {
      "tripDate": "'"${DATE}"'",
      "resort": "'"${RESORT}"'",
      "equipmentType": "'"${EQUIPTYPE}"'",
      "conditions": "'"${CONDITIONS}"'",
      "numberOfRuns": "'"${NUMRUNS}"'",
      "favoriteRun": "'"${FAVORITERUN}"'",
      "comments": "'"${COMMENTS}"'",
      "_owner": "'"${OWNER}"'"
    }
  }'

echo
