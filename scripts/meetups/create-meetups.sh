#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meetups_multiple"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "meetups": [
    {
      "name": "'"${MNAME}-1"'",
      "plain_text_description": "hello goodbye",
      "event_id": "424242424242",
      "short_link": "https://google.com"
    },
    {
      "name": "'"${MNAME}-2"'",
      "plain_text_description": "goodbye hello",
      "event_id": "424242424242",
      "short_link": "https://google.com"
    }
    ]
  }'

echo
