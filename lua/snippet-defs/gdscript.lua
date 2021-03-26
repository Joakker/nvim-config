-- vim:noexpandtab
local u = require 'snippets.utils'
local i = u.match_indentation
return {
    ['for'] = i [[
for $1 in $2:
	$0]],
    func = i [[
func $1($2):
	$0]],
    match = i [[
match $1:
	case $2:
		$0]]
}
