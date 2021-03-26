local u = require 'snippets.utils'
local i = u.match_indentation

local stringx = require 'stringx'

for k, v in pairs(stringx) do string[k] = v end

function _G.foreach(stuff, callback)
    local newstuff = {}
    for j = 1, #stuff do newstuff[j] = callback(stuff[j]) end
    return newstuff
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
    ${-1|
        ("\n    "):join(
            foreach(
                S[3]:split"([^, ]+)",
                function(s) return "`" .. s .. "` TODO()" end
            )
        )
    }
    """
    def __init__(self, $3):
        $0]]
}
