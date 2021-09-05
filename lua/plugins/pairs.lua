local npairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'
local cond = require 'nvim-autopairs.conds'

npairs.setup {}

npairs.add_rules {
    -- Python
    Rule("'''", "'''", { 'python' }),
    Rule('"""', '"""', { 'python' }),

    -- Latex
    Rule('$', '$', { 'latex' }):with_move(cond.none()),
    Rule('$$', '$$', { 'latex' }),
}
