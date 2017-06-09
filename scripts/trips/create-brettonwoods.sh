#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

OWNER="ownerid"
TOKEN="token"
DATE="2017-06-06"
RESORT="Bretton Woods"
EQUIPTYPE="Ski"
CONDITIONS="Powder"
NUMRUNS="30"
FAVORITERUN="Bode's Run"
COMMENTS="First tracks!  6 inches of powder!"

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
