#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

OWNER="owner"
TOKEN="token"
DATE="2017-06-04"
RESORT="Gunstock"
EQUIPTYPE="Ski"
CONDITIONS="Packed Powder"
NUMRUNS="31"
FAVORITERUN="Out of Sight"
COMMENTS="Perfect ski day!"

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
