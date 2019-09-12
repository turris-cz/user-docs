#!/bin/sh
set -e

PORT=8001
PID=""

cleanup() {
	[ -z "$PID" ] || kill "$PID"
}
trap cleanup EXIT

running() {
	kill -0 "$PID" 2>/dev/null
}


# Start mkdocs server
mkdocs serve --no-livereload --dev-addr "127.0.0.1:$PORT" &
PID="$!"

# Wait for port to be opened or server to die
while running && awk -v addr="0100007F:$(printf "%X" "$PORT")" '$2 == addr { exit 1 }' /proc/net/tcp; do
	sleep 1
done

running || {
	echo "mkdocs serve failed to start" >&2
	exit 1
}

# Crawler trough links on website (note that local only)
wget --spider --recursive --delete-after "http://localhost:$PORT/"
