#!/bin/bash
set -euo pipefail

# Needs: brew install reattach-to-user-namespace
# See: https://apple.stackexchange.com/a/41414/56850

# Automatically type in 2FA codes on my computer when I copy them on my phone.
echo "Starting 2fa_autopaste..."

SENT_CODE=""
while true; do
    CLIPBOARD=$(/usr/local/bin/reattach-to-user-namespace pbpaste)
    if [[ $CLIPBOARD =~ ^[0-9]{6}$ ]]; then
        if [[ $CLIPBOARD != "$SENT_CODE" ]]; then
            echo "Found 2FA code in clipboard. Sending keystrokes to active window..."
            osascript -e "tell application \"System Events\" to keystroke \"$CLIPBOARD\"" \
                      -e "tell application \"System Events\" to key code 36"
            SENT_CODE="$CLIPBOARD"
        fi
    fi
    sleep 0.5
done

echo "2fa_autopaste stopped."
