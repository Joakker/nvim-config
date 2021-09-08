local fterm = require 'FTerm'
fterm.setup {
    border = 'rounded',
}

local gitui = fterm:new {
    cmd = 'gitui',
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
}

local M = {}

function M.gitui()
    gitui:toggle()
end

return M
