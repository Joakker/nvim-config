local M = {}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col '.' - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col) then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif check_back_space() then
        return t '<TAB>'
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<S-TAB>'
    end
end

function M.on_attach(client, bufnr)
    local opts = {noremap = true, silent = true}
    local function set_keymap(...)
        local o = {...}
        vim.api.nvim_buf_set_keymap(bufnr, o[1], o[2], o[3], o[4] or opts)
    end

    set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
    set_keymap('n', 'gd',
               '<CMD>lua require"lspsaga.provider".preview_definition()<CR>')
    set_keymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
    set_keymap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>')

    set_keymap('n', 'K', -- '<CMD>lua vim.lsp.buf.hover()<CR>')
    '<CMD>lua require"lspsaga.hover".render_hover_doc()<CR>')

    set_keymap('n', '<leader>rn',
               '<CMD>lua require"lspsaga.rename".rename()<CR>')
    set_keymap('n', '<leader>ca',
               '<CMD>lua require"lspsaga.codeaction".code_action()<CR>')

    set_keymap('n', '[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<cR>')
    set_keymap('n', ']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<cR>')

    set_keymap('i', '<TAB>', 'v:lua.tab_complete()', {expr = true})
    set_keymap('i', '<S-TAB>', 'v:lua.s_tab_complete()', {expr = true})

    set_keymap('i', '<C-Space>', '', {})

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END]], false)
    end

    if client.resolved_capabilities.document_formatting then
        set_keymap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.formatting()<CR>')

        vim.api.nvim_exec([[
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        ]], false)
    end

    -- require'completion'.on_attach(client)
end

M.server_dir = vim.fn.stdpath 'data' .. '/servers'

return M
