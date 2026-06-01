#!/usr/bin/env bash
# Add tools.attitudecycle.com → GitHub Pages (run once with a Cloudflare API token).
set -euo pipefail

ZONE_NAME="${ZONE_NAME:-attitudecycle.com}"
RECORD_NAME="${RECORD_NAME:-tools}"
TARGET="${TARGET:-shayneismagic.github.io}"

if [[ -z "${CLOUDFLARE_API_TOKEN:-}" ]]; then
  echo "Set CLOUDFLARE_API_TOKEN (Zone.DNS Edit for attitudecycle.com)."
  echo "Create one at: https://dash.cloudflare.com/profile/api-tokens"
  exit 1
fi

ZONE_ID=$(curl -s -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
  "https://api.cloudflare.com/client/v4/zones?name=${ZONE_NAME}" \
  | python3 -c "import json,sys; r=json.load(sys.stdin); print(r['result'][0]['id'])")

curl -s -X POST \
  -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
  -H "Content-Type: application/json" \
  "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records" \
  -d "{\"type\":\"CNAME\",\"name\":\"${RECORD_NAME}\",\"content\":\"${TARGET}\",\"proxied\":false,\"ttl\":1}" \
  | python3 -c "import json,sys; r=json.load(sys.stdin); print('OK' if r.get('success') else r)"

echo "DNS: ${RECORD_NAME}.${ZONE_NAME} → ${TARGET} (DNS only / grey cloud)"
echo "Then wait a few minutes for https://tools.attitudecycle.com/"
