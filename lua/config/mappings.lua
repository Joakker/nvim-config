local g = vim.g
local k = require 'keymap'

g.mapleader = ','

k.nnoremap { '<C-k>', '<CMD>BufferLineCyclePrev<CR>' }
k.nnoremap { '<C-j>', '<CMD>BufferLineCycleNext<CR>' }
k.inoremap { '<C-k>', '<CMD>BufferLineCyclePrev<CR>' }
k.inoremap { '<C-j>', '<CMD>BufferLineCycleNext<CR>' }

for _, dir in ipairs { 'h', 'j', 'k', 'l' } do
    k.nnoremap { string.format('<M-%s>', dir), string.format('<C-w>%s', dir) }
end

k.nnoremap { '<F1>', '<CMD>Telescope help_tags<CR>' }
k.nnoremap { '<F2>', ':edit ', silent = false }
k.nnoremap { '<F5>', require('build').build }
k.nnoremap { '<F7>', require('FTerm').toggle }
k.tnoremap { '<F7>', require('FTerm').toggle }
k.nnoremap { '<F8>', require('plugins.fterm').gitui }
k.tnoremap { '<F8>', require('plugins.fterm').gitui }
k.nnoremap { '<F9>', require('plugins.fterm').bpython }
k.tnoremap { '<F9>', require('plugins.fterm').bpython }

k.nnoremap { '<leader>vs', require('utils').reload_config }
k.nnoremap { '<leader>wo', '<CMD>only<CR>' }
k.nnoremap { '<leader>wc', '<CMD>close<CR>' }
k.nnoremap { '<leader>ms', '<CMD>messages<CR>' }
k.nnoremap { '<leader>cc', '<CMD>cclose<CR>' }

k.nnoremap { '<leader>pc', require('packer').clean }
k.nnoremap { '<leader>pi', require('packer').install }
k.nnoremap { '<leader>pk', require('packer').compile }
k.nnoremap { '<leader>pu', require('packer').update }

k.nnoremap { '<leader><leader>w', require('hop').hint_words }
k.nnoremap { '<leader><leader>l', require('hop').hint_lines }

k.vnoremap { '<', '<gv' }
k.vnoremap { '>', '>gv' }
