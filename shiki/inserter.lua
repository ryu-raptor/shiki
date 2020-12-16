---- ルールに従ってアキを入れる

local unicode = require 'shiki.unicode'
local ltable = require 'lua_table'
local determine = require 'shiki.char-determine'
local akicodepoint = utf8.codepoint(' ')

local insert = {}
local shiki = { category = require 'shiki.char-category' }

--
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

-- 与えられた中でafterはすべてafterにして返す
local function insert_after(...)
    local arr = {}
    for _, v in ipairs({...}) do
        local unit
        if determine.category_raw(v, rule) == 'after' then
            unit = { v, akicodepoint }
        else
            unit = { v }
        end
        ltable.append(arr, unit)
    end
    return arr
end

function f_and(a, b)
    return a and b
end

function f_or(a, b)
    return a or b
end

function fold(list, f, foldop, intro)
    local last = intro
    for _, v in ipairs(list) do
        last = foldop(last, f(v))
    end
    return last
end

-- 現在, - , 後
function insert.kumishi(pres, ip, posts) --> ..., pre, ..., post, ...
    local precat  = determine.category_raw(ip.pre,  rule)
    local postcat = determine.category_raw(ip.post, rule)

    -- 処理
    -- betweenもbeforeもafterもすべてaki+postの形式になる
    -- beforeは (あ みたいになるとだめ
    -- しかしbeforeは あ( の順番で出ることに意味があるので問題ない
    if (precat == postcat and precat == 'between') or
        precat == 'after' or 
        postcat == 'before' then
        return akicodepoint, ip.post
    end

    return ip.post
end

function insert.insert_aki(source, insertpoints)
    local len = #source
    local sc = 1 -- source cursor
    local rcp = {} -- result code point
    local intc = 1 -- interest cursor
    local int = insertpoints[intc] -- interest

    while sc <= len do
        local unit
        if int and sc == int.position then
            unit = { insert.kumishi(rcp, int, source) }
            -- つぎの興味へ
            intc = intc + 1 -- interest cursor
            int = insertpoints[intc] -- interest
        else
            unit = { source[sc] }
        end

        ltable.append(rcp, unit)

        sc = sc + 1
    end

    return rcp
end

return insert
