local u = require 'snippets.utils'
local i = u.match_indentation

return {
    ['for'] = i [[
for ($1; $2; $3) {
    $0
}]],
    ['while'] = i [[
while ($1) {
    $0
}]],
    ['func'] = i [[
$1 $2($3) {
    $0
}]],
    ['guard'] = [[
#ifndef ${1|S.v:upper():gsub(" ", "_")}_H
#define ${1|S.v:upper():gsub(" ", "_")}_H
$0
#endif // $1]]
}
