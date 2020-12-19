---- Unicode parser

local unicode = require 'shiki.unicode'
local ltable = require 'lua_table'
local f = require 'functional'

local p = {}

-- マッチオブジェクトを返す
function p.match_object(matches_str, consumechar)
    return { match = matches_str, consume = consumechar }
end

-- 選択
-- 最長マッチ
function p.select(matches, id)
    return function (ustr, pos)
        local cands = {}

        for _, m in ipairs(matches) do
            local match, cid = m(ustr, pos)
            if match then
                -- 候補に入れつつ他のもやってみる
                table.insert(cands, {
                    match = match, cid = cid
                })
            end
        end

        if #cands == 0 then
            return nil
        end

        -- 一番長かったのを選ぶ
        -- ソートするまでもないですよね
        -- 後でリファクタリング
        table.sort(cands, function (a, b)
            return a.match.consume > b.match.consume
        end)

        return cands[1].match, id or cands[1].cid
    end
end

-- 最短マッチ
-- ではないので注意
-- 一番はじめのマッチを取得
function p.negative_select(matches, id)
    return function (ustr, pos)
        for _, m in ipairs(matches) do
            local match, cid = m(ustr, pos)
            if match then
                return match, id or cid
            end
        end

        return nil
    end
end

-- 連接
function p.combi(matches, id)
    return function (ustr, pos)
        local result = {}
        local init_pos = pos
        for _, m in ipairs(matches) do
            local match = m(ustr, pos)
            -- 連接なのでpos更新
            -- だめなら即終了
            if match then
                pos = pos + match.consume
                ltable.append(result, match.match)
            else
                return nil
            end
        end

        return p.match_object(result, pos - init_pos), id
    end
end

function p.literal(string, id)
    local match_ustr = unicode.to_codepoints(string)
    return function (ustr, pos)
        local cursor = 0
        while cursor < #match_ustr do
            -- 対象の文末 OR マッチしない
            -- nilを返す
            if ustr[pos + cursor] == nil or match_ustr[cursor + 1] ~= ustr[pos + cursor] then
                return nil
            end

            cursor = cursor + 1
        end

        -- return match object
        return p.match_object({ string }, cursor), id
    end
end

function p.do_match(string, match, pos)
    return match(unicode.to_codepoints(string), pos or 1)
end

function p.build(bfunc)
    return bfunc(p)
end

function p.encapsule(match)
    return function (string, pos)
        return p.do_match(string, match, pos)
    end
end

return p
