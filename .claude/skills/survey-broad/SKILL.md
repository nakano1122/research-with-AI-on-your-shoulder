---
name: survey-broad
description: |
  研究分野全体を対象に、複数のエージェントで並列に広範囲の論文調査を行う。
  content/themes/ のテーマ定義を参照し、関連するキーワードで網羅的に検索。
  トリガー: 「分野全体を調べて」「広く論文を探して」「サーベイを始めたい」「網羅的に調査」
---

# Survey Broad

複数エージェントで並列に広範囲の論文調査を行う。

## ワークフロー

```
1. テーマ読み込み
   → content/themes/*.md からキーワード・関連分野を抽出

2. 検索戦略立案
   → キーワードを複数の検索クエリに分解

3. 並列調査
   → Agent tool で複数エージェントを同時起動
   → 各エージェントが異なるクエリを担当

4. 結果統合
   → 重複排除、関連度でソート、サマリー作成
```

## 並列エージェント設計

**重要: エージェント起動時は必ず新しいターミナルペーンを作成し、進捗を可視化すること。**

```bash
# ターミナルペーンでエージェントを起動
# 各エージェントの進捗がリアルタイムで確認できるようにする
```

```
Agent(survey-agent-1):
  クエリ: "{主要キーワード} {年度}"
  ソース: arXiv, Semantic Scholar

Agent(survey-agent-2):
  クエリ: "{関連分野} {手法}"
  ソース: arXiv, Semantic Scholar

Agent(survey-agent-3):
  クエリ: "{応用領域} {問題設定}"
  ソース: arXiv, Semantic Scholar
```

各エージェントは以下を返す:

- 論文タイトル、著者、年
- アブストラクト要約（1-2文）
- 関連度スコア（高/中/低）

## 検索ツール活用

```bash
# arXiv MCP（設定済みの場合）
mcp__arxiv__search query="{keyword}" max_results=20

# WebSearch（フォールバック）
WebSearch query="site:arxiv.org {keyword} 2025 2026"
WebSearch query="site:semanticscholar.org {keyword}"
```

## 出力形式

調査結果は `content/daily/{日付}_survey/` に保存:

```markdown
# 広範囲論文調査: {テーマ名}

## 調査概要

- 調査日: YYYY-MM-DD
- 検索キーワード: ...
- 対象期間: ...

## 発見した論文（関連度順）

### 高関連度

1. **[タイトル](URL)** (著者, 年)
   > 要約...

### 中関連度

...

## 次のステップ

- 詳細を読むべき論文: ...
- 追加調査が必要な領域: ...
```
