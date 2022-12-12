#!/bin/bash
sudo launchctl unload /Library/LaunchDaemons/com.ndbroadbent.2fa_autopaste.plist 2>/dev/null || true

sed -e "s%/path/to/2fa_autopaste%$PWD%g" -e "s%USERNAME%$USER%g" 2fa_autopaste.plist | sudo tee /Library/LaunchDaemons/com.ndbroadbent.2fa_autopaste.plist
sudo launchctl load /Library/LaunchDaemons/com.ndbroadbent.2fa_autopaste.plist
