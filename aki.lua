#!/usr/bin/env lua

local argparse = require 'argparse'
local ltable = require 'lua_table'
local yaml = require 'yaml'
local shiki = {
    insert  = require 'shiki.inserter',
    pfinder = require 'shiki.pfinder',
    escape  = require 'shiki.escape',
    unicode = require 'shiki.unicode',
    config  = require 'shiki.config',
}

local parser = argparse()
    :name 'aki'
    :description 'Insert "Aki" for plain text typography.'
    :epilog 'For more info, see https://github.com/ryu-raptor/shiki'

parser:argument('file', 'Source text files.')
    :args '+'

parser:option()
    :name '-o --output'
    :description 'An output file. If not given, results are written to stdout'

parser:option()
    :name '-c --escape-config'
    :description 'An escaping define file formatted in YAML. --escape option is automatically enabled. See documents for a config schema'
    :args '1'

parser:option()
    :name '-e --escape'
    :description 'Enable escaping of aki operations. Without --escape-config option, a defualt setting is used'
    :args '0'

parser:option()
    :name '-d --debug'
    :description 'Enable debug mode to dump all behaviour of the shiki parser'
    :args '0'

function main()
    local args = parser:parse()
    ---- configure
    -- debug mode
    shiki.config.debug = args.debug

    ---- arguments
    -- load files
    local source = {}

    for _, fpath in ipairs(args.file) do
        local f = io.open(fpath)
        ltable.append(source, shiki.unicode.to_codepoints(f:read('a')))
        f:close()
    end

    ---- options
    -- escape mode
    local escape_pairs
    if args.escape or args.escape_config then
        if args.escape_config then
            local f = io.open(args.escape_config)
            escape_pairs = yaml.eval(f:read('a'))
            -- load from file stub
        else
            -- escape default settings
            escape_pairs = {
                { begin = '<pre>', ['end'] = '</pre>' },
                { begin = '<code>', ['end'] = '</code>' },
                { begin = '```', ['end'] = '```' },
                { begin = '``', ['end'] = '``' },
                { begin = '`', ['end'] = '`' },
                { begin = '<!--', ['end'] = '-->' },
            }
        end
    else
        escape_pairs = {}
    end

    local escape_instance = shiki.escape.build_instance(escape_pairs)

    -- run pfinder
    local ips = {}
    for sep in shiki.pfinder(source, escape_instance) do
        table.insert(ips, sep)
    end

    -- run insert
    local result = ""
    for _, c in ipairs(shiki.insert.insert_aki(source, ips)) do
        result = result .. utf8.char(c)
    end

    -- do output
    if args.output then
        local f = io.open(args.output, 'w')
        f:write(result)
        f:close()
    else
        io.write(result)
    end
end

main()
