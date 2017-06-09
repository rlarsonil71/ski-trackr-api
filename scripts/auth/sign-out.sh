#!/bin/bash

# $ ID=id TOKEN=token scripts/auth/sign-out.sh

API="http://localhost:4741"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
