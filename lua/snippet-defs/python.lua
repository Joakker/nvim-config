local u = require 'snippets.utils'
local i = u.match_indentation

return {
    ['for'] = i [[
for $1 in $2:
    $0]],
    def = i [[
def $1($2)${3|vim.trim(S.v):gsub("^%S", " -> %0")}:
    $0]]
}
