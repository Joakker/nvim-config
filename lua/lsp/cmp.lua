local fn = vim.fn
local api = vim.api

local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

local t = function(str)
    return api.nvim_replace_termcodes(str, true, true, true)
end

lspkind.init {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-SPACE>'] = cmp.mapping.complete(),
        ['<TAB>'] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                fn.feedkeys(t '<C-n>', 'n')
            elseif luasnip.expand_or_jumpable() then
                fn.feedkeys(t '<PLUG>luasnip-expand-or-jump', '')
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
        ['<S-TAB>'] = cmp.mapping(function(fallback)
            if fn.pumvisible() == 1 then
                fn.feedkeys(t '<C-p>', 'n')
            elseif luasnip.jumpable(-1) then
                fn.feedkeys(t '<Plug>luasnip-jump-prev', '')
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
    },

    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
    },

    formatting = {
        format = function(_, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind
            return vim_item
        end,
    },

    documentation = {
        border = 'rounded',
    },
}
