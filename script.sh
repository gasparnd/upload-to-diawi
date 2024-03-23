#!/bin/bash
# This project has the proposal of upload an apk to Diawi using the API

echo ""
echo "CLI - Upload APK to DIAWI"
echo ""

if [ -f .env ]; then
    export $(cat .env | sed 's/#.*//g' | xargs)
fi
# APK PATH
APK_PATH=$APK_PATH
# DIAWI API KEY
DIAWI_API_KEY=$DIAWI_API_KEY
# Emails to notify
DIAWI_EMAILS=$DIAWI_EMAILS


echo "Start uploading..."
echo ""

RESPONSE=$(curl -F "token=${DIAWI_API_KEY}" \
               -F "file=@${APK_PATH}" \
               -F "find_by_udid=0" \
               -F "wall_of_apps=0" \
               -F "password=" \
               -F "comment=" \
               -F "callback_emails=${DIAWI_EMAILS}" \
               https://upload.diawi.com/)
               
    
echo ""
echo "APK Uploaded!!"
echo ""
echo "Diawi response: $RESPONSE"