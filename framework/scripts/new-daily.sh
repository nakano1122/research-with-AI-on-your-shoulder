#!/bin/bash

# 日次メモディレクトリを作成するスクリプト
# 使用方法: ./new-daily.sh "タイトル"

set -e

# 引数チェック
if [ -z "$1" ]; then
    echo "使用方法: $0 \"タイトル\""
    echo "例: $0 \"attention機構の調査\""
    exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
CONTENT_DIR="$PROJECT_ROOT/content/daily"
TEMPLATE="$PROJECT_ROOT/framework/templates/memo.md"

# タイトルをファイル名に適した形式に変換（スペースをアンダースコアに）
SAFE_TITLE=$(echo "$TITLE" | tr ' ' '_')
DIR_NAME="${DATE}_${SAFE_TITLE}"
TARGET_DIR="$CONTENT_DIR/$DIR_NAME"

# ディレクトリが既に存在する場合は警告
if [ -d "$TARGET_DIR" ]; then
    echo "警告: ディレクトリ $TARGET_DIR は既に存在します"
    exit 1
fi

# ディレクトリ作成
mkdir -p "$TARGET_DIR/generated"

# テンプレートからメモファイルを作成
if [ -f "$TEMPLATE" ]; then
    sed -e "s/{タイトル}/$TITLE/g" -e "s/YYYY-MM-DD/$DATE/g" "$TEMPLATE" > "$TARGET_DIR/memo.md"
else
    # テンプレートがない場合は基本的な構造で作成
    cat > "$TARGET_DIR/memo.md" << EOF
---
title: "$TITLE"
description: ""
date: $DATE
---

# $TITLE

## 内容

EOF
fi

echo "作成しました: $TARGET_DIR"
echo "  - memo.md"
echo "  - generated/ (AI生成コンテンツ用)"
