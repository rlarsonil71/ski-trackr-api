#!/bin/bash

# $ ID=59359a840bb71f634bf9176f TOKEN=WmgbdWqaZNU4SjEj+ZqMTV/lwknk0CfJxYm+Nn3kyR8=--NhWhIP7S1W+EjJzfjRwP4eUC5SPkYBGL6CASn+w05eI= scripts/auth/sign-out.sh

API="http://localhost:4741"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
