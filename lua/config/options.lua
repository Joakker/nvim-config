local json = require 'config.json'
local opt = vim.opt

opt.timeoutlen = 500

opt.clipboard = 'unnamedplus'
opt.inccommand = 'nosplit'

opt.number = true
opt.termguicolors = true
opt.showmode = false
opt.pumblend = 20

opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

opt.shortmess:append 'c'

opt.textwidth = 90
opt.wrap = false

opt.completeopt = { 'menuone', 'noselect' }
opt.formatoptions:append { 'o', 'r' }

opt.expandtab = true

---@type integer
local indent = json('options.indent', 4)

opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
