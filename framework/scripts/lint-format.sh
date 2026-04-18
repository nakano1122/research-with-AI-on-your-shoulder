#!/bin/bash
# content/配下のファイルに対してリントとフォーマットを実行するスクリプト
# Claude Code の PostToolUse hook から呼び出される
# stdin: JSON形式の hook input

set -euo pipefail

file_path=$(jq -r '.tool_response.filePath // .tool_input.file_path')

# content/配下のファイルのみ対象
if [[ "$file_path" =~ ^content/ ]]; then
  npx prettier --write "$file_path" 2>/dev/null || true
  npx markdownlint-cli --fix "$file_path" 2>/dev/null || true
fi
