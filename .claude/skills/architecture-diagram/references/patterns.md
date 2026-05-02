# Draw.io XMLパターン集

## 目次

1. [ファイル構造](#ファイル構造)
2. [ベクトル表現](#ベクトル表現)
3. [エンコーダ](#エンコーダ)
4. [Fusion](#fusion)
5. [演算](#演算)
6. [矢印](#矢印)
7. [グループ化](#グループ化)
8. [テキスト](#テキスト)
9. [入力ボックス](#入力ボックス)
10. [モジュール詳細](#モジュール詳細)
11. [レジェンド](#レジェンド)

---

## ファイル構造

```xml
<mxfile host="Electron">
  <diagram id="_8QsDT3_Oz7wI_t7yGac" name="ページ-1">
    <mxGraphModel dx="816" dy="706" grid="1" gridSize="10" guides="1" 
                  tooltips="1" connect="1" arrows="1" fold="1" page="1" 
                  pageScale="1" pageWidth="1800" pageHeight="1200" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        
        <!-- すべての要素はparent="1"で追加 -->
        
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

---

## ベクトル表現

### 基本: 1ベクトル（4つの四角形）

```xml
<!-- ベクトル1つ = 4つの連結した四角形 -->
<mxCell id="vec_q1_a" parent="1" style="rounded=0;whiteSpace=wrap;fillColor=#BBDEFB;strokeColor=#1976D2;" value="" vertex="1">
  <mxGeometry height="14" width="10" x="520" y="175" as="geometry" />
</mxCell>
<mxCell id="vec_q1_b" parent="1" style="rounded=0;whiteSpace=wrap;fillColor=#BBDEFB;strokeColor=#1976D2;" value="" vertex="1">
  <mxGeometry height="14" width="10" x="530" y="175" as="geometry" />
</mxCell>
<mxCell id="vec_q1_c" parent="1" style="rounded=0;whiteSpace=wrap;fillColor=#BBDEFB;strokeColor=#1976D2;" value="" vertex="1">
  <mxGeometry height="14" width="10" x="540" y="175" as="geometry" />
</mxCell>
<mxCell id="vec_q1_d" parent="1" style="rounded=0;whiteSpace=wrap;fillColor=#BBDEFB;strokeColor=#1976D2;" value="" vertex="1">
  <mxGeometry height="14" width="10" x="550" y="175" as="geometry" />
</mxCell>
<!-- ラベル -->
<mxCell id="vec_q1_label" parent="1" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;fontSize=9;fontColor=#1976D2;" value="東京" vertex="1">
  <mxGeometry height="14" width="50" x="568" y="173" as="geometry" />
</mxCell>
```

### ベクトル群（複数行）

```xml
<!-- 行1 -->
<mxCell id="vec_q1_a" ... y="175" />
<!-- 行2: y座標を+22 -->
<mxCell id="vec_q2_a" ... y="197" />
<!-- 行3: y座標を+22 -->
<mxCell id="vec_q3_a" ... y="219" />
```

### サイズバリエーション

| サイズ | height | width | 用途 |
|--------|--------|-------|------|
| 標準 | 14 | 10 | メインフロー |
| 小 | 12 | 8 | モジュール詳細 |
| 極小 | 10 | 6 | オプション比較 |

---

## エンコーダ

### 台形（横向き、rotation=-90）

```xml
<mxCell id="enc_query" parent="1" 
        style="shape=trapezoid;perimeter=trapezoidPerimeter;whiteSpace=wrap;
               fillColor=#BBDEFB;strokeColor=#1976D2;strokeWidth=2;
               fontStyle=1;fontSize=10;rotation=-90;" 
        value="Query&#xa;Encoder" vertex="1">
  <mxGeometry height="50" width="80" x="320" y="175" as="geometry" />
</mxCell>
```

### 色別エンコーダ

| 種類 | fillColor | strokeColor |
|------|-----------|-------------|
| Query | #BBDEFB | #1976D2 |
| History | #FFE0B2 | #F57C00 |
| Profile | #E1BEE7 | #7B1FA2 |
| Document | #C8E6C9 | #388E3C |

### 小さいエンコーダ（モジュール詳細用）

```xml
<mxCell style="shape=trapezoid;perimeter=trapezoidPerimeter;whiteSpace=wrap;
               fillColor=#FFE0B2;strokeColor=#F57C00;strokeWidth=2;
               fontStyle=1;fontSize=8;rotation=-90;" 
        value="Mamba" vertex="1">
  <mxGeometry height="40" width="50" x="432" y="758" as="geometry" />
</mxCell>
```

---

## Fusion

### 六角形

```xml
<mxCell id="fusion" parent="1" 
        style="shape=hexagon;perimeter=hexagonPerimeter2;whiteSpace=wrap;
               fillColor=#FFCDD2;strokeColor=#C62828;strokeWidth=2;
               fontStyle=1;fontSize=14;size=0.15;" 
        value="Fusion" vertex="1">
  <mxGeometry height="70" width="100" x="770" y="240" as="geometry" />
</mxCell>
```

### 小さい六角形（モジュール詳細用）

```xml
<mxCell style="shape=hexagon;perimeter=hexagonPerimeter2;whiteSpace=wrap;
               fillColor=#FFCDD2;strokeColor=#C62828;strokeWidth=2;
               fontStyle=1;fontSize=7;size=0.15;" 
        value="Cross-Attn" vertex="1">
  <mxGeometry height="40" width="55" x="715" y="758" as="geometry" />
</mxCell>
```

---

## 演算

### 楕円（MaxSim等）

```xml
<mxCell id="maxsim" parent="1" 
        style="ellipse;whiteSpace=wrap;fillColor=#A5D6A7;strokeColor=#2E7D32;
               strokeWidth=2;fontStyle=1;fontSize=14;" 
        value="MaxSim" vertex="1">
  <mxGeometry height="55" width="100" x="1260" y="230" as="geometry" />
</mxCell>
```

### スコア出力（楕円）

```xml
<mxCell id="output_score" parent="1" 
        style="ellipse;whiteSpace=wrap;fillColor=#C8E6C9;strokeColor=#1B5E20;
               strokeWidth=3;fontStyle=1;fontSize=14;" 
        value="Score" vertex="1">
  <mxGeometry height="55" width="100" x="1260" y="350" as="geometry" />
</mxCell>
```

### 小さい楕円（モジュール詳細用）

```xml
<mxCell style="ellipse;whiteSpace=wrap;fillColor=#A5D6A7;strokeColor=#2E7D32;
               strokeWidth=2;fontSize=7;fontStyle=1;fontColor=#1B5E20;" 
        value="MaxSim" vertex="1">
  <mxGeometry height="28" width="40" x="1285" y="754" as="geometry" />
</mxCell>
```

---

## 矢印

### NN I/O（太い実線）

```xml
<mxCell id="arr_q_enc" edge="1" parent="1" 
        style="rounded=0;strokeWidth=4;strokeColor=#1976D2;endArrow=classic;endSize=6;">
  <mxGeometry relative="1" as="geometry">
    <mxPoint x="244" y="200" as="sourcePoint" />
    <mxPoint x="294" y="200" as="targetPoint" />
  </mxGeometry>
</mxCell>
```

### ステップフロー（細い破線）

```xml
<mxCell id="arr_step" edge="1" parent="1" 
        style="rounded=0;strokeWidth=2;strokeColor=#C62828;endArrow=classic;dashed=1;dashPattern=5 3;">
  <mxGeometry relative="1" as="geometry">
    <mxPoint x="1140" y="270" as="sourcePoint" />
    <mxPoint x="1260" y="255" as="targetPoint" />
  </mxGeometry>
</mxCell>
```

### 曲がる矢印（経由点あり）

```xml
<mxCell edge="1" style="rounded=0;strokeWidth=4;strokeColor=#1976D2;endArrow=classic;endSize=6;">
  <mxGeometry relative="1" as="geometry">
    <Array as="points">
      <mxPoint x="700" y="200" />
      <mxPoint x="700" y="260" />
    </Array>
    <mxPoint x="660" y="200" as="sourcePoint" />
    <mxPoint x="760" y="260" as="targetPoint" />
  </mxGeometry>
</mxCell>
```

### 矢印スタイル比較

| 種類 | strokeWidth | dashed | 用途 |
|------|-------------|--------|------|
| NN I/O | 4 | なし | データ入出力 |
| ステップ | 2 | 5 3 | 処理フロー |
| 詳細内 | 3 | なし | モジュール詳細 |

---

## グループ化

### 背景ボックス

```xml
<mxCell id="group_input_bg" parent="1" 
        style="rounded=1;whiteSpace=wrap;fillColor=#FAFAFA;strokeColor=#E0E0E0;
               strokeWidth=1;dashed=1;" 
        value="" vertex="1">
  <mxGeometry height="340" width="180" x="74" y="120" as="geometry" />
</mxCell>
```

### グループラベル

```xml
<mxCell id="group_input_label" parent="1" 
        style="text;html=1;strokeColor=none;fillColor=none;align=center;
               verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#999999;" 
        value="User Inputs" vertex="1">
  <mxGeometry height="18" width="100" x="114" y="125" as="geometry" />
</mxCell>
```

### オプション領域（モジュール詳細内）

```xml
<mxCell style="rounded=1;whiteSpace=wrap;fillColor=#FFF3E0;strokeColor=#FFB74D;
               strokeWidth=1;dashed=1;" value="" vertex="1">
  <mxGeometry height="120" width="250" x="55" y="720" as="geometry" />
</mxCell>
```

---

## テキスト

### タイトル

```xml
<mxCell id="title" parent="1" 
        style="text;html=1;strokeColor=none;fillColor=none;align=center;
               verticalAlign=middle;fontSize=28;fontStyle=1;" 
        value="PersonalizedColBERT Architecture" vertex="1">
  <mxGeometry height="40" width="500" x="550" y="30" as="geometry" />
</mxCell>
```

### サブタイトル

```xml
<mxCell id="subtitle" parent="1" 
        style="text;html=1;strokeColor=none;fillColor=none;align=center;
               verticalAlign=middle;fontSize=14;fontStyle=2;fontColor=#666666;" 
        value="Example: Hotel Search for a Business Traveler" vertex="1">
  <mxGeometry height="25" width="500" x="550" y="70" as="geometry" />
</mxCell>
```

### ラベル（小）

```xml
<mxCell style="text;html=1;strokeColor=none;fillColor=none;align=left;
               verticalAlign=middle;fontSize=10;fontStyle=1;fontColor=#1976D2;" 
        value="Query" vertex="1">
  <mxGeometry height="16" width="50" x="89" y="150" as="geometry" />
</mxCell>
```

---

## 入力ボックス

### 自由記述入力

```xml
<mxCell style="rounded=1;whiteSpace=wrap;fillColor=#E3F2FD;strokeColor=#1976D2;
               strokeWidth=2;fontSize=11;" 
        value="「東京 出張」" vertex="1">
  <mxGeometry height="28" width="150" x="89" y="168" as="geometry" />
</mxCell>
```

### Facetタグ

```xml
<mxCell style="rounded=1;whiteSpace=wrap;fillColor=#BBDEFB;strokeColor=#1976D2;fontSize=9;" 
        value="5/15 1泊" vertex="1">
  <mxGeometry height="18" width="55" x="89" y="214" as="geometry" />
</mxCell>
```

### リスト入力（履歴等）

```xml
<mxCell style="rounded=1;whiteSpace=wrap;fillColor=#FFF3E0;strokeColor=#F57C00;strokeWidth=2;" 
        value="" vertex="1">
  <mxGeometry height="65" width="150" x="89" y="266" as="geometry" />
</mxCell>
<!-- リスト項目 -->
<mxCell style="text;html=1;strokeColor=none;fillColor=none;align=left;
               verticalAlign=middle;fontSize=10;fontColor=#E65100;" 
        value="アパホテル新宿" vertex="1">
  <mxGeometry height="16" width="130" x="99" y="272" as="geometry" />
</mxCell>
```

---

## モジュール詳細

### 全体構造

```xml
<!-- 背景 -->
<mxCell id="detail_hist_bg" parent="1" 
        style="rounded=1;whiteSpace=wrap;fillColor=#FFF8E1;strokeColor=#F57C00;strokeWidth=2;" 
        value="" vertex="1">
  <mxGeometry height="280" width="540" x="40" y="680" as="geometry" />
</mxCell>

<!-- タイトル -->
<mxCell id="detail_hist_title" parent="1" 
        style="text;html=1;strokeColor=none;fillColor=none;align=left;
               verticalAlign=middle;fontSize=14;fontStyle=1;fontColor=#F57C00;" 
        value="History Encoder" vertex="1">
  <mxGeometry height="22" width="150" x="55" y="690" as="geometry" />
</mxCell>

<!-- オプションA/B背景 -->
<mxCell style="rounded=1;whiteSpace=wrap;fillColor=#FFF3E0;strokeColor=#FFB74D;
               strokeWidth=1;dashed=1;" value="" vertex="1">
  <mxGeometry height="120" width="250" x="55" y="720" as="geometry" />
</mxCell>

<!-- 具体例セクション -->
<mxCell style="text;html=1;strokeColor=none;fillColor=none;align=left;
               verticalAlign=middle;fontSize=10;fontStyle=1;fontColor=#F57C00;" 
        value="具体例: ビジネスホテル好みユーザー" vertex="1">
  <mxGeometry height="16" width="220" x="55" y="850" as="geometry" />
</mxCell>

<!-- 参考文献 -->
<mxCell style="text;html=1;strokeColor=none;fillColor=none;align=left;
               verticalAlign=middle;fontSize=8;fontColor=#BDBDBD;fontStyle=2;" 
        value="参考: Mamba4Rec (KDD 2024)" vertex="1">
  <mxGeometry height="14" width="160" x="55" y="910" as="geometry" />
</mxCell>
```

---

## レジェンド

```xml
<!-- 背景 -->
<mxCell id="legend_bg" parent="1" 
        style="rounded=1;whiteSpace=wrap;fillColor=#FAFAFA;strokeColor=#BDBDBD;strokeWidth=1;" 
        value="" vertex="1">
  <mxGeometry height="240" width="180" x="1450" y="120" as="geometry" />
</mxCell>

<!-- タイトル -->
<mxCell id="legend_title" parent="1" 
        style="text;html=1;strokeColor=none;fillColor=none;align=center;
               verticalAlign=middle;fontSize=13;fontStyle=1;" 
        value="Legend" vertex="1">
  <mxGeometry height="22" width="80" x="1500" y="130" as="geometry" />
</mxCell>

<!-- 要素例: エンコーダ -->
<mxCell style="shape=trapezoid;perimeter=trapezoidPerimeter;whiteSpace=wrap;
               fillColor=#E0E0E0;strokeColor=#757575;rotation=-90;" value="" vertex="1">
  <mxGeometry height="28" width="40" x="1468" y="162" as="geometry" />
</mxCell>
<mxCell style="text;html=1;strokeColor=none;fillColor=none;align=left;
               verticalAlign=middle;fontSize=11;fontColor=#666666;" 
        value="Encoder" vertex="1">
  <mxGeometry height="18" width="70" x="1520" y="166" as="geometry" />
</mxCell>

<!-- 要素例: ベクトル -->
<mxCell style="rounded=0;whiteSpace=wrap;fillColor=#E0E0E0;strokeColor=#757575;" value="" vertex="1">
  <mxGeometry height="14" width="10" x="1468" y="206" as="geometry" />
</mxCell>
<!-- 4つ並べる -->

<!-- 矢印例 -->
<mxCell edge="1" style="strokeWidth=4;strokeColor=#757575;endArrow=classic;endSize=6;">
  <mxGeometry relative="1" as="geometry">
    <mxPoint x="1468" y="318" as="sourcePoint" />
    <mxPoint x="1508" y="318" as="targetPoint" />
  </mxGeometry>
</mxCell>
<mxCell style="text;html=1;..." value="NN I/O" vertex="1">
  <mxGeometry ... />
</mxCell>
```

---

## 色パレット詳細

### Query（青系）

| 用途 | fillColor | strokeColor |
|------|-----------|-------------|
| 薄い背景 | #E3F2FD | #1976D2 |
| 通常 | #BBDEFB | #1976D2 |
| fontColor | - | #1976D2 |

### History（オレンジ系）

| 用途 | fillColor | strokeColor |
|------|-----------|-------------|
| 薄い背景 | #FFF3E0 | #F57C00 |
| 通常 | #FFE0B2 | #F57C00 |
| fontColor | - | #E65100 |

### Profile（紫系）

| 用途 | fillColor | strokeColor |
|------|-----------|-------------|
| 薄い背景 | #F3E5F5 | #7B1FA2 |
| 通常 | #E1BEE7 | #7B1FA2 |
| fontColor | - | #6A1B9A |

### Personalized（赤系）

| 用途 | fillColor | strokeColor |
|------|-----------|-------------|
| 薄い背景 | #FFEBEE | #C62828 |
| 通常 | #FFCDD2 | #C62828 |
| fontColor | - | #C62828 |

### Document/Score（緑系）

| 用途 | fillColor | strokeColor |
|------|-----------|-------------|
| 薄い背景 | #E8F5E9 | #388E3C |
| 通常 | #C8E6C9 | #388E3C |
| 濃い | #A5D6A7 | #2E7D32 |
| スコア | #A5D6A7 | #1B5E20 |
| fontColor | - | #2E7D32 / #1B5E20 |

### グループ/背景

| 用途 | fillColor | strokeColor |
|------|-----------|-------------|
| 背景 | #FAFAFA | #E0E0E0 |
| fontColor | - | #999999 |
