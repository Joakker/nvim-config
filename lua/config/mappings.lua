local bufferline = require 'bufferline'
local wk = require 'which-key'

vim.g.mapleader = ','

-- Window/Buffer navigation
wk.register {
    ['<C-k>'] = { partial(bufferline.cycle, -1), 'PrevBuffer' },
    ['<C-j>'] = { partial(bufferline.cycle, 1), 'NextBuffer' },
    ['<Left>'] = { '<C-w>h', 'Left Window' },
    ['<Right>'] = { '<C-w>l', 'Right Window' },
    ['<Up>'] = { '<C-w>k', 'Up Window' },
    ['<Down>'] = { '<C-w>j', 'Down Window' },
}

-- Packer specific mappings
wk.register {
    ['<leader>'] = {
        p = {
            name = 'Packer',
            i = { require('packer').install, 'Install' },
            u = { require('packer').update, 'Update' },
            c = { require('packer').compile, 'Compile' },
            s = { require('packer').sync, 'Sync' },
        },
    },
}

-- Bouncy bouncy
wk.register {
    ['<leader>'] = {
        ['<leader>'] = {
            name = 'Hop',
            w = { require('hop').hint_words, 'Words' },
            l = { require('hop').hint_lines, 'Lines' },
        },
    },
}

-- Function keys
wk.register({ ['<F2>'] = { ':edit<SPACE>', 'Edit' } }, { silent = false })
wk.register {
    ['<F1>'] = { require('telescope.builtin').help_tags, 'Help Tags' },
    ['<F3>'] = { require('nvim-tree').toggle, 'Toggle Explorer' },
    ['<F6>'] = { require('plugins.fterm').gitui, 'Toggle Gitui' },
    ['<F7>'] = { require('FTerm').toggle, 'Toggle Terminal' },
}
wk.register({
    ['<F6>'] = { require('plugins.fterm').gitui, 'Toggle Gitui' },
    ['<F7>'] = { require('FTerm').toggle, 'Toggle Terminal' },
}, {
    mode = 't',
})
