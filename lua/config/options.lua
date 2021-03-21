local opt = import'utils'.opt
local g = vim.g

opt('o', 'termguicolors', true)
opt('o', 'hidden', true)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'showmode', false)
opt('o', 'updatetime', 300)
opt('o', 'inccommand', 'nosplit')
opt('o', 'pumblend', 15)
opt('o', 'guifont', 'Iosevka:12')

opt('o', 'completeopt', 'menuone,noinsert,noselect')
opt('o', 'shortmess', vim.o.shortmess .. 'c')

local indent = 4

opt('b', 'expandtab', true)
opt('b', 'smartindent', true)
opt('b', 'tabstop', indent)
opt('b', 'shiftwidth', indent)
opt('b', 'softtabstop', indent)

opt('w', 'relativenumber', true)
opt('w', 'number', true)
opt('w', 'wrap', false)
opt('w', 'colorcolumn', '80')
-- opt('w', 'foldmethod', 'expr')
-- opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')
opt('w', 'list', true)
opt('w', 'listchars', 'eol:,tab:--,trail:·')

g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

g.python3_host_prog = '/usr/local/bin/python3'
