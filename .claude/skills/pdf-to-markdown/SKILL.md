---
name: pdf-to-markdown
description: |
  論文PDFをMarkdown形式に変換する。エージェントがページ画像を解釈して構造化。
  トリガー: 「PDFをMarkdownに変換」「論文を変換して」
---

# PDF to Markdown

論文PDFをMarkdown形式に変換する。エージェントがページ画像を見ながら論理構造を解釈し、正確なMarkdownを生成する。

## 前提条件

`poppler` がインストールされていること:

```bash
brew install poppler
```

## ワークフロー

```
0. 論文ディレクトリ作成
   → ./framework/scripts/new-paper.sh {論文名} で雛形作成

1. PDF選択
   → content/papers/{論文名}/original.pdf を対象にする

2. 画像出力ディレクトリ作成
   → content/papers/{論文名}/images/ を作成

3. ページ画像抽出
   → pdftoppm でページごとにPNG画像を生成

4. エージェントによるMarkdown変換
   → ページ画像を順番に読み込み
   → 論理構造を解釈してMarkdownを生成
   → 図表は適切な位置にページ画像として挿入

5. 保存・連携
   → paper.md として保存
   → /paper-reader に連携して解説ノートを作成

6. リスト更新
   → content/papers/reading-list.md と content/papers/_index.md を更新
```

## ステップ0: 論文ディレクトリ作成

```bash
./framework/scripts/new-paper.sh {論文名}
```

これにより `content/papers/{論文名}/` と `images/` が作成される。

## ステップ1: ページ画像抽出

```bash
# 画像出力ディレクトリ作成
mkdir -p content/papers/{論文名}/images

# PDFの各ページをPNG画像に変換
pdftoppm -png "content/papers/{論文名}/original.pdf" "content/papers/{論文名}/images/page"
```

## ステップ2: エージェントによる変換

ページ画像を順番にReadツールで読み込み、Markdownに変換する。

```
# 各ページを読み込み
Read content/papers/{論文名}/images/page-01.png
Read content/papers/{論文名}/images/page-02.png
...
```

### 変換ルール

1. **タイトル**: H1として配置
2. **著者・所属**: タイトル直下に記載
3. **Abstract**: H2セクションとして配置
4. **各セクション**: H2/H3で階層化（番号付きセクションを維持）
5. **数式**: LaTeX形式（$...$）で記述
6. **図表**: ページ画像を参照として挿入

### 図表の挿入形式

```markdown
![Figure 1: Overview of MIRROR framework](images/page-02.png)
```

図表が登場するセクションに、対応するページ画像（`images/` 相対パス）への参照を挿入する。

## 出力構造

```
content/papers/{論文名}/
├── original.pdf         # 元のPDF
├── paper.md             # 変換後のMarkdown
└── images/
    ├── page-01.png
    ├── page-02.png
    └── ...
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
