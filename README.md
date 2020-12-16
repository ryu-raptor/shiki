---
title: 四季マニュアル
author: ryu-raptor
---

四季(shiki) inserts "aki"s in your plain text for typography.

四季は和欧混文にアキを挿入して簡単なタイポグラフィを実現します．

[`README.inserted.md`](README.inserted.md)はテキストを四季で処理したものです．

# はじめに
コンピュータで平文テキストを記述する際に欧文と和文の間にスペースを入れる習慣があります．
これは平文として読んだときの見栄えを考えて行われることで，LaTeXのような組版を行うソフトウェアならそのようなアキを自動で挿入します．

スペースの挿入は見栄えやキーワード補完の際に役立ちますが，文意とは関係なく，スタイルと内容を分離するという原則に反します（たとえば，LaTeXはこのようなスペースを内容だと解釈するため，自動アキ挿入に問題が生じます）．

四季はスペースを挿入せずに記述した平文テキストに後で適切にスペースを挿入することでこの問題を解決します．
つまり，書くときにはスペースを入れずに書いて，公開の際に見た目を調整するスペースを入れるといったことができます．

たとえば，Jekyllなどのデプロイの際にこの処理を行えば，ローカルのMarkdownをスペースクリーンにすることができます．

# インストール
Luaのパッケージマネージャである[luarocks](https://luarocks.org/)を利用してインストールできます．
luarocksがインストールされていれば，Windows/Linux/Macのいずれでも動くと思います．

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

現在エンコーディングはUTF-8のみサポートしています．

# 挿入ルール
現在の仕様は次のとおりです．

- 和文（ひらがな，カタカナ，漢字）と英語のアルファベット，半角アラビア数字の間にアキを入れる（betweenルール）．
- 和文に続く半角横書き句読点，半角約物（後述）に適切なアキを挿入する（before / afterルール）．

以降"`_`"は挿入されるアキを意味します．
アキは現在半角スペースです．

## betweenルール
和文と欧文の間にアキを入れます．

```
エンコーディングはUTF-8のみサポートしています
↓
エンコーディングは_UTF-8_のみサポートしています
```

```
LaTeXはアキを入れてくれます
↓
LaTeX_はアキを入れてくれます
```

## beforeルール / afterルール
beforeルールに該当するのは
- 開きカッコ

afterルールに該当するのは
- 閉じカッコ
- 句読点類

### beforeルール
欧文では開きカッコの前にアキを入れることが慣習とされています．

```
プログラミング(programming)
↓
プログラミング_(programming)
```

### afterルール
欧文では閉じカッコの後にアキを入れることが慣習とされています．

```
プログラミング(programming)とはプログラムを記述することです
↓
プログラミング_(programming)_とはプログラムを記述することです
```

また，カンマ・コロンの後にもアキを入れることが慣習とされています．

```
しかし,そうは行かなかった
↓
しかし,_そうは行かなかった
```

```
LaTeX,もしくはWordで提出してください
↓
LaTeX,_もしくは_Word_で提出してください
```

```
はい.わかりました
↓
はい._わかりました
```

beforeルール，afterルールのいずれの場合も，文頭，文末の場合はアキを入れません．

```
(役者A)了解しました.
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
有機EL（ゆうきいーえる）は次世代のディスプレイ素材です
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
(役者A)了解しました.
↓
(役者_A)_了解しました.
↓×
_(役者_A)_了解しました._
```

## 「固有名詞などにはアキを入れない」などの特殊ルール

単純にスペースを挿入します．Microsoftのドキュメントなどでは特殊なルール分けがありますが，四季では対応する予定がありません．
理由としてLaTeXの単純な挙動を目標としていることが挙げられます．
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
- UTF-8以外にも対応
- 他言語バインディング（Rubyなど）
- コードブロックなど特殊な箇所での処理の除外
- スペースではなく，任意のマークアップ要素（`<span>`など）で欧文を囲って，後ほどCSS等で調整できるようにするオプションの追加．
    `aki --enclose '<span class="shiki-aki">'`などを予定

# Jekyllで使う
JekyllのGenerator機能を使えば，自動的に出力にスペースを挿入できます．
四季はRubyで書かれていませんので，シェル呼び出しから利用するのが一番簡単だと思います．

WIP

# ライセンス
MITライセンスで提供します．

# 付録

## 和文と欧文の具体的な範囲
Unicode standard 13.0をベースに次のような範囲となっています．これは`shiki/unicode.lua`と`shiki/char-category.lua`で確認できます．
なお，必要に応じてこの範囲は変更される予定です．変更が既存の仕様の拡張とならない場合はメジャーバージョンが上がります．

1. 文字範囲
```lua
---- 文字
-- 基礎ラテン文字
-- http://www.unicode.org/charts/PDF/U0000.pdf
unicode.range.basicLatain   = {{0x41, 0x5a}, {0x61, 0x7a}}
-- 付点つきラテン文字(Latain-1 supplement)
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
-- スラッシュ類(/|)
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
4. 2と3を繰り返す．

### 挿入点候補を列挙
和文とそれ以外の境界点を取り敢えず全部列挙します．

たとえば
```
この文章(passage)は(じつは)和文が含まれている.
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
なら，一番はじめの`(`を複製せずに次のステップに行きます．

### 文字種を確認して適切な挿入を行う（shiki.insert.insert_aki関数）
アキを入れるか入れないかを判断します．

挿入点の前後の文字をpre, postとすると，次のように判定します．

| 挿入ルール    | 判定方法                 |
|---------------|--------------------------|
| betweenルール | pre, postともbetween文字 |
| beforeルール  | postがbefore文字         |
| afterルール   | preがafter文字           |

between文字，before文字，after文字は次のようになっています（`shiki/inserter.lua`より抜粋）．

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
を結果に複製します．そうでなければ単にpostを複製します．
