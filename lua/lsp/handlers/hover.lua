local window = require 'lsp.gui.window'
local api, util = vim.api, vim.lsp.util

local M = {}

---@type Window|nil
M.open_window = nil

local function handler(_, result)
    if not (result and result.contents) then
        return
    end
    -- Make shure that any already open window is closed
    if M.open_window then
        window.close_float(M.open_window)
        M.open_window = nil
    end

    M.open_window = window.make_float(api.nvim_win_get_cursor(api.nvim_get_current_win()))
    api.nvim_buf_set_text(
        M.open_window.bufnr,
        0,
        0,
        0,
        0,
        vim.split(result.contents.value, '\n')
    )
end

function M.hover()
    local params = util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/hover', params, handler)
end

return M
