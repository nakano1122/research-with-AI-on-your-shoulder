# Research with AI on Your Shoulder

AIを肩に乗せて研究する - 研究をAIエージェントと協働して進めるためのワークスペースです。

## 概要

このプロジェクトは、AI・ML分野の研究者が日々の研究活動をAIエージェントと一緒に進めることを支援します。

### 主な機能

| スキル              | 説明                                                 |
| ------------------- | ---------------------------------------------------- |
| `/research-partner` | 温かみのある対話で研究をサポートする統括エージェント |
| `/survey-broad`     | 複数エージェントで並列に広範囲の論文を調査           |
| `/survey-focused`   | あなたの研究テーマに絞った深い調査                   |
| `/idea-organizer`   | アイデアを構造化し、draw.io図解で可視化              |
| `/related-work`     | 作業メモから関連研究を自動調査                       |
| `/next-action`      | 進捗を分析し、次にすべきことを提案                   |

### MCPサーバー連携

- **ArXiv MCP**: arXiv論文の検索・取得
- **Academic Search MCP**: Semantic Scholar + Crossref連携

## セットアップ

```bash
# pre-commitのインストール
pip install pre-commit
pre-commit install
```

## クイックスタート

### 1. 研究テーマを登録

```bash
cp framework/templates/theme.md content/themes/my-theme.md
# エディタで編集
```

### 2. 日次メモを作成

```bash
./framework/scripts/new-daily.sh "attention機構の調査"
```

### 3. AIと対話

```
/research-partner
```

## ディレクトリ構成

```
.
├── .claude/           # Claude Code設定・スキル
│   ├── settings.json  # パーミッション・MCP設定
│   └── skills/        # カスタムスキル群
├── framework/         # テンプレート・スクリプト（仕組み側）
│   ├── templates/     # メモ・テーマ・論文ノートのテンプレート
│   └── scripts/       # ユーティリティスクリプト
└── content/           # 研究コンテンツ（日常的に使用）
    ├── themes/        # 研究テーマ定義
    ├── papers/        # 論文まとめ
    └── daily/         # 日次メモ + AI生成コンテンツ
```

## 詳細ドキュメント

- [framework/README.md](framework/README.md) - テンプレート・スクリプトの説明
- [content/README.md](content/README.md) - コンテンツ管理の概要
