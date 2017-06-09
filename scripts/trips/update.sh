#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

ID="id"
TOKEN="token"
FAVORITERUN="Tiger"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "trip": {
      "favoriteRun": "'"${FAVORITERUN}"'"
    }
  }'

echo
