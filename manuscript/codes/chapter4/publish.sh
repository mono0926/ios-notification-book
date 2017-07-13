#!/bin/bash
curl -v \
-d '{ "aps": { "alert": "message", "badge":1 }}' \
-H "apns-topic: YOUR_APP_ID" \
-H "apns-priority: 10" \
-H "authorization: bearer YOUR_JWT_TOKEN" \
--http2 \
https://api.development.push.apple.com/3/device/YOUR_DEVICE_TOKEN
# Production版のアプリに送る時は、 https://api.push.apple.com のエンドポイントを指定(運用によるが常に両方に送るのもあり)