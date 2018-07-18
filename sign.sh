#!/bin/bash

set -eu

if [ $# -ne 3 ]; then
   echo Usage: $0 certificate-fingerprint appid provisioning-file
   exit 1
fi

CERT=$1
APPID=$2
PP=$3
IFS=. read TEAMID BUNDLEID <<<"${APPID}"

mkdir -p keosd.app/Contents/MacOS
cp "$3" keosd.app/Contents/embedded.provisionprofile
cp keosd keosd.app/Contents/MacOS/keosd

cat > keosd.app/Contents/Info.plist <<ENDENDEND
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>
	<key>CFBundleExecutable</key>
	<string>keosd</string>
	<key>CFBundleIdentifier</key>
	<string>$BUNDLEID</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>keosd</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleSupportedPlatforms</key>
	<array>
		<string>MacOSX</string>
	</array>
	<key>CFBundleVersion</key>
	<string>1</string>
</dict>
</plist>
ENDENDEND

TMPFILE=$(mktemp /tmp/signscript.XXXXXX)
trap "rm $TMPFILE" EXIT

cat > $TMPFILE <<ENDENDEND
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.application-identifier</key>
	<string>$APPID</string>
	<key>com.apple.developer.team-identifier</key>
	<string>$TEAMID</string>
	<key>com.apple.security.app-sandbox</key>
	<false/>
	<key>com.apple.security.files.user-selected.read-only</key>
	<false/>
	<key>com.apple.security.files.user-selected.read-write</key>
	<true/>
</dict>
</plist>
ENDENDEND

codesign --verbose --force --sign $CERT --timestamp=none --entitlements $TMPFILE keosd.app
