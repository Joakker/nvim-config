local modeutils = require 'feline.providers.vi_mode'
local lsputils = require 'feline.providers.lsp'

local colors = {
    '#EB4B98',
    '#C678DD',
    '#DE3C4B',
    '#912F40',
    '#035E7B',
    '#02394A',
    '#202328',
    '#E3E7AF',
    '#FF8864',
}

-- stylua: ignore
local mode_icons = {
    n      = '',
    v      = '',
    V      = '',
    [''] = '',
    s      = '',
    S      = '',
    [''] = '',
    i      = '',
    R      = '',
    c      = 'גּ',
    t      = '',
}

-- stylua: ignore
local lsp_icons = {
    errs  = ' ',
    warns = ' ',
    infos = ' ',
    hints = ' ',
}

local function diagnostics_of(func, level)
    local icon = lsp_icons[level]
    return function()
        local diag = func()[level]
        return icon .. diag
    end
end

local function lsp_diagnostics_info()
    return {
        errs = lsputils.get_diagnostics_count 'Error',
        warns = lsputils.get_diagnostics_count 'Warning',
        infos = lsputils.get_diagnostics_count 'Information',
        hints = lsputils.get_diagnostics_count 'Hint',
    }
end

local function enable_diagnostic(func, level)
    return function()
        local diag = func()[level]
        return diag and diag ~= 0
    end
end

local component_defs = {
    vi_mode = {
        provider = function()
            local mode = vim.fn.mode()
            local icon = mode_icons[mode]
            if not icon then
                return (' %s '):format(mode)
            end
            return (' %s '):format(icon)
        end,
        right_sep = ' ',
        hl = function()
            return {
                name = modeutils.get_mode_highlight_name(),
                fg = modeutils.get_mode_color(),
                bg = colors[5],
            }
        end,
    },

    file = {
        info = {
            provider = 'file_info',
            hl = {
                fg = colors[3],
                style = 'bold',
            },
        },
        type = {
            provider = function()
                local type = vim.bo.filetype:upper()
                return (' %s '):format(type)
            end,
            left_sep = '',
            hl = {
                bg = colors[3],
            },
        },
    },

    diagnostic = {
        err = {
            provider = diagnostics_of(lsp_diagnostics_info, 'errs'),
            right_sep = ' ',
            enabled = enable_diagnostic(lsp_diagnostics_info, 'errs'),
            hl = { fg = colors[3] },
        },
        warn = {
            provider = diagnostics_of(lsp_diagnostics_info, 'warns'),
            right_sep = ' ',
            enabled = enable_diagnostic(lsp_diagnostics_info, 'warns'),
            hl = { fg = colors[9] },
        },
        info = {
            provider = diagnostics_of(lsp_diagnostics_info, 'infos'),
            right_sep = ' ',
            enabled = enable_diagnostic(lsp_diagnostics_info, 'infos'),
            hl = { fg = colors[5] },
        },
        hint = {
            provider = diagnostics_of(lsp_diagnostics_info, 'hints'),
            right_sep = ' ',
            enabled = enable_diagnostic(lsp_diagnostics_info, 'hints'),
            hl = { fg = colors[1] },
        },
    },
}

local components = {
    left = {
        active = {
            component_defs.vi_mode,
            component_defs.file.info,
        },
        inactive = {
            component_defs.vi_mode,
        },
    },
    right = {
        active = {
            component_defs.diagnostic.hint,
            component_defs.diagnostic.info,
            component_defs.diagnostic.warn,
            component_defs.diagnostic.err,
            component_defs.file.type,
        },
    },
}

require('feline').setup {
    components = components,
}
