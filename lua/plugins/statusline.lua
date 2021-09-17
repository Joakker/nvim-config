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

    lsp_errs = {
        left_sep = {
            str = 'left',
            hl = {
                fg = 'white',
            },
        },
        enabled = function()
            local count = lsp_utils.get_diagnostics_count 'Error'
            return count and count ~= 0
        end,
        provider = function()
            local count = lsp_utils.get_diagnostics_count 'Error'
            return (' %s '):format(count)
        end,
        hl = {
            fg = '#DD2040',
        },
    },
    lsp_warn = {
        left_sep = {
            str = 'left',
            hl = {
                fg = 'white',
            },
        },
        right_sep = '',
        enabled = function()
            local count = lsp_utils.get_diagnostics_count 'Warning'
            return count and count ~= 0
        end,
        provider = function()
            local count = lsp_utils.get_diagnostics_count 'Warning'
            return (' %s '):format(count)
        end,
        hl = {
            fg = '#FF9E64',
        },
    },
    lsp_info = {
        left_sep = {
            str = 'left',
            hl = {
                fg = 'white',
            },
        },
        enabled = function()
            local count = lsp_utils.get_diagnostics_count 'Information'
            return count and count ~= 0
        end,
        provider = function()
            local count = lsp_utils.get_diagnostics_count 'Information'
            return (' %s '):format(count)
        end,
        hl = {
            fg = '#333399',
        },
    },
    lsp_hint = {
        left_sep = {
            str = 'left',
            hl = {
                fg = 'white',
            },
        },
        enabled = function()
            local count = lsp_utils.get_diagnostics_count 'Hint'
            return count and count ~= 0
        end,
        provider = function()
            local count = lsp_utils.get_diagnostics_count 'Hint'
            return (' %s '):format(count)
        end,
        hl = {
            fg = '#33B389',
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
        provider = 'position',
        left_sep = 'slant_left',
        right_sep = 'block',
        hl = {
            bg = '#3A3A3A',
        },
    },
    scroll_bar = {
        provider = 'scroll_bar',
    },
}

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
            definitions.git,
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
