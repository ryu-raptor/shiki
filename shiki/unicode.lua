-- Unicodeのコードポイントから文字種を判明させる
-- 参考：https://sites.google.com/site/michinobumaeda/misc/unicodecodechars

local unicode = {}

unicode.range = {}

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

---- ユーティリティ関数
-- 文字種を組み合わせる
-- 引数：unicode.range
function unicode.mix_range(...) --> unicode.range object
    local mixed = {}
    for _, range in ipairs({...}) do
        for _, v in ipairs(range) do
            table.insert(mixed, v)
        end
    end
    return mixed
end

-- rangeに含まれるかを調べる
function unicode.is(codepoint, range)
    local result = false
    for _, r in ipairs(range) do
        local b
        if type(r) == 'table' then
            b = (r[1] <= codepoint and codepoint <= r[2])
        else
            b = r == codepoint
        end
        result = result or b
    end
    return result
end

return unicode
