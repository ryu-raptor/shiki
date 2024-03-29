---
title: 四季マニュアル
author: ryu-raptor
---

![四季\_shiki](./logo.svg)

四季は和欧混文にアキを挿入して簡単なタイポグラフィを実現します．

四季(shiki) inserts "aki"s in your plain text for typography.

[`README.inserted.md`](README.inserted.md)はテキストを四季で処理したものです．

```
日本語とEnglishが混じったpassageは適度なスペース(spaces)を挿入しましょう．
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
  - [処理の除外](#%E5%87%A6%E7%90%86%E3%81%AE%E9%99%A4%E5%A4%96)
    - [除外の設定](#%E9%99%A4%E5%A4%96%E3%81%AE%E8%A8%AD%E5%AE%9A)
- [挿入ルール](#%E6%8C%BF%E5%85%A5%E3%83%AB%E3%83%BC%E3%83%AB)
  - [betweenルール](#between%E3%83%AB%E3%83%BC%E3%83%AB)
  - [beforeルール / afterルール](#before%E3%83%AB%E3%83%BC%E3%83%AB--after%E3%83%AB%E3%83%BC%E3%83%AB)
    - [beforeルール](#before%E3%83%AB%E3%83%BC%E3%83%AB)
    - [afterルール](#after%E3%83%AB%E3%83%BC%E3%83%AB)
- [しないこと](#%E3%81%97%E3%81%AA%E3%81%84%E3%81%93%E3%81%A8)
  - [全角約物の前後にアキを入れる](#%E5%85%A8%E8%A7%92%E7%B4%84%E7%89%A9%E3%81%AE%E5%89%8D%E5%BE%8C%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [文末，文頭にアキを入れる](#%E6%96%87%E6%9C%AB%E6%96%87%E9%A0%AD%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [接続約物の前後にアキを入れる](#%E6%8E%A5%E7%B6%9A%E7%B4%84%E7%89%A9%E3%81%AE%E5%89%8D%E5%BE%8C%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [「固有名詞にはアキを入れない」などの特殊ルール](#%E5%9B%BA%E6%9C%89%E5%90%8D%E8%A9%9E%E3%81%AB%E3%81%AF%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E3%81%AA%E3%81%A9%E3%81%AE%E7%89%B9%E6%AE%8A%E3%83%AB%E3%83%BC%E3%83%AB)
- [してしまうこと](#%E3%81%97%E3%81%A6%E3%81%97%E3%81%BE%E3%81%86%E3%81%93%E3%81%A8)
  - [文脈を考えずにアキを入れる](#%E6%96%87%E8%84%88%E3%82%92%E8%80%83%E3%81%88%E3%81%9A%E3%81%AB%E3%82%A2%E3%82%AD%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B)
  - [アンドゥできない](#%E3%82%A2%E3%83%B3%E3%83%89%E3%82%A5%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84)
- [これからするようになること](#%E3%81%93%E3%82%8C%E3%81%8B%E3%82%89%E3%81%99%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%AA%E3%82%8B%E3%81%93%E3%81%A8)
- [Jekyllで使う](#jekyll%E3%81%A7%E4%BD%BF%E3%81%86)
- [ライセンス](#%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9)
- [付録](#%E4%BB%98%E9%8C%B2)
  - [挿入ルールチートシート](#%E6%8C%BF%E5%85%A5%E3%83%AB%E3%83%BC%E3%83%AB%E3%83%81%E3%83%BC%E3%83%88%E3%82%B7%E3%83%BC%E3%83%88)
    - [カッコ類](#%E3%82%AB%E3%83%83%E3%82%B3%E9%A1%9E)
    - [句読点類](#%E5%8F%A5%E8%AA%AD%E7%82%B9%E9%A1%9E)
  - [和文と欧文の具体的な範囲](#%E5%92%8C%E6%96%87%E3%81%A8%E6%AC%A7%E6%96%87%E3%81%AE%E5%85%B7%E4%BD%93%E7%9A%84%E3%81%AA%E7%AF%84%E5%9B%B2)
  - [アキの入れ方](#%E3%82%A2%E3%82%AD%E3%81%AE%E5%85%A5%E3%82%8C%E6%96%B9)
    - [挿入点候補を列挙](#%E6%8C%BF%E5%85%A5%E7%82%B9%E5%80%99%E8%A3%9C%E3%82%92%E5%88%97%E6%8C%99)
    - [原文を複製しながら挿入点までカーソルを進める](#%E5%8E%9F%E6%96%87%E3%82%92%E8%A4%87%E8%A3%BD%E3%81%97%E3%81%AA%E3%81%8C%E3%82%89%E6%8C%BF%E5%85%A5%E7%82%B9%E3%81%BE%E3%81%A7%E3%82%AB%E3%83%BC%E3%82%BD%E3%83%AB%E3%82%92%E9%80%B2%E3%82%81%E3%82%8B)
    - [文字種を確認して適切な挿入を行う（shiki.insert.insert_aki関数）](#%E6%96%87%E5%AD%97%E7%A8%AE%E3%82%92%E7%A2%BA%E8%AA%8D%E3%81%97%E3%81%A6%E9%81%A9%E5%88%87%E3%81%AA%E6%8C%BF%E5%85%A5%E3%82%92%E8%A1%8C%E3%81%86shikiinsertinsert_aki%E9%96%A2%E6%95%B0)
  - [「なんでうまく行くの」集](#%E3%81%AA%E3%82%93%E3%81%A7%E3%81%86%E3%81%BE%E3%81%8F%E8%A1%8C%E3%81%8F%E3%81%AE%E9%9B%86)
    - [なんで改行文字の後のカッコ類に空白が入らないの？](#%E3%81%AA%E3%82%93%E3%81%A7%E6%94%B9%E8%A1%8C%E6%96%87%E5%AD%97%E3%81%AE%E5%BE%8C%E3%81%AE%E3%82%AB%E3%83%83%E3%82%B3%E9%A1%9E%E3%81%AB%E7%A9%BA%E7%99%BD%E3%81%8C%E5%85%A5%E3%82%89%E3%81%AA%E3%81%84%E3%81%AE)
    - [なんで半角3点リーダに空白が入らないの？](#%E3%81%AA%E3%82%93%E3%81%A7%E5%8D%8A%E8%A7%923%E7%82%B9%E3%83%AA%E3%83%BC%E3%83%80%E3%81%AB%E7%A9%BA%E7%99%BD%E3%81%8C%E5%85%A5%E3%82%89%E3%81%AA%E3%81%84%E3%81%AE)
  - [なんで四季？](#%E3%81%AA%E3%82%93%E3%81%A7%E5%9B%9B%E5%AD%A3)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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

バージョン1.3-0は[lyaml](https://github.com/gvvaughan/lyaml)というCのコンパイルが必要なライブラリを利用していますので，Windowsではコンパイラのインストールが必要です．
バージョン1.3-1からCを用いていない[lua-yaml](https://luarocks.org/modules/dominicletz/lua-yaml)に変更したため，コンパイラを導入できない場合はこちらをご利用ください．ただし，lua-yamlはYAML仕様に準拠していないため，サンプルの設定ファイルのようにインデントをしっかり入れてください．

- 最新版をインストールする場合
```
luarocks install shiki
```

- バージョン1.3-0をインストールする場合
```
luarocks install shiki 1.3-0
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

