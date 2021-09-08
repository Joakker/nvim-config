local Rule = require 'nvim-autopairs.rule'
local npairs = require 'nvim-autopairs'

npairs.setup {}

npairs.add_rules {
    -- Global pairs
    Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('', ' )')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match '.%)' ~= nil
        end)
        :use_key ')',
    Rule('', ' }')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match '.%}' ~= nil
        end)
        :use_key '}',
    Rule('', ' ]')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match '.%]' ~= nil
        end)
        :use_key ']',
}
