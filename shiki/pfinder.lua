---- insert 'p'oint 'finder'

local shiki = {
    escape = require 'shiki.escape',
    config = require 'shiki.config'
}
shiki.determine = require 'shiki.char-determine'

-- 文字を巡回していき，区切りを見つけたらそこでyield
-- エスケープに該当するなら無視していく
local function coroutine_pfinder(source, escape_instance)
    local cursor = 1
    local last = { cp = cp, category = '_initial_' }

    local escape_mode = false
    local source_len = #source

    local is_end = nil

    while cursor <= source_len do
        -- debug mode
        if shiki.config.debug then
            io.write(source[cursor])
        end

        -- escape_mode
        if escape_mode then
            local match = is_end(source, cursor)
            if match then
                -- スキップするので-1
                cursor = cursor + match.consume - 1
                escape_mode = false
                -- 前回の記憶が残ってると面倒なので
                last = { category = '_initial_' }
            end
        else
            local match, id = escape_instance.is_begin(source, cursor)
            if match then
                -- スキップするので-1
                cursor = cursor + match.consume - 1
                escape_mode = true
                -- 対応する終了パターン検索
                is_end = escape_instance.search_pair(id)
            else
                local c = source[cursor]
                local category = shiki.determine.category(c)

                -- 文字種が異なる場合はアキを入れる候補にする（必ずしも入れる必要はない）
                if last.category ~= '_initial_' and category ~= last.category then
                    coroutine.yield({ position = cursor, pre = last.cp, post = c })
                end
                last.cp = c
                last.category = category
            end
        end

        cursor = cursor + 1
    end
end

function shiki.pfinder(source, escape_instance) --> iterator --> insert_point
    -- APIの後方互換性
    -- バージョン1.3からは予め何もしないインスタンスを渡している
    if not escape_instance then
        escape_instance = shiki.escape.build_instance({})
    end

    local co = coroutine.create(coroutine_pfinder)
    return function ()
        local suc, p = coroutine.resume(co, source, escape_instance)
        if suc then return p else return nil end
    end
end

return shiki.pfinder
