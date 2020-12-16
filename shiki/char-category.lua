local unicode = require 'shiki.unicode'

local shiki = { category = {} }

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

return shiki.category
