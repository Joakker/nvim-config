local api = vim.api

-- Utility functions aimed at facilitating working with windows.
local M = {}

---@class Window
---@field bufnr integer
---@field winid integer

---Create a floating window with the given name.
function M.make_float(bufpos)
    local bufnr = api.nvim_create_buf(false, false)
    local winid = api.nvim_open_win(bufnr, false, {
        relative = 'win',
        border = 'rounded',
        width = 30,
        height = 5,
        style = 'minimal',
        bufpos = bufpos,
    })
    return {
        bufnr = bufnr,
        winid = winid,
    }
end

---Close the given window and delete the buffer attached to it.
---@param window Window
function M.close_float(window)
    api.nvim_buf_delete(window.bufnr)
    api.nvim_win_close(window.winid)
end

return M