バージョン`1.1-0`から`-o`/`--output`オプションでファイルに直接出力できます．
```
aki your_input_plain_text_files ... -o output_file
aki your_input_plain_text_files ... --output output_file
```

現在エンコーディングはUTF-8のみサポートしています．

## 処理の除外
コード領域やコメント領域などスペースを勝手に入れられると困る場合があります．
バージョン1.3から処理を除外できる機能が追加されました．

`-e`/`--escape`オプションで利用できます．
```
aki --escape <file> ...
aki -e       <file> ...
```

デフォルトでは以下の記述を除外します．

| 始まり（begin）                    | 終わり（end）                      | 備考                               |
|------------------------------------|------------------------------------|------------------------------------|
| `<pre>`                            | `</pre>`                           | HTMLの非フォーマット領域           |
| `<code>`                           | `</code>`                          | HTMLのコード領域                   |
| <code>&grave;&grave;&grave;</code> | <code>&grave;&grave;&grave;</code> | pandocのコードフェンス             |
| <code>&grave;&grave;</code>        | <code>&grave;&grave;</code>        | pandocのエスケープインラインコード |
| <code>&grave;</code>               | <code>&grave;</code>               | pandocのインラインコード           |
| `<!--`                             | `-->`                              | HTMLのコメント領域                 |

ただし，各フォーマットのパーサではないので複雑なケースには対応できません．ご注意ください．

（例：`` ` ``の中に`` ` ``を入れる，`<pre>`の中にエスケープしていない`<pre>`が入っている，バックスラッシュでエスケープするなど）

バックスラッシュのエスケープは正規表現を実装でき次第利用できると思います．

### 除外の設定
YAMLで記述した設定ファイルを利用できます．

`-c`/`--escape-config`オプションで指定します．指定された場合は`--escape`オプションが指定されたように振る舞います．

