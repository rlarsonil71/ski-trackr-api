#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

ID="id"
TOKEN="token"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
