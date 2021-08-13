require('FTerm').setup {}

local term = require 'FTerm.terminal'

local gitui = term:new():setup { cmd = 'gitui' }

return {
    gitui = function()
        gitui:toggle()
    end,
}
