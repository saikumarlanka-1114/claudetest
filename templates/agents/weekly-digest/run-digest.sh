#!/usr/bin/env bash
# Weekly digest agent: runs Claude headless with read-only glab access,
# writes digest.md, and optionally posts it to a chat webhook.
# Requires: claude CLI, glab (authenticated), ANTHROPIC_API_KEY (or org login).
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="${DIGEST_OUT:-digest.md}"

claude -p "$(cat "$HERE/digest-prompt.md")" \
  --allowedTools "Bash(glab mr list:*)" "Bash(glab mr view:*)" \
                 "Bash(glab ci list:*)" "Bash(glab ci trace:*)" \
                 "Bash(glab issue list:*)" "Bash(glab issue view:*)" \
  --max-turns 25 \
  > "$OUT"

echo "Digest written to $OUT"

# Optional: post to a Teams/Slack-compatible incoming webhook.
if [[ -n "${DIGEST_WEBHOOK_URL:-}" ]]; then
  curl -fsS -X POST -H 'Content-Type: application/json' \
    --data "$(python3 -c 'import json,sys; print(json.dumps({"text": open(sys.argv[1]).read()}))' "$OUT")" \
    "$DIGEST_WEBHOOK_URL"
fi
