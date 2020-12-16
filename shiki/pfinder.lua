---- insert 'p'oint 'finder'

local shiki = {}
shiki.determine = require 'shiki.char-determine'

-- 文字を巡回していき，区切りを見つけたらそこでyield
local function coroutine_pfinder(source)
    local itr, s, var = ipairs(source)
    local pos, cp = itr(s, var)
    local last = { cp = cp, category = shiki.determine.category(cp) }
    for p, c in itr, s, pos do
        local category = shiki.determine.category(c)

        -- 文字種が異なる場合はアキを入れる候補にする（必ずしも入れる必要はない）
        if category ~= last.category then
            coroutine.yield({ position = p, pre = last.cp, post = c })
        end
        last.cp = c
        last.category = category
    end
end

function shiki.pfinder(source) --> iterator --> insert_point
    local co = coroutine.create(coroutine_pfinder)
    return function ()
        local suc, p = coroutine.resume(co, source)
        if suc then return p else return nil end
    end
end

return shiki.pfinder
