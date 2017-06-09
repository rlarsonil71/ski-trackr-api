#!/bin/bash

# $ ID=id TOKEN=token scripts/users/show.sh

API="http://localhost:4741"
URL_PATH="/users"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
