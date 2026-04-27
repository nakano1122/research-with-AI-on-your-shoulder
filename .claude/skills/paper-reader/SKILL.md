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

2. PDF → Markdown 変換（必須）
   → paper.md が存在しない場合、必ず /pdf-to-markdown を先に実行
   → original.pdf から paper.md を生成
   → この変換なしにノート作成を開始してはならない

3. paper.md 読み込み
   → Readツールで content/papers/{論文名}/paper.md を読み込み

4. ノート作成・更新
   → テンプレートを参照して項目を埋める
   → ユーザーとの対話を通じて理解を深める

5. ノート保存
   → content/papers/{論文名}/note.md に保存
```

## 重要: PDF変換の必須化

**論文ノートを作成する前に、必ず `/pdf-to-markdown` でPDFをMarkdownに変換すること。**

理由:
- paper.md がないと論文の全文を参照できない
- 変換せずにノートを書くと、不正確・不完全な内容になる

変換前チェック:
```bash
# paper.md の存在確認
ls content/papers/{論文名}/paper.md

# なければ変換を実行
/pdf-to-markdown content/papers/{論文名}/original.pdf
```

## ノート作成の方針

### 「何をしたか」より「どんなアイデアか」

- 実装の詳細よりも、なぜそのアプローチを取るのかを重視
- 「このコンポーネントがある」ではなく「このコンポーネントがある理由」を説明
- 着眼点・洞察を明確にする

### 読書フェーズに応じた記述

テンプレートは読み進めながら埋めていくガイドとして機能する：

1. **読み始め**: 問題設定と着眼点を把握
2. **提案手法**: 図を見ながらアイデアを整理
3. **読了後**: 自分の研究との関連、疑問を記入

## テンプレート参照

```
Read framework/templates/paper-note.md
```

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

## リスト更新

### reading-list.md

読了した論文を `content/papers/reading-list.md` の「読了済み」セクションに移動:

```markdown
- [x] **{論文タイトル}** ({学会} {年})
  - ノート: [{論文名}/note.md]({論文名}/note.md)
```

## paper.md がない場合

論文Markdownが存在しない場合:

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
