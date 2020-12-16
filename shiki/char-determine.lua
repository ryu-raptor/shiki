---- 文字種を決定する

local unicode = require 'shiki.unicode'
local ltable = require 'lua_table'
local shiki = { determine = {} }
shiki.category = require 'shiki.char-category'

-- codepoint -> shiki.category
-- 複数ある場合はそのうちの一つ
function shiki.determine.category(codepoint)
    for category, range in pairs(shiki.category) do
        if unicode.is(codepoint, range) then
            return category
        end
    end
end

function shiki.determine.category_raw(codepoint, dict)
    for category, range in pairs(dict) do
        if unicode.is(codepoint, range) then
            return category
        end
    end
end

return shiki.determine
