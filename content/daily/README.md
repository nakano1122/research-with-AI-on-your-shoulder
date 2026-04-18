# Daily

日次メモを管理するディレクトリです。

## ディレクトリ構造

各メモは独立したディレクトリとして管理されます:

```
content/daily/
└── YYYY-MM-DD_{タイトル}/
    ├── memo.md           # あなたのメモ
    └── generated/        # AI生成コンテンツ
        ├── diagram.drawio
        └── summary.md
```

## メモの作成方法

```bash
./framework/scripts/new-daily.sh "タイトル"
```

## AI生成コンテンツ

AIエージェントが生成したコンテンツは、同じディレクトリ内の `generated/` に保存されます:

- **図解** (`.drawio`): `/idea-organizer` や `/next-action` が生成
- **レポート** (`.md`): 調査結果のまとめ

## 時系列管理

ディレクトリ名が `YYYY-MM-DD_` で始まるため、ファイルシステム上で自然に時系列順に並びます。
`_index.md` にも最近のメモを追記することで、AIがすばやく全体像を把握できます。
