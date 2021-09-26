local modeutils = require 'feline.providers.vi_mode'
local lsp_utils = require 'feline.providers.lsp'

---@type table<string,string>
local VI_MODES = {
    n = '',
    i = '',
    c = '',
    v = '',
    V = '﯎',
    [''] = '',
}

---Makes the necessary provider for diagnostic component with the given level.
---@param level '"Information"'|'"Hint"'|'"Warning"'|'"Error"'
---@return function
local function make_diag_provider(level)
    return function(winid)
        local count = lsp_utils.get_diagnostics_count(
            level,
            vim.api.nvim_win_get_buf(winid)
        )
        return count ~= 0 and count or ''
    end
end

---Makes the '' separator for diagnostic components.
---@param fg string
---@param bg string
---@return table
local function make_diag_separator(fg, bg)
    return {
        str = 'left_filled',
        always_visible = true,
        hl = {
            fg = fg,
            bg = bg,
        },
    }
end

-- Component definitions.
local definitions = {
    vi_mode = {
        right_sep = 'right_filled',
        hl = function()
            return {
                fg = modeutils.get_mode_color(),
                bg = '#3A3A3A',
            }
        end,
        provider = function()
            local mode = vim.fn.mode()
            local icon = VI_MODES[mode]
            local fmt = ' %s '
            if not icon then
                return fmt:format(mode)
            end
            return fmt:format(icon)
        end,
    },
    file_info = {
        provider = 'file_info',
        left_sep = ' ',
        right_sep = 'right_filled',
    },

    lsp_hint = {
        left_sep = make_diag_separator '#33B389',
        provider = make_diag_provider 'Hint',
        hl = {
            bg = '#33B389',
        },
    },
    lsp_info = {
        left_sep = make_diag_separator('#333399', '#33B389'),
        provider = make_diag_provider 'Information',
        hl = {
            bg = '#333399',
        },
    },
    lsp_warn = {
        left_sep = make_diag_separator('#FF9E64', '#333399'),
        provider = make_diag_provider 'Warning',
        hl = {
            bg = '#FF9E64',
        },
    },
    lsp_errs = {
        left_sep = make_diag_separator('#DD2040', '#FF9E64'),
        provider = make_diag_provider 'Error',
        hl = {
            bg = '#DD2040',
        },
    },
    lsp_clients = {
        provider = 'lsp_client_names',
        hl = {
            fg = '#FF6E33',
        },
    },

    git = {
        provider = 'git_branch',
        icon = {
            str = '  ',
            hl = {
                fg = 'yellow',
            },
        },
        left_sep = {
            str = 'slant_left_thin',
            hl = {
                fg = 'white',
            },
        },
    },
    git_add = {},

    file_pos = {
        left_sep = {
            str = 'slant_left',
            hl = {
                fg = '#3A3A3A',
                bg = '#DD2040',
            },
        },
        provider = 'position',
        right_sep = 'block',
        hl = {
            bg = '#3A3A3A',
        },
    },
    scroll_bar = {
        provider = 'scroll_bar',
    },
}

-- The actual components in the statusline.
local components = {
    active = {
        {
            definitions.vi_mode,
            definitions.file_info,
        },
        {
            definitions.lsp_clients,
        },
        {
            definitions.lsp_hint,
            definitions.lsp_info,
            definitions.lsp_warn,
            definitions.lsp_errs,
            definitions.file_pos,
            definitions.scroll_bar,
        },
    },
    inactive = {
        {},
        {},
        {},
    },
}

require('feline').setup {
    components = components,
}
