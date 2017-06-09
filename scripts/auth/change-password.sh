#!/bin/bash

# $ ID=id TOKEN=token OLDPW=oldpw NEWPW=newpw scripts/auth/change-password.sh
# $ ID=id TOKEN=token OLDPW=newpw NEWPW=oldpw scripts/auth/change-password.sh

API="http://localhost:4741"
URL_PATH="/change-password"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
