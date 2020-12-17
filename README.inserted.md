---
title: 四季マニュアル
author: ryu-raptor
---

! [四季\_shiki](./logo.svg)

四季は和欧混文にアキを挿入して簡単なタイポグラフィを実現します．

四季 (shiki) inserts "aki"s in your plain text for typography.

[`README.inserted.md`](README.inserted.md) はテキストを四季で処理したものです．

```
日本語と English が混じった passage は適度なスペース (spaces) を挿入しましょう．
↓
日本語と English が混じった passage は適度なスペース (spaces) を挿入しましょう．
```
:relaxed:

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [はじめに](#%E3%81%AF%E3%81%98%E3%82%81%E3%81%AB)
- [インストール](#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)
- [使い方](#%E4%BD%BF%E3%81%84%E6%96%B9)
- [挿入ルール](#%E6%8C%BF%E5%85%A5%E3%83%AB%E3%83%BC%E3%83%AB)
  - [between ルール](#between-%E3%83%AB%E3%83%BC%E3%83%AB)
  - [before ルール / after ルール](#before-%E3%83%AB%E3%83%BC%E3%83%AB--after-%E3%83%AB%E3%83%BC%E3%83%AB)
    - [before ルール](#before-%E3%83%AB%E3%83%BC%E3%83%AB)
    - [after ルール](#after-%E3%83%AB%E3%83%BC%E3%83%AB)
- [しないこと](#%E3%81%97%E3%81%AA%E3%81%84%E3%81%93%E3%81%A8)
  - [全角約物の前後にアキを入れる](#%E5%85%A8%E8%A7%92%E7%B4%84%E7%89%A9%E3%81%AE%E5%89%8D%E5%BE%8C%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [文末，文頭にアキを入れる](#%E6%96%87%E6%9C%AB%E6%96%87%E9%A0%AD%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [接続約物の前後にアキを入れる](#%E6%8E%A5%E7%B6%9A%E7%B4%84%E7%89%A9%E3%81%AE%E5%89%8D%E5%BE%8C%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [「固有名詞にはアキを入れない」などの特殊ルール](#%E5%9B%BA%E6%9C%89%E5%90%8D%E8%A9%9E%E3%81%AB%E3%81%AF%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E3%81%AA%E3%81%A9%E3%81%AE%E7%89%B9%E6%AE%8A%E3%83%AB%E3%83%BC%E3%83%AB)
- [してしまうこと](#%E3%81%97%E3%81%A6%E3%81%97%E3%81%BE%E3%81%86%E3%81%93%E3%81%A8)
  - [文脈を考えずにアキを入れる](#%E6%96%87%E8%84%88%E3%82%92%E8%80%83%E3%81%88%E3%81%9A%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [アンドゥできない](#%E3%82%A2%E3%83%B3%E3%83%89%E3%82%A5%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84)
- [これからするようになること](#%E3%81%93%E3%82%8C%E3%81%8B%E3%82%89%E3%81%99%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%AA%E3%82%8B%E3%81%93%E3%81%A8)
- [Jekyll で使う](#jekyll-%E3%81%A7%E4%BD%BF%E3%81%86)
- [ライセンス](#%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9)
- [付録](#%E4%BB%98%E9%8C%B2)
  - [和文と欧文の具体的な範囲](#%E5%92%8C%E6%96%87%E3%81%A8%E6%AC%A7%E6%96%87%E3%81%AE%E5%85%B7%E4%BD%93%E7%9A%84%E3%81%AA%E7%AF%84%E5%9B%B2)
  - [アキの入れ方](#%E3%82%A2%E3%82%AD%E3%81%AE%E5%85%A5%E3%82%8C%E6%96%B9)
    - [挿入点候補を列挙](#%E6%8C%BF%E5%85%A5%E7%82%B9%E5%80%99%E8%A3%9C%E3%82%92%E5%88%97%E6%8C%99)
    - [原文を複製しながら挿入点までカーソルを進める](#%E5%8E%9F%E6%96%87%E3%82%92%E8%A4%87%E8%A3%BD%E3%81%97%E3%81%AA%E3%81%8C%E3%82%89%E6%8C%BF%E5%85%A5%E7%82%B9%E3%81%BE%E3%81%A7%E3%82%AB%E3%83%BC%E3%82%BD%E3%83%AB%E3%82%92%E9%80%B2%E3%82%81%E3%82%8B)
    - [文字種を確認して適切な挿入を行う（shiki.insert.insert_aki 関数）](#%E6%96%87%E5%AD%97%E7%A8%AE%E3%82%92%E7%A2%BA%E8%AA%8D%E3%81%97%E3%81%A6%E9%81%A9%E5%88%87%E3%81%AA%E6%8C%BF%E5%85%A5%E3%82%92%E8%A1%8C%E3%81%86shikiinsertinsert_aki-%E9%96%A2%E6%95%B0)
  - [なんで四季？](#%E3%81%AA%E3%82%93%E3%81%A7%E5%9B%9B%E5%AD%A3)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# はじめに
コンピュータで平文テキストを記述する際に欧文と和文の間にスペースを入れる習慣があります．
これは平文として読んだときの見栄えを考えて行われることで，LaTeX のような組版を行うソフトウェアならそのようなアキを自動で挿入します．

スペースの挿入は見栄えやキーワード補完の際に役立ちますが，文意とは関係なく，スタイルと内容を分離するという原則に反します（たとえば，LaTeX はこのようなスペースを内容だと解釈するため，自動アキ挿入に問題が生じます）．

四季はスペースを挿入せずに記述した平文テキストに後で適切にスペースを挿入することでこの問題を解決します．
つまり，書くときにはスペースを入れずに書いて，公開の際に見た目を調整するスペースを入れるといったことができます．

たとえば，Jekyll などのデプロイの際にこの処理を行えば，ローカルの Markdown をスペースクリーンにすることができます．

# インストール
Lua のパッケージマネージャである [luarocks](https://luarocks.org/) を利用してインストールできます．
luarocks がインストールされていれば，Windows/Linux/Mac のいずれでも動くと思います．

```
luarocks install shiki
```

# 使い方
これだけです．

```
aki your_input_plain_text_files ...
```

入力をすべてまとめて変換し，標準出力に結果を出力します．

ファイルに出す場合は`tee`などと組み合わせてください．
```
aki your_input_plain_text_files ... | tee output_file
```

現在エンコーディングは UTF-8 のみサポートしています．

# 挿入ルール
現在の仕様は次のとおりです．

- 和文（ひらがな，カタカナ，漢字）と英語のアルファベット，半角アラビア数字の間にアキを入れる（between ルール）．
- 和文に続く半角横書き句読点，半角約物（後述）に適切なアキを挿入する（before / after ルール）．

以降"`_`"は挿入されるアキを意味します．
アキは現在半角スペースです．

## between ルール
和文と欧文の間にアキを入れます．

```
エンコーディングは UTF-8 のみサポートしています
↓
エンコーディングは_UTF-8_のみサポートしています
```

```
LaTeX はアキを入れてくれます
↓
LaTeX_はアキを入れてくれます
```

## before ルール / after ルール
before ルールに該当するのは
- 開きカッコ

after ルールに該当するのは
- 閉じカッコ
- 句読点類

### before ルール
欧文では開きカッコの前にアキを入れることが慣習とされています．

```
プログラミング (programming)
↓
プログラミング_(programming)
```

### after ルール
欧文では閉じカッコの後にアキを入れることが慣習とされています．

```
プログラミング (programming) とはプログラムを記述することです
↓
プログラミング_(programming)_とはプログラムを記述することです
```

また，カンマ・コロンの後にもアキを入れることが慣習とされています．

```
しかし, そうは行かなかった
↓
しかし,_そうは行かなかった
```

```
LaTeX, もしくは Word で提出してください
↓
LaTeX,_もしくは_Word_で提出してください
```

```
はい. わかりました
↓
はい._わかりました
```

before ルール，after ルールのいずれの場合も，文頭，文末の場合はアキを入れません．

```
(役者 A) 了解しました.
↓
(役者_A)_了解しました.
↓×
_(役者_A)_了解しました._
```

# しないこと
以下は四季が絶対にしないことです．仮にした場合はバグです．

## 全角約物の前後にアキを入れる
全角約物は既に適切なアキが入っているため，アキを入れません．

1. カッコ類
```
有機 EL（ゆうきいーえる）は次世代のディスプレイ素材です
↓
有機_EL（ゆうきいーえる）は次世代のディスプレイ素材です
```

2. 句読点類
```
それはつまり，どういうことだ？
↓
それはつまり，どういうことだ？
```

```
はい．わかりました．
↓
はい．わかりました．
```

## 文末，文頭にアキを入れる
既に述べたとおり，文末と文頭にはアキを入れません．

```
(役者 A) 了解しました.
↓
(役者_A)_了解しました.
↓×
_(役者_A)_了解しました._
```

## 接続約物の前後にアキを入れる
接続約物は垂直線（`|`）やハイフン（`-`）のことを指します．
詳しくは [付録](#和文と欧文の具体的な範囲) の`unicode.range.joint`をご覧ください．
単語を意図的にくっつけるために利用するため，アキを入れるのは不適切だと判断しました．
ただし，スラッシュなどアキを入れるべき例もあるため，何を接続約物とするかは要議論です．

```
接続-テキスト
↓
接続-テキスト
↓×
接続_-_テキスト
```

```
接続|テキスト
↓
接続|テキスト
↓×
接続_|_テキスト
```

次の例は現在のバージョンではアキが入りませんが，将来入れるか選択できるかもしれません．
```
アルファ/ベータ線
↓
アルファ/ベータ線
↓?
アルファ_/_ベータ線
```

「スラッシュ 空白」などで検索をかければ関連する話題が見つかります．
どちらの場合もあるらしいので，選択できるようにするのが良いと（ryu-raptor は）考えています．

## 「固有名詞にはアキを入れない」などの特殊ルール

単純にスペースを挿入します．Microsoft のドキュメントなどでは特殊なルール分けがありますが，四季では対応する予定がありません．
理由として LaTeX の単純な挙動を目標としていることが挙げられます．
ただし，コードブロックではアキを入れない，などといった例外規則は導入するかもしれませんので，それを応用して各自で対応することはできるかもしれません．

# してしまうこと
わかってる範囲で，されると困る挙動を挙げておきます．

## 文脈を考えずにアキを入れる
一番困るのがこの`README.md`のような，あえてスペースを入れない箇所がある文章の場合です．
`README.inserted.md`をご覧になれば分かるようにコードブロックだろうが何だろうがスペースを入れます．

スペースの有無で意味が変わってしまうようなテキストが含まれている場合は事前にどうなるか確認してください．

## アンドゥできない
フォーマッタ全般に言えることですが，不可逆変換です．

**不用意に上書きしないように注意してください．**

差分をとったり，バージョン管理システムで管理することをおすすめします．


# これからするようになること
今は実装していませんが，次のような機能を将来追加する予定です．

- 欧文についてもアキを入れる（現状和文との境界部分しか見ていません）
- UTF-8 以外にも対応
- 他言語バインディング（Ruby など）
- コードブロックなど特殊な箇所での処理の除外
- スペースではなく，任意のマークアップ要素（`<span>`など）で欧文を囲って，後ほど CSS 等で調整できるようにするオプションの追加．
    `aki --enclose '<span class="shiki-aki">'`などを予定

# Jekyll で使う
Jekyll の Generator 機能を使えば，自動的に出力にスペースを挿入できます．
四季は Ruby で書かれていませんので，シェル呼び出しから利用するのが一番簡単だと思います．

WIP

# ライセンス
MIT ライセンスで提供します．

# 付録

## 和文と欧文の具体的な範囲
Unicode standard 13.0 をベースに次のような範囲となっています．これは`shiki/unicode.lua`と`shiki/char-category.lua`で確認できます．
なお，必要に応じてこの範囲は変更される予定です．変更が既存の仕様の拡張とならない場合はメジャーバージョンが上がります．

1. 文字範囲
```lua
---- 文字
-- 基礎ラテン文字
-- http://www.unicode.org/charts/PDF/U0000.pdf
unicode.range.basicLatain   = {{0x41, 0x5a}, {0x61, 0x7a}}
-- 付点つきラテン文字 (Latain-1 supplement)
-- http://www.unicode.org/charts/PDF/U0080.pdf
unicode.range.latain1 = {{0xc0, 0xd6}, {0xd8, 0xf6}, {0xf8, 0xff}}
-- アラビア数字
-- http://www.unicode.org/charts/PDF/U0000.pdf
unicode.range.arabicNumeric = {{0x30, 0x39}}

-- ひらがな
-- http://www.unicode.org/charts/PDF/U3040.pdf
unicode.range.hiragana = {{0x3040, 0x309f}}
-- カタカナ
-- http://www.unicode.org/charts/PDF/U30A0.pdf
unicode.range.katakana = {{0x30a0, 0x30ff}}
-- 漢字
-- http://www.unicode.org/charts/PDF/U4E00.pdf
unicode.range.kanji = {{0x4e00, 0x9fcf}}

---- 約物
-- http://www.unicode.org/charts/PDF/U0000.pdf
-- 開きカッコ類
unicode.range.openBracket   = {0x28, 0x5b, 0x7b}
-- 閉じカッコ類
unicode.range.closeBracket  = {0x29, 0x5d, 0x7d}
-- 句読点類
unicode.range.punctuation   = {0x2c, 0x2e, 0x7d}
-- スラッシュ類 (/|)
unicode.range.separator     = {0x2f, 0x7c}
-- 空白類 (SP, EOF, etc...)
unicode.range.space         = {{0x00, 0x20}}

-- 接続約物（ハイフン，アンダースコア）
unicode.range.joint         = {{0x23, 0x26}, 0x2d, 0x5f}
```

2. 和文文字か欧文文字か約物か

```lua
shiki.category.wabun = unicode.mix_range(
    unicode.range.hiragana,
    unicode.range.katakana,
    unicode.range.kanji
)

local yakumono = unicode.mix_range(
    unicode.range.openBracket,
    unicode.range.closeBracket,
    unicode.range.punctuation,
    unicode.range.separator,
    unicode.range.space,
    unicode.range.joint
)

shiki.category.oubun = unicode.mix_range(
    unicode.range.basicLatain,
    unicode.range.latain1,
    unicode.range.arabicNumeric,
    yakumono
)
```
## アキの入れ方
現在の挿入プロセスは次のようになっています．

1. 挿入点候補を列挙
2. 原文を複製しながら挿入点までカーソルを進める
3. 文字種を確認して適切な挿入を行う
4. 2 と 3 を繰り返す．

### 挿入点候補を列挙
和文とそれ以外の境界点を取り敢えず全部列挙します．

たとえば
```
この文章 (passage) は (じつは) 和文が含まれている.
```

なら，つぎの`|`が挿入点候補です．
```
この文章|(passage)|は|(|じつは|)|和文が含まれている|.
```

割とたくさんあります．正直無駄だと思ってるので今後改善していきたいです．

### 原文を複製しながら挿入点までカーソルを進める
原文を結果に複製していきますが，挿入点の次の文字で止まります．

```
この文章|(passage)|は|(|じつは|)|和文が含まれている|.
```
なら，一番はじめの` (`を複製せずに次のステップに行きます．

### 文字種を確認して適切な挿入を行う（shiki.insert.insert_aki 関数）
アキを入れるか入れないかを判断します．

挿入点の前後の文字を pre, post とすると，次のように判定します．

| 挿入ルール    | 判定方法                 |
|---------------|--------------------------|
| between ルール | pre, post とも between 文字 |
| before ルール  | post が before 文字         |
| after ルール   | pre が after 文字           |

between 文字，before 文字，after 文字は次のようになっています（`shiki/inserter.lua`より抜粋）．

```lua
local rule = {
    before = unicode.mix_range(
        unicode.range.openBracket
    ),
    after = unicode.mix_range(
        unicode.range.closeBracket,
        unicode.range.punctuation
    ),
    between = unicode.mix_range(
        shiki.category.wabun,
        unicode.range.basicLatain,
        unicode.range.latain1,
        unicode.range.arabicNumeric
    )
}
```

挿入ルールのいずれかにマッチした場合
アキ文字 + post
を結果に複製します．そうでなければ単に post を複製します．

## なんで四季？
最近，秋を感じられる期間が短くなってる気がしませんか？
春夏冬みたいな...

アキを入れると四季になるためです．
