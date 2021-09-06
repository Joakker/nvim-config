local npairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'
local cond = require 'nvim-autopairs.conds'

npairs.setup {}

npairs.add_rules {
    -- Globals
    Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match '.%)' ~= nil
        end)
        :use_key ')',
    Rule('{ ', ' }')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match '.%}' ~= nil
        end)
        :use_key '}',
    Rule('[ ', ' ]')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match '.%]' ~= nil
        end)
        :use_key ']',

    -- Python
    Rule("'''", "'''", { 'python' }),
    Rule('"""', '"""', { 'python' }),

    -- Latex
    Rule('$', '$', { 'latex' }):with_move(cond.none()),
    Rule('$$', '$$', { 'latex' }),

    -- ECMAScript
    Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'javascript' })
        :use_regex(true)
        :set_end_pair_length(2),
}
