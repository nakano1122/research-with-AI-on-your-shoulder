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
1. PDF選択
   → content/papers/pdfs/ から対象PDFを選択

2. 出力ディレクトリ作成
   → content/papers/markdown/{論文名}/ を作成

3. ページ画像抽出
   → pdftoppm でページごとにPNG画像を生成

4. エージェントによるMarkdown変換
   → ページ画像を順番に読み込み
   → 論理構造を解釈してMarkdownを生成
   → 図表は適切な位置にページ画像として挿入

5. 保存・連携
   → {論文名}.md として保存
   → /paper-reader に連携して解説ファイルを作成
```

## ステップ1: ページ画像抽出

```bash
# 出力ディレクトリ作成
mkdir -p content/papers/markdown/{論文名}

# PDFの各ページをPNG画像に変換
pdftoppm -png "content/papers/pdfs/{ファイル名}.pdf" "content/papers/markdown/{論文名}/page"
```

## ステップ2: エージェントによる変換

ページ画像を順番にReadツールで読み込み、Markdownに変換する。

```
# 各ページを読み込み
Read content/papers/markdown/{論文名}/page-01.png
Read content/papers/markdown/{論文名}/page-02.png
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
![Figure 1: Overview of MIRROR framework](page-02.png)
```

図表が登場するセクションに、対応するページ画像への参照を挿入する。

## 出力構造

```
content/papers/markdown/
└── {論文名}/
    ├── {論文名}.md      # 変換後のMarkdown
    ├── page-01.png      # ページ画像
    ├── page-02.png
    └── ...
```

## スキル連携

変換完了後、自動的に `/paper-reader` を呼び出して解説ファイルを作成する。

```
/pdf-to-markdown → /paper-reader → 解説ノート
```
