#!/bin/bash
# content/配下のファイルに対してリントとフォーマットを実行するスクリプト
# Claude Code の PostToolUse hook から呼び出される
# stdin: JSON形式の hook input

set -euo pipefail

input=$(cat)

file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')

[[ -z "$file_path" ]] && exit 0

if [[ "$file_path" == *"/content/"* ]] && [[ "$file_path" == *.md ]]; then
  npx prettier --write "$file_path" 2>/dev/null || true
  npx markdownlint --fix "$file_path" 2>/dev/null || true
fi
