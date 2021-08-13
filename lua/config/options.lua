local json = require 'json'
local opt = vim.opt
local indent = json 'options.indent' or 4

opt.number = true
opt.termguicolors = true
opt.showmode = false

opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

opt.shortmess:append 'c'

opt.textwidth = 80

opt.completeopt = { 'menuone', 'noselect' }
opt.formatoptions:append { 'o', 'r' }

opt.expandtab = true

opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
