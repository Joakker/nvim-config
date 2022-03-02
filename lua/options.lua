local o = vim.opt

o.textwidth = 80
o.wrap = false

o.number = true
o.termguicolors = true
o.showmode = false
o.pumblend = 20

local indent = 4

o.expandtab = true
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldtext = 'getline(v:foldstart) . " ... " . trim(getline(v:foldend))'

o.fillchars = { fold = ' ' }
