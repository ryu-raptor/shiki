---- 除外システム

local f = require 'functional'
local p = require 'shiki.parser'
local unicode = require 'shiki.unicode'
local escape = {}

-- pair format
--[[
{
{
    ['begin'] = string or { string },
    ['end']   = string or { string }
}
, ...}
]]

local fresh = 0

local function gen_fresh_id()
    fresh = fresh + 1
    return fresh
end

function escape.build_instance(pairarr)
    -- もし空配列 or nil なら何もしないインスタンスを返す
    if not pairarr or #pairarr == 0 then
        return {
            is_begin = function ()
                return nil
            end,
            search_pair = function ()
                return function () return p.match_object({}, 0) end
            end
        }
    end

    local search_pair
    local instance = {}

    -- { { } }
    mpairarr = f.map(pairarr, function (pair)
        local id = gen_fresh_id()
        local result = {}

        local mpair = f.map({ pair['begin'], pair['end'] },
        function (pattern)
            if type(pattern) == 'string' then
                return p.literal(pattern, id)
            end
            return p.select(f.map(pattern, function (v)
                return p.literal(v)
            end))
        end):to_array()

        result = {
            ['begin'] = mpair[1],
            ['end']   = mpair[2],
            id        = id
        }

        return result
    end):to_array()

    -- print(table.unpack(mpairarr))
    
    -- mpairarr -> instance.is_begin, .search_pair
    instance.is_begin = p.select(f.map(mpairarr, function (elem)
        return elem.begin
    end):to_array())

    -- id から end parser を引く辞書
    local endmap = {}
    for _, elem in ipairs(mpairarr) do
        -- [2] = end の方を取る
        endmap[elem.id] = elem['end']
    end

    instance.search_pair = function (id)
        -- もっと細かい制御を行えるようにする予定
        -- 賢いエスケープ機能など（ネストを判断できる）
        return endmap[id]
    end

    return instance
end

return escape
