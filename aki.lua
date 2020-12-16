#!/usr/bin/env lua

local ltable = require 'lua_table'
local shiki = {
    insert = require 'shiki.inserter',
    pfinder = require 'shiki.pfinder'
}

function to_codepoints(str)
    local arr = {}
    for _, v in utf8.codes(str) do
        table.insert(arr, v)
    end
    return arr
end


function main(args)
    -- open files
    if #args == 0 then
        return
    end

    local source = {}

    for _, fpath in ipairs(args) do
        local f = io.open(fpath)
        ltable.append(source, to_codepoints(f:read('a')))
        f:close()
    end

    local ips = {}
    for sep in shiki.pfinder(source) do
        table.insert(ips, sep)
    end

    local result = ""
    for _, c in ipairs(shiki.insert.insert_aki(source, ips)) do
        result = result .. utf8.char(c)
    end
    print(result)
end

main(arg)
