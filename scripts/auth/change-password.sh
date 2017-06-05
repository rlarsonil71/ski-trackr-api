#!/bin/bash

# $ ID=59359a840bb71f634bf9176f TOKEN=WmgbdWqaZNU4SjEj+ZqMTV/lwknk0CfJxYm+Nn3kyR8=--NhWhIP7S1W+EjJzfjRwP4eUC5SPkYBGL6CASn+w05eI= OLDPW=triplets NEWPW=123 scripts/auth/change-password.sh
# $ ID=59359a840bb71f634bf9176f TOKEN=WmgbdWqaZNU4SjEj+ZqMTV/lwknk0CfJxYm+Nn3kyR8=--NhWhIP7S1W+EjJzfjRwP4eUC5SPkYBGL6CASn+w05eI= OLDPW=123 NEWPW=triplets scripts/auth/change-password.sh

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
