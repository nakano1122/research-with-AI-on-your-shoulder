#!/bin/bash
# 新しい論文ディレクトリを作成するスクリプト
# Usage: ./framework/scripts/new-paper.sh <論文名>
# 例: ./framework/scripts/new-paper.sh mirror-2024

PAPER_NAME="$1"

if [ -z "$PAPER_NAME" ]; then
  echo "Usage: $0 <論文名>"
  echo "例: $0 mirror-2024"
  exit 1
fi

PAPER_DIR="content/papers/$PAPER_NAME"

# ディレクトリが既に存在する場合
if [ -d "$PAPER_DIR" ]; then
  echo "ディレクトリが既に存在します: $PAPER_DIR"
  exit 0
fi

# ディレクトリ作成
mkdir -p "$PAPER_DIR/images"

echo "論文ディレクトリを作成しました: $PAPER_DIR"
echo "次のステップ:"
echo "  1. PDFを $PAPER_DIR/original.pdf に配置"
echo "  2. /pdf-to-markdown で変換"
echo "  3. /paper-reader で解説ノート作成"
