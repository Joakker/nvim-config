local set_keymap = require'utils'.set_keymap

set_keymap('i', '<C-n>', [[<CMD>lua return require"snippets".expand_or_advance(1)<CR>]])
set_keymap('i', '<C-p>', [[<CMD>lua return require"snippets".advance_snippet(-1)<CR>]])
