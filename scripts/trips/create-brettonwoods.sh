#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

OWNER="59359a840bb71f634bf9176f"
TOKEN="YzHx7GH+PhlGHZ90ePuoPditSyX8Kw3d5KAy/wuSaK8=--VIUfJl+sQlWWu/vV1OxtO0iBAjl4RIiRQZFBdpK3rCk="
DATE="2017-06-06"
RESORT="Bretton Woods"
EQUIPTYPE="Ski"
CONDITIONS="Powder"
NUMRUNS="30"
FAVORITERUN="Bode's Run"
COMMENTS="First tracks!  6 inches of powder!"
# ITEMS="{name: 'apple', price: 100, qty: 2},{name: 'orange', price: 200, qty: 1},{name: 'banana', price: 300, qty: 1}"

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
