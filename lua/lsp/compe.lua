local api = vim.api
local fn = vim.fn
local k = require 'keymap'

require('nvim-autopairs.completion.compe').setup {
    map_cr = true,
    map_complete = true,
}

require('compe').setup {
    enabled = true,
    autocomplete = true,
    source = {
        path = true,
        buffer = true,
        nvim_lsp = { kind = '   (LSP)' },
        vsnip = { kind = ' ﬌  (Snippet)' },
        neorg = true,
    },
}

---@param str string The string to escape.
---@return string
local function t(str)
    return api.nvim_replace_termcodes(str, true, true, true)
end

local function check_back_space()
    local col = fn.col '.' - 1
    return col == 0 or fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local function tab_complete()
    if fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif fn['vsnip#available'](1) == 1 then
        return t '<Plug>(vsnip-expand-or-jump)'
    elseif check_back_space() then
        return t '<TAB>'
    else
        return fn['compe#complete']()
    end
end

local function s_tab_complete()
    if fn.pumvisible() == 1 then
        return t '<C-p>'
    elseif fn['vsnip#jumpable'](-1) == 1 then
        return t '<Plug>(vsnip-jump-prev)'
    else
        return t '<S-TAB>'
    end
end

k.imap { '<TAB>', tab_complete, expr = true }
k.smap { '<TAB>', tab_complete, expr = true }
k.imap { '<S-TAB>', s_tab_complete, expr = true }
k.smap { '<S-TAB>', s_tab_complete, expr = true }
k.imap { '<C-Space>', fn['compe#complete'], expr = true }
