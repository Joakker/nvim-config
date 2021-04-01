local u = require 'snippets.utils'
local i = u.match_indentation

return {
    ['for'] = i [[
for $1 in $2:
    $0]],
    func = i [[
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
    ${-1|require'snippet-defs.utils'.format_annotated_args(S[3])}
    """
    def __init__(self, $3):
        $0]],
    meth = i [[
def $1(self${2|vim.trim(S.v):gsub("^[^,]", ", %0")}):
    $0]]
}
