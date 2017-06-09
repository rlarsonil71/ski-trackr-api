#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

OWNER="ownerid"
TOKEN="token"
DATE="2017-06-07"
RESORT="Cranmore"
EQUIPTYPE="Ski"
CONDITIONS="Powder"
NUMRUNS="22"
FAVORITERUN="North Conway"
COMMENTS="4 inches of fresh powder with snow showers in the afternoon"

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
