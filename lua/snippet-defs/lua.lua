local u = require 'snippets.utils'
local i = u.match_indentation

return {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
    func = [[function${1|vim.trim(S.v):gsub("^%S", " %0")}(${2|vim.trim(S.v)})$0 end]],
    ['for'] = i[[
for ${1:k}, ${2:v} in $4 do
    $0
end]],
    ['fori'] = i[[
for ${1:i} = ${2} do
    $0
end]],
    ['while'] = i[[
while $1 do
    $0
end
]]
}
