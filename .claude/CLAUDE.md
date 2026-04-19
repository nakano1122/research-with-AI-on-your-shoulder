# CLAUDE.md

このプロジェクトは、研究をAIと進めるためのコードスペースである。
AIエージェントが私（研究者）のメモに常にアクセス可能で、私が助けを求めたら、タスクを遂行したり、アドバイスをくれるようにします。

この目標の実現のために、

- AIエージェントにタスクを割り振るためのコマンド群
- AIエージェントが確実に任務を遂行できるようなスキル群
- AIエージェントが読みやすいテキスト管理

を作っていきます。
なお、外部の方にも共有できるように、Claude Code関連の設定ファイルは、グローバルの`.claude/`ではなく、このディレクトリの`.claude`に置きましょう。

私から指示を出したら、私の意見を具体化するように議論してください。
複数のエージェントを使った方が良いかを考えて、積極的に、複数のエージェントで並列に作業してください。

作業中はこまめにコミットしながら進めてください。

## Codex CLI連携（ハイブリッド構成）

このプロジェクトはClaude CodeとOpenAI Codex CLIのハイブリッド構成に対応しています。

### アーキテクチャ

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

### Codexワーカーの起動方法

Codex CLIでタスクを実行したい場合は、`/codex-task` スキルを使用するか、
以下のようにAgentツールで専用ワーカーを起動してください：

```
Agent({
  name: "codex-worker",
  description: "Codex CLIでタスク実行",
  prompt: `あなたはCodex CLIを使ってタスクを実行するワーカーエージェントです。

## タスク
{タスク内容}

## 実行方法
\`\`\`bash
codex exec "{タスク内容}" --full-auto
\`\`\`

結果を報告してください。`
})
```

### 並列実行

複数のCodexワーカーを同時に起動可能：

```
Agent({ name: "codex-worker-1", prompt: "タスク1..." })
Agent({ name: "codex-worker-2", prompt: "タスク2..." })
```

### 使い分け

| ユースケース | 推奨 |
|-------------|------|
| 複雑な推論・設計判断 | Claude Code |
| 高速・低コストな処理 | Codex CLI |
| 並列バッチ処理 | Codex CLI × 複数 |
| Agent Teams連携 | Claude Code（オーケストレーター） |
