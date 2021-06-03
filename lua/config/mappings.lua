local g = vim.g
local set_keymap = require'utils'.set_keymap

g.mapleader = ','

set_keymap('n', '<C-k>', '<CMD>BufferLineCyclePrev<CR>')
set_keymap('n', '<C-j>', '<CMD>BufferLineCycleNext<CR>')
set_keymap('i', '<C-k>', '<CMD>BufferLineCyclePrev<CR>')
set_keymap('i', '<C-j>', '<CMD>BufferLineCycleNext<CR>')

for _, dir in ipairs {'h', 'j', 'k', 'l'} do
    set_keymap('n', string.format('<M-%s>', dir), string.format('<C-w>%s', dir))
end

set_keymap('n', '<F1>', '<CMD>Telescope help_tags<CR>')
set_keymap('n', '<F2>', ':edit ', {silent = false})
set_keymap('n', '<F3>', '<CMD>NvimTreeToggle<CR>')
set_keymap('n', '<F5>', '<LUA>import"build".build()<CR>')
set_keymap('n', '<F7>', '<LUA>require"FTerm".toggle()<CR>')
set_keymap('t', '<F7>', '<LUA>require"FTerm".toggle()<CR>')
set_keymap('n', '<F8>', '<LUA>require"plugins.fterm".gitui()<CR>')
set_keymap('t', '<F8>', '<LUA>require"plugins.fterm".gitui()<CR>')
set_keymap('n', '<F9>', '<LUA>require"plugins.fterm".bpython()<CR>')
set_keymap('t', '<F9>', '<LUA>require"plugins.fterm".bpython()<CR>')

set_keymap('n', '<leader>vs', '<LUA>require"utils".reload_config()<CR>')
set_keymap('n', '<leader>wo', '<CMD>only<CR>')
set_keymap('n', '<leader>wc', '<CMD>close<CR>')
set_keymap('n', '<leader>ms', '<CMD>messages<CR>')
set_keymap('n', '<leader>cc', '<CMD>cclose<CR>')

set_keymap('n', '<leader>pc', '<LUA>require"packer".clean()<CR>')
set_keymap('n', '<leader>pi', '<LUA>require"packer".install()<CR>')
set_keymap('n', '<leader>pk', '<LUA>require"packer".compile()<CR>')
set_keymap('n', '<leader>pu', '<LUA>require"packer".update()<CR>')

set_keymap('n', '<leader><leader>w', '<LUA>require"hop".hint_words()<CR>')
set_keymap('n', '<leader><leader>l', '<LUA>require"hop".hint_lines()<CR>')

set_keymap('v', '<', '<gv')
set_keymap('v', '>', '>gv')
