#!/usr/bin/env lua

local argparse = require 'argparse'
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

local parser = argparse()
    :name 'aki'
    :description 'Insert "Aki" for plain text typography.'
    :epilog 'For more info, see https://github.com/ryu-raptor/shiki'

parser:argument('file', 'Source text files.')
    :args '+'

parser:option()
    :name '-o --output'
    :description 'An output file. If not given, results are written to stdout'

function main()
    local args = parser:parse()
    -- open files
    local source = {}

    for _, fpath in ipairs(args.file) do
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

    if args.output then
        local f = file.open(args.output, 'w')
        f:print(result)
        f:close()
    else
        print(result)
    end
end

main()