スキーマは次のとおりです
```
type: array
items:
    type: object
    properties:
        begin:
            type:
                - string
                - array
        end:
            type:
                - string
                - array
```

例
```
- begin: <pre>
  end: </pre>
- begin: <code>
  end: </code>
- begin: <!--
  end: -->
```

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

## 接続約物の前後にアキを入れる
接続約物は垂直線（`|`）やハイフン（`-`）のことを指します．
詳しくは[付録](#和文と欧文の具体的な範囲)の`unicode.range.joint`をご覧ください．
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
どちらの場合もあるらしいので，選択できるようにするのが良いと（ryu-raptorは）考えています．

## 「固有名詞にはアキを入れない」などの特殊ルール

単純にスペースを挿入します．Microsoftのドキュメントなどでは特殊なルール分けがありますが，四季では対応する予定がありません．
理由としてLaTeXの単純な挙動を目標としていることが挙げられます．
ただし，コードブロックではアキを入れない，などといった例外規則は導入するかもしれませんので，それを応用して各自で対応することはできるかもしれません．

# してしまうこと
わかってる範囲で，されると困る挙動を挙げておきます．

## 文脈を考えずにアキを入れる
一番困るのがこの`README.md`のような，あえてスペースを入れない箇所がある文章の場合です．
`README.inserted.md`をご覧になれば分かるようにコードブロックだろうが何だろうがスペースを入れます．

スペースの有無で意味が変わってしまうようなテキストが含まれている場合は事前にどうなるか確認してください．

ただし，バージョン1.3から指定した記号で囲まれた範囲の処理を飛ばすことができます．詳しくは[使い方](#使い方)をご覧ください．

## アンドゥできない
フォーマッタ全般に言えることですが，不可逆変換です．

**不用意に上書きしないように注意してください．**

差分をとったり，バージョン管理システムで管理することをおすすめします．


# これからするようになること
今は実装していませんが，次のような機能を将来追加する予定です．

- 欧文についてもアキを入れる（現状和文との境界部分しか見ていません）
- UTF-8以外にも対応
- 他言語バインディング（Rubyなど）
- 処理の除外の設定における正規表現の利用
    - Unicodeに対応した独自のパーサを利用しているため，未だ実装していない
- スペースではなく，任意のマークアップ要素（`<span>`など）で欧文を囲って，後ほどCSS等で調整できるようにするオプションの追加．
    `aki --enclose '<span class="shiki-aki">'`などを予定

# Jekyllで使う
JekyllのGenerator機能を使えば，自動的に出力にスペースを挿入できます．
四季はRubyで書かれていませんので，シェル呼び出しから利用するのが一番簡単だと思います．

WIP

# ライセンス
MITライセンスで提供します．

# 付録

## 挿入ルールチートシート
約物類について，現在の最新安定版（luarocksが出ている中で）で取り扱えるものをリストします．

### カッコ類

| beforeルール                                         | afterルール                                          |
|------------------------------------------------------|------------------------------------------------------|
| <span style="font-size: xx-large;">(</span> `U+0028` | <span style="font-size: xx-large;">)</span> `U+0029` |
| <span style="font-size: xx-large;">[</span> `U+005b` | <span style="font-size: xx-large;">]</span> `U+005c` |
| <span style="font-size: xx-large;">{</span> `U+007b` | <span style="font-size: xx-large;">}</span> `U+007d` |

### 句読点類

| afterルール                                          |
|------------------------------------------------------|
| <span style="font-size: xx-large;">,</span> `U+002c` |
| <span style="font-size: xx-large;">.</span> `U+002e` |
| <span style="font-size: xx-large;">!</span> `U+0021` |
| <span style="font-size: xx-large;">?</span> `U+003f` |
| <span style="font-size: xx-large;">¡</span> `U+00a1` |
| <span style="font-size: xx-large;">¿</span> `U+00bf` |

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

## 「なんでうまく行くの」集

### なんで改行文字の後のカッコ類に空白が入らないの？
改行などの制御文字と空白文字はパース時に「欧文」扱いであるため，挿入点とならないからです．

正直危ない実装です．

### なんで半角3点リーダに空白が入らないの？
ピリオド類はafterルールであるため，ピリオドの後に和文が来ない限り空白が入りません．

```
はい...わかりました
↓挿入点
はい|...|わかりました
↓afterルール
はい|..._わかりました
↓
はい..._わかりました
```

これはルール通りですから問題ないですが，分かりにくいため，褒められた実装ではありません．

## なんで四季？
最近，秋を感じられる期間が短くなってる気がしませんか？
春夏冬みたいな...

アキを入れると四季になるためです．
