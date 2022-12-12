# 2FA Autopaste

Monitors Mac clipboard and automatically types in any detected 2FA codes.
Requires iCloud Universal Clipboard sync between iPhone and Mac.

### Install:

```
./install.sh
```

This sets up a launch daemon at `/Library/LaunchDaemons/com.ndbroadbent.2fa_autopaste.plist` and starts running the script in the background.
