---
name: paper-reader
description: |
  論文Markdownを読み込み、要約・解説・Q&Aを行う。
  トリガー: 「論文を読んで」「この論文を解説して」「論文について質問」
---

# Paper Reader

Markdown形式に変換された論文を読み込み、要約・解説・質問応答を行う。

## ワークフロー

```
1. Markdown確認・選択
   → content/papers/markdown/ を確認
   → ユーザーに読みたい論文を選択してもらう

2. Markdown読み込み
   → Readツールで論文Markdownを読み込み
   → 画像も参照可能

3. 要約生成
   → テンプレートを参照して項目を埋める
   → ユーザーの研究テーマとの関連を分析

4. ノート保存
   → content/papers/notes/{著者}-{年}-{キーワード}.md に保存
```

## Markdown読み込み方法

```
# 論文ディレクトリを確認
ls content/papers/markdown/

# Markdownを読み込み
Read content/papers/markdown/{論文名}/{論文名}.md
```

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

## Markdownがない場合

論文のMarkdownが `content/papers/markdown/` に存在しない場合:

```
指定された論文のMarkdownが見つかりませんでした。

まず /pdf-to-markdown でPDFをMarkdownに変換してください。
PDFがない場合は、以下からダウンロードして content/papers/pdfs/ に保存してください:
- ACM DL: https://dl.acm.org/doi/...
- arXiv: https://arxiv.org/abs/...
```

## スキル連携

- `/pdf-to-markdown` でMarkdown変換後に呼び出される
- `/survey-focused`, `/related-work` から論文特定後に呼び出される
- 読了後は `/idea-organizer` でアイデア整理を推奨
