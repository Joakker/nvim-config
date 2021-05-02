local gl = require 'galaxyline'
local gls = gl.section

local fn = vim.fn

local colors = {
    red = '#DC1874',
    ivo = '#F6F7EB',
    blu = '#044782',
    grn = '#165C1A',
}

gls.left[1] = { -- Padding
    Padding = {
        provider = function()
            return '   '
        end,
        highlight = {colors.ivo, colors.grn},
    },
}
gls.left[2] = { -- Vi Mode
    ViMode = {
        provider = function()
            local alias = {
                n = '',
                i = '',
                c = 'ﳳ',
                v = '',
                V = '',
                s = '',
                [''] = '',
            }
            return (alias[fn.mode()] or fn.mode()) .. ' '
        end,
        highlight = {colors.ivo, colors.grn},
        separator = ' ',
        separator_highlight = {colors.grn, colors.red},
    },
}
gls.left[3] = { -- File Icon
    FileIcon = {
        provider = 'FileIcon',
        highlight = {colors.ivo, colors.red},
        separator = '',
        separator_highlight = {colors.red, colors.blu},
    },
}

gls.right[1] = { -- Position
    Position = {
        provider = function()
            local c = tonumber(fn.col '.')
            local l = tonumber(fn.line '.')
            return (' %-3d| %-3d'):format(c, l)
        end,
        highlight = {colors.ivo, colors.red},
        separator = '',
        separator_highlight = {colors.red, colors.blu},
    },
}
