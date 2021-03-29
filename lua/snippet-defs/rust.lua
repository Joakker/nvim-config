local U = require 'snippets.utils'
local i = U.match_indentation
return {
    ['for'] = i [[
for ${1:i} in ${2:0..10} {
    $0
}]],
    ['if'] = i [[
if $1 {
    $0
}]]
}
