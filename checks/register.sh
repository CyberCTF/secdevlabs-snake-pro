#!/bin/sh
# A player registers and logs in over plain HTTP, and gets a session cookie.
set -e
user="probe$$"
curl -fsS -H 'Content-Type: application/json' -d "{\"user\":\"$user\",\"pass\":\"probe-pass\",\"passcheck\":\"probe-pass\"}" http://api:10003/register | grep -q 'created'
curl -fsS -D - -o /dev/null -H 'Content-Type: application/json' -d "{\"user\":\"$user\",\"pass\":\"probe-pass\"}" http://api:10003/login | grep -qi 'set-cookie: sessionIDsnake='
