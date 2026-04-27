---
name: pdf-to-markdown
description: |
  論文PDFをMarkdown形式に変換する。PDFを直接読み込んで構造化。
  トリガー: 「PDFをMarkdownに変換」「論文を変換して」
---

# PDF to Markdown

論文PDFをMarkdown形式に変換する。PDFを直接読み込み、論理構造を解釈して正確なMarkdownを生成する。

## ワークフロー

```
0. 論文ディレクトリ作成
   → ./framework/scripts/new-paper.sh {論文名} で雛形作成

1. PDF選択
   → content/papers/{論文名}/original.pdf を対象にする

2. PDFをMarkdownに変換
   → ReadツールでPDFを直接読み込み
   → 論理構造を解釈してMarkdownを生成

3. 保存・連携
   → paper.md として保存
   → /paper-reader に連携して解説ノートを作成

4. リスト更新
   → content/papers/reading-list.md と content/papers/_index.md を更新
```

## ステップ0: 論文ディレクトリ作成

```bash
./framework/scripts/new-paper.sh {論文名}
```

これにより `content/papers/{論文名}/` が作成される。

## ステップ1: PDFをMarkdownに変換

ReadツールでPDFを直接読み込み、Markdownに変換する。

```
# PDFを読み込み
Read content/papers/{論文名}/original.pdf
```

### 変換ルール

1. **タイトル**: H1として配置
2. **著者・所属**: タイトル直下に記載
3. **Abstract**: H2セクションとして配置
4. **各セクション**: H2/H3で階層化（番号付きセクションを維持）
5. **数式**: LaTeX形式（$...$）で記述
6. **図表**: 本文中で図の内容を説明する形で記載

## 出力構造

```
content/papers/{論文名}/
├── original.pdf         # 元のPDF
└── paper.md             # 変換後のMarkdown
```

## スキル連携

変換完了後、自動的に `/paper-reader` を呼び出して解説ノート（`note.md`）を作成する。

```
/pdf-to-markdown → /paper-reader → note.md
```

## リスト更新

### reading-list.md

読了した論文を `content/papers/reading-list.md` の「読了済み」セクションに移動:

```markdown
- [x] **{論文タイトル}** ({学会} {年})
  - ノート: [{論文名}/note.md]({論文名}/note.md)
```

### _index.md

`content/papers/_index.md` の「登録済み論文」に追加:

```markdown
- [{論文名}]({論文名}/) - {論文タイトル}
```

## 進捗報告

Agent Teamsで起動された場合、以下のタイミングでチームリーダー（research-partner）に報告:
- 作業開始時: 対象ファイルと作業内容
- 中間報告: 主要なステップの完了時
- 作業完了時: 成果物と次のアクション
