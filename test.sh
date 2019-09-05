#!/bin/sh -e
PID=""

cleanup() {
    [ -z "$PID" ] || kill "$PID"
}
trap cleanup EXIT

mkdocs build
mkdocs serve &
PID="$!"
# Let embedded job start
sleep 5
wget -q --spider -r http://localhost:8000/
