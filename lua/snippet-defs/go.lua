local u = require 'snippets.utils'
-- local i = u.match_indentation
local c = u.force_comment

return {
    gen = c [[go:generate ]],
    main = [[
func main() {
    $0
}]],
    init = [[
func init() {
    $0
}]],
    func = [[
// ${-1:$1}
func $1($2) ${3|vim.trim(S.v):gsub("^%S", " %0")} {
    $0
}]],
}
