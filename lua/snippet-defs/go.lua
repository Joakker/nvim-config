-- vim:noexpandtab
local u = require 'snippets.utils'
local i = u.match_indentation
-- local c = u.force_comment

return {
    gen = [[//go:generate ]],
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
func $1($2)${3|vim.trim(S.v):gsub("^%S", " %0")} {
	$0
}]],
    meth = [[
// ${-1:$2}
func ($1) $2($3)${4|vim.trim(S.v):gsub("^%S", " %0")} {
	$0
}]],
    fore = i [[
for {
	$0
}]],
    fori = i [[
for $1; $2; $3 {
	$0
}]],
    iferr = i [[
if err != nil {
	$0
}]],
    ['if'] = i [[
if $1 {
	$0
}]],
    switch = i [[
switch $1${2|vim.trim(S.v):gsub("^%S","; %0")} {
case $3:
	$0
}]],
    def = i [[defer $1($2)]],
    dff = i [[
defer func() {
	$0
}()]],
    dfr = i [[
defer func() {
	if err := recover(); err != nil {
		$0
	}
}()]],
    tys = [[
type $1 struct {
	$0
}]],
    tyi = [[
type $1 interface {
	$0
}]]
}
