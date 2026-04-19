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
1. PDF確認
   → content/papers/pdfs/ のファイル一覧を表示
   → ユーザーに読みたい論文を選択してもらう

2. PDF読み込み
   → Read ツールでPDFを読み込み
   → 長いPDFは pages パラメータで分割読み込み

3. 要約・解説
   → 論文の構造に沿って要約
   → ユーザーの研究テーマとの関連を分析

4. Q&A対話
   → ユーザーの質問に回答
   → 必要に応じて該当箇所を再読み込み

5. 論文ノート生成
   → content/papers/notes/{著者}-{年}-{キーワード}.md に保存
```

## PDF確認

```bash
# ダウンロード済みPDFを確認
ls content/papers/pdfs/

# 読書リストを確認
Read content/papers/reading-list.md
```

## PDF読み込み

```bash
# PDFを読み込み（Read ツールはPDFをサポート）
Read content/papers/pdfs/{ファイル名}.pdf

# 長いPDF（10ページ超）は分割して読み込み
Read content/papers/pdfs/{ファイル名}.pdf pages="1-10"
Read content/papers/pdfs/{ファイル名}.pdf pages="11-20"
```

## 研究テーマ参照

要約時にユーザーの研究テーマを参照し、関連性を分析:

```bash
# テーマファイルを読み込み
Read content/themes/_index.md
Glob content/themes/*.md
```

## 論文ノート生成

読了後、テンプレートを使用してノートを作成:

```bash
# テンプレートをコピー
cp framework/templates/paper-note.md content/papers/notes/{著者}-{年}-{キーワード}.md
```

## 出力形式

### 要約フォーマット

```markdown
## 論文要約: {タイトル}

### 基本情報
- **著者**: ...
- **学会/年**: ...
- **URL**: ...

### Abstract
（論文のAbstractを日本語で要約）

### 研究課題
この論文が解こうとしている問題。

### 提案手法
- アーキテクチャ: ...
- 主要なコンポーネント: ...
- 損失関数/最適化: ...

### 実験結果
- データセット: ...
- ベースライン: ...
- 主要な結果: ...

### あなたの研究との関連

**関連するテーマ**: {テーマ名}

- 類似点: ...
- 差別化できる点: ...
- 活用できるアイデア: ...

### 疑問・コメント
読んで生じた疑問や批判的コメント。
```

## PDFがない場合

PDFが `content/papers/pdfs/` に存在しない場合:

```markdown
指定された論文のPDFが見つかりませんでした。

### ダウンロード方法

1. 以下のURLから論文をダウンロードしてください:
   - ACM DL: https://dl.acm.org/doi/...
   - arXiv: https://arxiv.org/abs/...

2. ダウンロードしたPDFを以下に保存:
   ```
   content/papers/pdfs/{著者名}-{年}-{キーワード}.pdf
   ```

3. 保存後、再度 `/paper-reader` を実行してください。
```

## 対話例

**ユーザー**: MIRRORの論文を読みたい

**paper-reader**:

> `content/papers/pdfs/` を確認しますね。
>
> （PDFがある場合）
> `mirror-2024-reciprocal.pdf` がありますね。読み込んで要約します。
>
> （PDFがない場合）
> MIRRORの論文PDFがまだダウンロードされていないようです。
> 以下からダウンロードして `content/papers/pdfs/mirror-2024-reciprocal.pdf` として保存してください:
> https://dl.acm.org/doi/10.1145/3626772.3657776

**ユーザー**: この論文の手法をもっと詳しく教えて

**paper-reader**:

> 手法のセクションを詳しく読み込みますね。
> （該当部分を再読み込みして詳細に解説）

## スキル連携

- `/survey-focused`, `/related-work` から論文特定後に呼び出される
- 読了後は `/idea-organizer` でアイデア整理を推奨
