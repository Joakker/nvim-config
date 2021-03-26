local u = require 'snippets.utils'
local i = u.match_indentation

local stringx = require 'stringx'

for k, v in pairs(stringx) do string[k] = v end

function _G.normalize_params(args)
    local map = vim.tbl_map
    local max = vim.fn.max
    args = vim.split(args, ',', true)
    args = map(function(e)
        return vim.split(e, ':', true)[1]
    end, args)
    args = map(function(e)
        return vim.trim(vim.split(e, '=', true)[1])
    end, args)
    args = vim.tbl_filter(function(e)
        return #e ~= 0
    end, args)
    local maxlen = max(map(function(e)
        return #e
    end, args))
    args = map(function(e)
        return '`' .. e .. '`' .. (' '):rep(maxlen + 1 - #e) .. ': TODO()'
    end, args)
    return vim.fn.join(args, '\n    ')
end

return {
    ['for'] = i [[
for $1 in $2:
    $0]],
    def = i [[
def $1($2)${3|vim.trim(S.v):gsub("^%S", " -> %0")}:
    $0]],
    ['if'] = i [[
if $1:
    $0]],
    ['ifmain'] = i [[
if __name__ == '__main__':
    $0]],
    ['try'] = i [[
try:
    $0
except $1${2|vim.trim(S.v):gsub("^%S", " as %0")}:
    pass]],
    with = i [[
with $1 as $2:
    $0]],
    class = [[
class $1${2|vim.trim(S.v):gsub("^%S", "(%0"):gsub("%S$", "%0)")}:
    """
    Class $1
    ${-1|normalize_params(S[3])}
    """
    def __init__(self, $3):
        $0]]
}
