#!/bin/bash

# $ ID=59359a840bb71f634bf9176f TOKEN=WmgbdWqaZNU4SjEj+ZqMTV/lwknk0CfJxYm+Nn3kyR8=--NhWhIP7S1W+EjJzfjRwP4eUC5SPkYBGL6CASn+w05eI= scripts/users/show.sh
# $ ID=59359a840bb71f634bf9176f TOKEN=YzHx7GH+PhlGHZ90ePuoPditSyX8Kw3d5KAy/wuSaK8=--VIUfJl+sQlWWu/vV1OxtO0iBAjl4RIiRQZFBdpK3rCk= scripts/users/show.sh

API="http://localhost:4741"
URL_PATH="/users"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
