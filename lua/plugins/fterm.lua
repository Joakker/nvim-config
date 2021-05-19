require'FTerm'.setup {border = 'double'}

local gitui = require 'FTerm.terminal':new():setup{
    cmd = 'gitui',
    dimensions = {height = 0.9, width = 0.9},
}

local bpython = require 'FTerm.terminal':new():setup{
    cmd = 'bpython',
    dimensions = {height = 0.9, width = 0.9},
}

return {
    gitui = function()
        gitui:toggle()
    end,
    bpython = function()
        bpython:toggle()
    end,
}
