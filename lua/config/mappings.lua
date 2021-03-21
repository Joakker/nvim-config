local g = vim.g
local set_keymap = require'utils'.set_keymap

g.mapleader = ','

set_keymap('n', '<C-k>', '<CMD>tabp<CR>')
set_keymap('n', '<C-j>', '<CMD>tabn<CR>')
set_keymap('i', '<C-k>', '<CMD>tabp<CR>')
set_keymap('i', '<C-j>', '<CMD>tabn<CR>')

for _, dir in ipairs{'h','j','k','l'} do
    set_keymap('n', string.format('<M-%s', dir), string.format('<C-w>%s', dir))
end

set_keymap('n', '<F1>', '<CMD>Telescope help_tags<CR>')
set_keymap('n', '<F2>', ':tabnew ', {silent = false})

set_keymap('n', '<leader>vs', '<CMD>lua require"utils".reload_config()<CR>')
set_keymap('n', '<leader>wo', '<CMD>only<CR>')
set_keymap('n', '<leader>wc', '<CMD>close<CR>')
set_keymap('n', '<leader>ms', '<CMD>messages<CR>')
-- set_keymap('n'
