# Codex CLI 設定

このディレクトリには、OpenAI Codex CLI 用の設定とスキルが含まれています。

## アーキテクチャ

```
Claude Code (Orchestrator)
    │
    │ Agentツールでワーカー起動
    ▼
codex-worker Agent
    │
    │ Bashで codex exec 実行
    ▼
Codex CLI (Worker)
    - 高速・低コスト実行
    - 並列タスク処理
```

このプロジェクトは **Claude Code をオーケストレーター** として使用し、
Codex CLI をワーカーとして呼び出すハイブリッド構成を採用しています。

## 前提条件

```bash
# Codex CLI のインストール
npm install -g @openai/codex

# OpenAI API キーの設定
export OPENAI_API_KEY="your-api-key"
```

## スキル一覧

| スキル | 説明 |
|--------|------|
| `research-partner` | 研究相談の統括、他スキルへの委譲 |
| `survey-broad` | 広範囲の論文調査 |
| `survey-focused` | テーマ特化型論文調査 |
| `related-work` | 関連研究の探索 |
| `paper-reader` | 論文の解説・Q&A |
| `pdf-to-markdown` | PDF を Markdown に変換 |
| `idea-organizer` | アイデアの整理・可視化 |
| `next-action` | 次のアクション提案 |

## 使い方

### Claude Code から Codex を呼び出す

Claude Code 内で `/codex-task` スキルを使用するか、Agentツールでワーカーを起動:

```bash
codex exec "content/papers/pdfs/paper.pdf を要約して" --full-auto
```

### 並列実行

```bash
codex exec "タスク1" --full-auto &
codex exec "タスク2" --full-auto &
wait
```

### 承認モード

```bash
# 対話モード（デフォルト）
codex "タスク"

# Full Auto: sandbox内で自動実行
codex exec "タスク" --full-auto

# Read-only sandbox
codex exec "タスク" --sandbox read-only
```

## MCP サーバー

プロジェクトルートの `.mcp.json` が Claude Code と Codex CLI で共有されます:

- `arxiv`: arXiv 論文の検索・ダウンロード
- `academic-search`: 学術論文検索

## 注意事項

1. **Agent Teams 機能**: Codex CLI 単独では使用不可。Claude Code から呼び出す構成を推奨
2. **PostToolUse hooks**: Codex では動作しない。`./framework/scripts/lint-format.sh` を手動実行
3. **セキュリティ**: Codex は sandbox 内で実行される。機密情報の取り扱いに注意

## ファイル構造

```
codex/
├── README.md          # このファイル
└── skills/            # Codex 用スキル定義
    ├── research-partner/SKILL.md
    ├── survey-broad/SKILL.md
    └── ...
```
