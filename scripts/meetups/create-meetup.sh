#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meetups"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "meetup": {
      "name": "'"${MNAME}"'",
      "plain_text_description": "hello goodbye",
      "event_id": "424242424242",
      "short_link": "https://google.com"
    }
  }'

echo
