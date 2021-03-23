local u = require 'snippets.utils'
local i = u.match_indentation

return {
    func = i [[
function $1($2) abort
    $0
endfunction]],
    aug = i [[
augroup $1
    $0
augroup END]],
    auc = i [[
autocmd $1 $2 $3]],
    ifx = i [[
if $1exists($2)
    $0
endif]],
    ['for'] = i [[
for $1 in $2
    $0
endfor]],
    ['while'] = i [[
while $1
    $0
endwhile]]
}
