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
1. 論文ディレクトリ確認・選択
   → content/papers/ を確認
   → ユーザーに読みたい論文を選択してもらう

2. paper.md 読み込み
   → Readツールで content/papers/{論文名}/paper.md を読み込み
   → images/ 内のページ画像も必要に応じて参照

3. 要約生成
   → テンプレートを参照して項目を埋める
   → ユーザーの研究テーマとの関連を分析

4. ノート保存
   → content/papers/{論文名}/note.md に保存
```

## Markdown読み込み方法

```
# 論文ディレクトリ一覧を確認
ls content/papers/

# paper.md を読み込み
Read content/papers/{論文名}/paper.md
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
# 保存先（論文ディレクトリ内に配置）
content/papers/{論文名}/note.md
```

論文ディレクトリ内に `note.md` を作成することで、PDF・Markdown・画像・解説ノートが一箇所にまとまる。

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

## paper.md がない場合

論文Markdownが `content/papers/{論文名}/paper.md` に存在しない場合:

```
指定された論文のMarkdownが見つかりませんでした。

まず /pdf-to-markdown でPDFをMarkdownに変換してください。
PDFがない場合は、以下からダウンロードして
content/papers/{論文名}/original.pdf に保存してください:
- ACM DL: https://dl.acm.org/doi/...
- arXiv: https://arxiv.org/abs/...
```

## スキル連携

- `/pdf-to-markdown` でMarkdown変換後に呼び出される
- `/survey-focused`, `/related-work` から論文特定後に呼び出される
- 読了後は `/idea-organizer` でアイデア整理を推奨

## 進捗報告

Agent Teamsで起動された場合、以下のタイミングでチームリーダー（research-partner）に報告:
- 作業開始時: 対象ファイルと作業内容
- 中間報告: 主要なステップの完了時
- 作業完了時: 成果物と次のアクション
