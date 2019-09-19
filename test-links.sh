#!/bin/sh
set -e

PORT=8001
PID=""
if [ x"$1" = x--remote ]; then
	REMOTE="yes"
else
	REMOTE=""
fi

cleanup() {
	[ -z "$PID" ] || kill "$PID"
	rm -f rejected todo
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
wget --no-verbose --rejected-log=rejected --spider --recursive --page-requisites --level=inf --delete-after "http://localhost:$PORT/"
if [ -n "$REMOTE" ]; then
	tail -n +2 rejected | cut -f 2 | grep -v -E '(turris.local|192.168.1.1|127.0.0.1|localhost)' | sort -u | sed -e 's|%3A|:|g' > todo
	wget --no-verbose --spider --input-file=todo --delete-after
fi
