#!/bin/bash
# Open Markdown file with grip in cmux browser
file="$1"
port=6419

# Kill existing grip processes before starting (prevents duplication)
pkill -f "grip .* $port" 2>/dev/null
grip "$file" "$port" >/dev/null 2>&1 &
sleep 1

# Open browser in same pane, different tab
surf=$(cmux identify | jq -r '.caller.surface_ref')
cmux browser "$surf" tab new "http://127.0.0.1:$port/"
