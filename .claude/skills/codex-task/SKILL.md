---
name: codex-task
description: |
  Codex CLIワーカーエージェントを起動してタスクを実行する。
  Claude CodeがオーケストレーターとしてCodexを呼び出すハイブリッド構成。
  トリガー: 「Codexで実行」「Codexに任せて」「並列でCodex」「高速に処理」
---

# Codex Task - Codex CLIワーカー起動スキル

Claude CodeからCodex CLIワーカーエージェントを起動し、タスクを実行させる。

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
```

## 使い方

### 単一タスク実行

Agentツールでcodex-workerを起動:

```
Agent({
  name: "codex-worker",
  description: "Codex CLIでタスク実行",
  prompt: `あなたはCodex CLIを使ってタスクを実行するワーカーエージェントです。

## タスク
{ユーザーのタスク内容}

## 実行方法
以下のコマンドでCodex CLIを実行してください：

\`\`\`bash
codex exec "{タスク内容}" --full-auto
\`\`\`

結果を報告してください。`
})
```

### 並列タスク実行

複数のAgentを同時に起動して並列処理:

```
// 1つのメッセージで複数のAgentツールを呼び出す
Agent({ name: "codex-worker-1", prompt: "タスク1..." })
Agent({ name: "codex-worker-2", prompt: "タスク2..." })
Agent({ name: "codex-worker-3", prompt: "タスク3..." })
```

## 研究支援での活用例

### 論文の並列要約

```
Agent({ name: "codex-paper-1", prompt: "content/papers/pdfs/paper1.pdf を要約..." })
Agent({ name: "codex-paper-2", prompt: "content/papers/pdfs/paper2.pdf を要約..." })
```

### テーマ関連情報の収集

```
Agent({
  name: "codex-theme-search",
  prompt: `content/themes/ のテーマ定義を読み、関連キーワードを抽出してください。`
})
```

## Codex exec オプション

| オプション | 説明 |
|-----------|------|
| `--full-auto` | 完全自動実行（承認なし、sandbox有効） |
| `--sandbox read-only` | 読み取り専用sandbox |
| `-m MODEL` | モデル指定（例: `-m o3`） |

## 注意事項

1. **Agent Teams連携**: research-partnerからの委譲で使用可能
2. **コスト**: Codex CLIは別途OpenAI APIコストが発生
3. **MCP共有**: .mcp.jsonはClaude CodeとCodexで共有される
4. **結果報告**: codex-workerは結果をオーケストレーターに報告
