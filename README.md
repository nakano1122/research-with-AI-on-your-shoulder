# Research with AI on Your Shoulder

**研究者のためのAIエージェント基盤。論文調査からアイデア整理まで、複数のAIが並列で支援します。**

## 特徴

### ハイブリッドAI構成

Claude CodeとOpenAI Codex CLIを組み合わせたハイブリッド構成に対応。
Claude Codeがオーケストレーターとして複雑な判断を担当し、Codexワーカーが高速・低コストなタスクを並列実行します。

```
Claude Code (Orchestrator)
    │
    │ Agentツールでワーカー起動
    ▼
Codex CLI (Worker) × N
    - 高速・低コスト実行
    - 並列タスク処理
```

### 研究コンテキストの理解

`content/themes/` に登録した研究テーマをAIが参照し、あなたの研究分野に最適化された支援を提供します。

### 知識の構造化

調査結果やアイデアは `content/` ディレクトリに自動で整理され、再利用可能な形で蓄積されます。

## スキル一覧

| スキル | 機能 |
|--------|------|
| `/research-partner` | 研究の相談。タスクの整理と適切なスキルへの委譲 |
| `/survey-broad` | 並列エージェントによる広範囲の論文調査 |
| `/survey-focused` | 特定テーマに絞った深い調査 |
| `/paper-reader` | 論文の解説・Q&A |
| `/pdf-to-markdown` | 論文PDFをMarkdownに変換 |
| `/idea-organizer` | アイデアの構造化と図解 |
| `/related-work` | メモから関連研究を発見 |
| `/next-action` | 進捗分析と次のアクション提案 |
| `/codex-task` | Codex CLIワーカーを起動してタスク実行 |

## 始め方

### 前提条件

- [Claude Code](https://claude.ai/claude-code)
- Node.js 18+
- （オプション）[OpenAI Codex CLI](https://developers.openai.com/codex/cli)

### インストール

```bash
# クローン
git clone https://github.com/your-repo/research-with-AI-on-your-shoulder.git
cd research-with-AI-on-your-shoulder

# 依存関係のインストール（husky + lint-staged）
npm install

# 研究テーマを登録（テンプレートをコピーして編集）
cp framework/templates/theme.md content/themes/my-theme.md

# Claude Codeを起動して /research-partner と入力
```

### Codex CLI連携（オプション）

```bash
# Codex CLIのインストール
npm install -g @openai/codex

# OpenAI APIキーの設定
export OPENAI_API_KEY="your-api-key"
```

詳細は [codex/README.md](codex/README.md) を参照。

## ディレクトリ構成

```
.
├── .claude/           # Claude Code設定・スキル
│   ├── CLAUDE.md      # プロジェクト指示
│   ├── settings.json  # 権限・フック設定
│   └── skills/        # スキル定義
├── codex/             # Codex CLI設定・スキル
├── content/           # 研究コンテンツ（非公開）
│   ├── themes/        # 研究テーマの定義
│   ├── papers/        # 論文ノート
│   └── daily/         # 日次メモ
├── framework/         # テンプレート・スクリプト
│   ├── templates/     # メモ・論文ノートテンプレート
│   └── scripts/       # ユーティリティスクリプト
├── AGENTS.md          # Codex CLI用プロジェクト指示
└── .mcp.json          # MCPサーバー設定（共有）
```

## MCP サーバー

以下のMCPサーバーが設定済み（Claude Code / Codex CLI共通）:

- **arxiv**: arXiv論文の検索・ダウンロード
- **academic-search**: 学術論文検索
