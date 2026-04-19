# AGENTS.md

このプロジェクトは、研究をAIと進めるためのコードスペースである。
AIエージェントが私（研究者）のメモに常にアクセス可能で、私が助けを求めたら、タスクを遂行したり、アドバイスをくれるようにします。

## 注意: Claude Code との連携前提

このプロジェクトは **Claude Code との連携を前提** としています。
Codex CLI 単独で実行された場合は、以下の制限があります:

- Agent Teams 機能は使用不可
- スキル連携（`/research-partner` 等）は限定的
- PostToolUse フックは動作しない

フル機能を利用するには、Claude Code から Codex を呼び出す構成を推奨します。

## ファイル編集後の処理

`content/` 配下の `.md` ファイルを編集した場合、以下を実行してください:

```bash
./framework/scripts/lint-format.sh
```

## コンテンツ構造

```
content/
├── themes/     # 研究テーマ定義
│   └── _index.md
├── daily/      # 日次作業メモ
│   └── YYYY-MM-DD/memo.md
└── papers/     # 論文管理
    ├── reading-list.md
    ├── notes/
    └── pdfs/
```

## 利用可能なスキル

以下のスキルが `codex/skills/` に用意されています:

| スキル名 | 用途 |
|---------|------|
| research-partner | 研究相談の統括、他スキルへの委譲 |
| survey-broad | 広範囲の論文調査 |
| survey-focused | テーマ特化型論文調査 |
| related-work | 関連研究の探索 |
| paper-reader | 論文の解説・Q&A |
| pdf-to-markdown | PDF を Markdown に変換 |
| idea-organizer | アイデアの整理・可視化 |
| next-action | 次のアクション提案 |

## MCP サーバー

`.mcp.json` で以下のMCPサーバーが設定されています:

- **arxiv**: arXiv論文の検索・ダウンロード
- **academic-search**: 学術論文検索

## 作業時の注意

1. 作業は小さな単位に分割する
2. こまめにコミットする
3. 不明点は早めに確認する
4. 推測で進める場合はその旨を明示する
