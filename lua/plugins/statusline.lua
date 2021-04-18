local gl = require 'galaxyline'
local gls = gl.section

local fn = vim.fn

local colors = {
    bg = '#393E41',
    blue = '#313B72',
    amaranth = '#E83151',
    ivory = '#F6F7EB',
    prussian_blue = '#23395B',
    warm_black = '#004643',
}

gls.left[1] = {
    Padding = {
        provider = function()
            return '   '
        end,
        highlight = {colors.ivory, colors.warm_black},
    },
}
gls.left[2] = {
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
        highlight = {colors.ivory, colors.warm_black},
        separator = ' ',
        separator_highlight = {colors.warm_black, colors.amaranth},
    },
}
gls.left[3] = {
    FileIcon = {
        provider = 'FileIcon',
        highlight = {
            require'galaxyline.provider_fileinfo'.get_file_icon_color,
            colors.amaranth,
        },
        separator = '',
        separator_highlight = {colors.amaranth, colors.prussian_blue},
    },
}

gls.right[1] = {
    Position = {
        provider = function()
            local c = tonumber(fn.col '.')
            local l = tonumber(fn.line '.')
            return (' %-3d| %-3d'):format(c, l)
        end,
        highlight = {colors.ivory, colors.amaranth},
        separator = '',
        separator_highlight = {colors.amaranth, colors.prussian_blue},
    },
}
