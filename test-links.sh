#!/bin/bash
set -e

PORT=8001
PID=""
REMOTE=""
USER_AGENT="Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0"

# Check if the --remote flag is provided
if [ "$1" == "--remote" ]; then
    REMOTE="yes"
fi

# Function to clean up resources on exit
cleanup() {
    # Kill the mkdocs server if it's running
    [ -z "$PID" ] || kill "$PID"
    
    # Check for any failed links in the log
    if [ "$(grep -v '200 OK$' log | wc -l)" -gt 0 ]; then
        echo "---------------"
        echo "|  Failures:  |"
        echo "---------------"
        echo
        grep -B 1 -v '200 OK$' log
    fi
    
    # Remove temporary files
    rm -f rejected todo log
}
trap cleanup EXIT

# Function to check if the mkdocs server is running
running() {
    kill -0 "$PID" 2>/dev/null
}

# Start mkdocs server
mkdocs serve --no-livereload --dev-addr "127.0.0.1:$PORT" &
PID="$!"

# Wait for the mkdocs server to start or fail
while running && awk -v addr="0100007F:$(printf "%X" "$PORT")" '$2 == addr { exit 1 }' /proc/net/tcp; do
    sleep 1
done

# Exit if the mkdocs server failed to start
running || {
    echo "mkdocs serve failed to start" >&2
    exit 1
}

# Crawl through links on the local website
wget --no-verbose --rejected-log=rejected --spider --recursive --page-requisites --level=inf --no-directories --delete-after "http://localhost:$PORT/"

# If the --remote flag is provided, check remote links
if [ -n "$REMOTE" ]; then
    # Filter and prepare the list of URLs to check
    tail -n +2 rejected | cut -f 2 | grep -v -E '(turris.local|gitlab.nic.cz/turris/os/build/tree/.*release.name.*|192.168.1.1|127.0.0.1|localhost)' | sort -u | sed -e 's|%3A|:|g' > todo
    
    # Set pipefail option to catch errors in the pipeline
    set -o pipefail
    
    # Check the URLs in the todo list
    wget --no-verbose --spider --input-file=todo --no-directories --delete-after --user-agent="$USER_AGENT" 2>&1 | tee log
fi