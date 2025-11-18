#!/bin/bash
# Script to notify IndexNow about new pages

KEY="f8172f17bbe9e7dabb7a76a4a7be3d2f"

echo "Sending notification to IndexNow..."

# Create JSON payload with all URLs
PAYLOAD=$(cat <<'EOF'
{
  "host": "coderic.net",
  "key": "f8172f17bbe9e7dabb7a76a4a7be3d2f",
  "keyLocation": "https://coderic.net/f8172f17bbe9e7dabb7a76a4a7be3d2f.txt",
  "urlList": [
    "https://coderic.net/",
    "https://coderic.net/apis",
    "https://coderic.net/datasets",
    "https://coderic.net/endpoints",
  ]
}
EOF
)

echo "Notifying all URLs..."
RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
  "https://api.indexnow.org/IndexNow" \
  -H "Content-Type: application/json; charset=utf-8" \
  -d "$PAYLOAD")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | head -n -1)

echo "Response Code: $HTTP_CODE"

if [ "$HTTP_CODE" == "200" ] || [ "$HTTP_CODE" == "202" ]; then
  echo "Success! URLs submitted for indexing."
elif [ "$HTTP_CODE" == "400" ]; then
  echo "Error 400: Bad request - Check the payload format"
  echo "$BODY"
elif [ "$HTTP_CODE" == "403" ]; then
  echo "Error 403: Invalid key - Key verification failed"
elif [ "$HTTP_CODE" == "422" ]; then
  echo "Error 422: URL doesn't belong to the host or cannot be found"
else
  echo "Response: HTTP $HTTP_CODE"
  echo "$BODY"
fi

echo ""
echo "IndexNow supports:"
echo "  - Bing"
echo "  - Yandex"  
echo "  - Naver"
echo "  - Seznam.cz"
