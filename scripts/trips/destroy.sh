#!/bin/bash

API="http://localhost:4741"
URL_PATH="/trips"

ID="5936b82f82e3446e35ef8b1a"
TOKEN="YzHx7GH+PhlGHZ90ePuoPditSyX8Kw3d5KAy/wuSaK8=--VIUfJl+sQlWWu/vV1OxtO0iBAjl4RIiRQZFBdpK3rCk="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
