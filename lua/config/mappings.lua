local k = require 'keymap'
local g = vim.g
local f = require 'plenary.functional'

g.mapleader = ','

local bufferline = require 'bufferline'
local packer = require 'packer'

k.nnoremap { '<leader>cc', '<CMD>cclose<CR>' }
k.nnoremap { '<leader>wo', '<CMD>only<CR>' }

k.nnoremap { '<leader>vs', '<CMD>source $MYVIMRC<CR>' }

k.nnoremap { '<F2>', ':edit ', silent = false }
k.nnoremap { '<C-j>', f.partial(bufferline.cycle, 1) }
k.nnoremap { '<C-k>', f.partial(bufferline.cycle, -1) }

k.nnoremap { '<leader><leader>l', require('hop').hint_lines }
k.nnoremap { '<leader><leader>w', require('hop').hint_words }

k.nnoremap { '<leader>pc', packer.compile }
k.nnoremap { '<leader>pi', packer.install }
k.nnoremap { '<leader>pu', packer.update }

k.nnoremap { '<F6>', require('plugins.fterm').gitui }
k.tnoremap { '<F6>', require('plugins.fterm').gitui }
k.nnoremap { '<F7>', require('FTerm').toggle }
k.tnoremap { '<F7>', require('FTerm').toggle }
