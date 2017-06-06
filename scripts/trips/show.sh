#!/bin/sh

API="http://localhost:4741"
URL_PATH="/trips"

ID="5936b5eb82e3446e35ef8b19"
TOKEN="YzHx7GH+PhlGHZ90ePuoPditSyX8Kw3d5KAy/wuSaK8=--VIUfJl+sQlWWu/vV1OxtO0iBAjl4RIiRQZFBdpK3rCk="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
