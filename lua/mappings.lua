local wk = require 'which-key'
local bl = require 'bufferline'
local tr = require 'nvim-tree'
local tl = require 'telescope.builtin'
local pk = require 'packer'

vim.g.mapleader = ','

wk.register({ ['<F2>'] = { ':edit<SPACE>', 'Edit' } }, { silent = false })

wk.register {
    ['<C-k>'] = { partial(bl.cycle, -1), 'Prev Buffer' },
    ['<C-j>'] = { partial(bl.cycle, 1), 'Next Buffer' },
}

wk.register {
    ['<F1>'] = { tl.help_tags, 'Help Tags' },
    ['<F3>'] = { partial(tr.toggle, false), 'Toggle Nvim Tree' },
}

wk.register({
    p = {
        name = 'Packer',

        c = { pk.compile, 'Compile' },
        u = { pk.update, 'Update' },
    },
}, { prefix = '<leader>' })
