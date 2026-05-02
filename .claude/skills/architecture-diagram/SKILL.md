---
name: architecture-diagram
description: |
  Draw.ioを使って研究手法のアーキテクチャ図を作成・編集するスキル。
  
  以下の場合に使用:
  - 機械学習/深層学習のアーキテクチャ図を作成したい
  - 論文の手法を視覚的に表現したい
  - ニューラルネットワークのデータフロー図を描きたい
  - 提案手法のオプション比較を図示したい
  - draw.ioファイル(.drawio)を編集したい
  
  キーワード: アーキテクチャ図、draw.io、drawio、手法図、フロー図、NN図
---

# Architecture Diagram Skill

Draw.io形式（.drawio）でニューラルネットワークや機械学習手法のアーキテクチャ図を作成する。

## 基本構造

```xml
<mxfile host="Electron">
  <diagram id="unique_id" name="ページ-1">
    <mxGraphModel dx="816" dy="706" grid="1" gridSize="10" guides="1" 
                  tooltips="1" connect="1" arrows="1" fold="1" page="1" 
                  pageScale="1" pageWidth="1800" pageHeight="1200" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <!-- 要素をここに追加 -->
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

## 図形パターン

詳細なXMLパターンは [references/patterns.md](references/patterns.md) を参照。

### 1. ベクトル表現（4つの四角形を連結）

1ベクトル = 4つの連結した四角形（d次元を表現）

```xml
<mxCell id="vec_a" style="rounded=0;whiteSpace=wrap;fillColor=#BBDEFB;strokeColor=#1976D2;" value="" vertex="1">
  <mxGeometry height="14" width="10" x="100" y="100" as="geometry" />
</mxCell>
<mxCell id="vec_b" style="rounded=0;whiteSpace=wrap;fillColor=#BBDEFB;strokeColor=#1976D2;" value="" vertex="1">
  <mxGeometry height="14" width="10" x="110" y="100" as="geometry" />
</mxCell>
<!-- x座標を+10ずつずらして4つ配置 -->
```

### 2. エンコーダ（台形、横向き）

```xml
<mxCell style="shape=trapezoid;perimeter=trapezoidPerimeter;whiteSpace=wrap;
               fillColor=#BBDEFB;strokeColor=#1976D2;strokeWidth=2;
               fontStyle=1;fontSize=10;rotation=-90;" 
        value="Query&#xa;Encoder" vertex="1">
  <mxGeometry height="50" width="80" x="320" y="175" as="geometry" />
</mxCell>
```

### 3. Fusion（六角形）

```xml
<mxCell style="shape=hexagon;perimeter=hexagonPerimeter2;whiteSpace=wrap;
               fillColor=#FFCDD2;strokeColor=#C62828;strokeWidth=2;
               fontStyle=1;fontSize=14;size=0.15;" 
        value="Fusion" vertex="1">
  <mxGeometry height="70" width="100" x="770" y="240" as="geometry" />
</mxCell>
```

### 4. 演算（楕円）

```xml
<mxCell style="ellipse;whiteSpace=wrap;fillColor=#A5D6A7;strokeColor=#2E7D32;
               strokeWidth=2;fontStyle=1;fontSize=14;" 
        value="MaxSim" vertex="1">
  <mxGeometry height="55" width="100" x="1260" y="230" as="geometry" />
</mxCell>
```

### 5. 矢印

```xml
<!-- NN I/O: 太い実線 (strokeWidth=4) -->
<mxCell edge="1" style="rounded=0;strokeWidth=4;strokeColor=#1976D2;endArrow=classic;endSize=6;">
  <mxGeometry relative="1" as="geometry">
    <mxPoint x="244" y="200" as="sourcePoint" />
    <mxPoint x="294" y="200" as="targetPoint" />
  </mxGeometry>
</mxCell>

<!-- ステップフロー: 細い破線 (strokeWidth=2, dashed=1) -->
<mxCell edge="1" style="rounded=0;strokeWidth=2;strokeColor=#C62828;endArrow=classic;dashed=1;dashPattern=5 3;">
  <mxGeometry relative="1" as="geometry">
    <mxPoint x="1140" y="270" as="sourcePoint" />
    <mxPoint x="1260" y="255" as="targetPoint" />
  </mxGeometry>
</mxCell>
```

### 6. グループ化（背景ボックス）

```xml
<mxCell style="rounded=1;whiteSpace=wrap;fillColor=#FAFAFA;strokeColor=#E0E0E0;
               strokeWidth=1;dashed=1;" value="" vertex="1">
  <mxGeometry height="340" width="180" x="74" y="120" as="geometry" />
</mxCell>
```

## 色パレット

| 役割 | fillColor | strokeColor | fontColor |
|------|-----------|-------------|-----------|
| Query（青） | #E3F2FD / #BBDEFB | #1976D2 | #1976D2 |
| History（オレンジ） | #FFF3E0 / #FFE0B2 | #F57C00 | #E65100 |
| Profile（紫） | #F3E5F5 / #E1BEE7 | #7B1FA2 | #6A1B9A |
| Personalized（赤） | #FFEBEE / #FFCDD2 | #C62828 | #C62828 |
| Document（緑） | #E8F5E9 / #C8E6C9 | #388E3C / #2E7D32 | #2E7D32 |
| Score（濃緑） | #A5D6A7 | #1B5E20 | #1B5E20 |
| グループ背景 | #FAFAFA | #E0E0E0 | #999999 |

## レイアウト原則

1. **左から右へのフロー**: 入力→エンコーダ→ベクトル→処理→出力
2. **グループ化**: 関連要素をdashed背景ボックスでまとめる
3. **具体例中心**: 抽象的な説明より具体例をメインに配置
4. **オプション並列**: モジュールの選択肢は横に並べて比較

## モジュール詳細の構成

各モジュールの詳細説明は以下の構成:

```
┌─────────────────────────────────────────┐
│ Module Name                              │
├────────────────┬────────────────────────┤
│ Option A       │ Option B               │
│ ┌──┐→[処理]→┌──┐│ ┌──┐→[処理]→┌──┐      │
│ 入力     出力 │ 入力     出力         │
│ 説明          │ 説明                   │
├────────────────┴────────────────────────┤
│ 具体例: ...                             │
│ 参考: 論文名 (会議 年)                  │
└─────────────────────────────────────────┘
```

## 作業フロー

1. 手法ドキュメントを確認してモジュール構成を把握
2. 基本構造（ヘッダー、グループ背景）を作成
3. 入力要素を配置（具体例を含む）
4. エンコーダ、処理モジュールを配置
5. ベクトル表現を追加（4つの四角形×複数行）
6. 矢印で接続（NN I/O=太い、ステップ=破線）
7. モジュール詳細（オプション比較）を下部に追加
8. レジェンドを追加

## 参考

- 詳細パターン: [references/patterns.md](references/patterns.md)
