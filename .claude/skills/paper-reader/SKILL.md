---
name: paper-reader
description: |
  論文PDFを読み込み、要約・解説・Q&Aを行う。
  トリガー: 「論文を読んで」「この論文を解説して」「PDFを読み込んで」「論文について質問」
---

# Paper Reader

ダウンロードした論文PDFを読み込み、要約・解説・質問応答を行う。

## ワークフロー

```
1. PDF確認・選択
   → content/papers/pdfs/ を確認
   → ユーザーに読みたい論文を選択してもらう

2. PDF読み込み
   → Readツールでpages指定して読み込み
   → 10ページ超は分割（1-10, 11-20...）

3. 要約生成
   → テンプレートを参照して項目を埋める
   → ユーザーの研究テーマとの関連を分析

4. ノート保存
   → content/papers/notes/{著者}-{年}-{キーワード}.md に保存
```

## PDF読み込み方法

`pdftotext`（poppler）でテキスト抽出後、Readツールで読み込む:

```bash
# PDFからテキストを抽出
pdftotext "content/papers/pdfs/{ファイル名}.pdf" "content/papers/pdfs/{ファイル名}.txt"

# 抽出したテキストを読み込み
Read content/papers/pdfs/{ファイル名}.txt
```

**前提条件**: `poppler` がインストールされていること（`brew install poppler`）

## テンプレート参照

要約はテンプレートに沿って作成:

```
Read framework/templates/paper-note.md
```

テンプレートの各項目を埋める形で要約を生成する。

## 研究テーマ参照

ユーザーの研究テーマを読み込み、「自分の研究との関連」を分析:

```
Read content/themes/_index.md
Glob content/themes/*.md
```

## ノート保存

```bash
# 保存先
content/papers/notes/{著者}-{年}-{キーワード}.md

# 例
content/papers/notes/zhao-2024-mirror.md
```

## PDFがない場合

```
指定された論文のPDFが見つかりませんでした。

以下からダウンロードして content/papers/pdfs/ に保存してください:
- ACM DL: https://dl.acm.org/doi/...
- arXiv: https://arxiv.org/abs/...

保存後、再度 /paper-reader を実行してください。
```

## スキル連携

- `/survey-focused`, `/related-work` から論文特定後に呼び出される
- 読了後は `/idea-organizer` でアイデア整理を推奨
