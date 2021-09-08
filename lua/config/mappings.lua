local k = require 'keymap'
local bufferline = require 'bufferline'

vim.g.mapleader = ','

k.nnoremap { '<C-k>', partial(bufferline.cycle, -1) }
k.nnoremap { '<C-j>', partial(bufferline.cycle, 1) }

k.nnoremap { '<leader>pi', require('packer').install }
k.nnoremap { '<leader>pu', require('packer').update }
k.nnoremap { '<leader>pc', require('packer').compile }

k.nnoremap { '<leader><leader>w', require('hop').hint_words }
k.nnoremap { '<leader><leader>l', require('hop').hint_lines }

k.nnoremap { '<F1>', require('telescope.builtin').help_tags }
k.nnoremap { '<F2>', ':edit<SPACE>', silent = false }
k.nnoremap { '<F6>', require('plugins.fterm').gitui }
k.tnoremap { '<F6>', require('plugins.fterm').gitui }
k.nnoremap { '<F7>', require('FTerm').toggle }
k.tnoremap { '<F7>', require('FTerm').toggle }
