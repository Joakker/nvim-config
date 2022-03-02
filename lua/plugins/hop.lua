local wk = require 'which-key'
local hp = require 'hop'
local hd = require('hop.hint').HintDirection

hp.setup {}

wk.register {
    f = {
        partial(hp.hint_char1, {
            direction = hd.AFTER_CURSOR,
            current_line_only = true,
            inclusive_jump = true,
        }),
        'Find Forwards',
    },
    F = {
        partial(hp.hint_char1, {
            direction = hd.BEFORE_CURSOR,
            current_line_only = true,
            inclusive_jump = true,
        }),
        'Find Backwards',
    },
    t = {
        partial(hp.hint_char1, {
            direction = hd.AFTER_CURSOR,
            current_line_only = true,
        }),
        'Towards (forward)',
    },
    T = {
        partial(hp.hint_char1, {
            direction = hd.BEFORE_CURSOR,
            current_line_only = true,
        }),
        'Towards (backward)',
    },
}

wk.register({
    w = { hp.hint_words, 'Hop Word' },
    l = { hp.hint_lines_skip_whitespace, 'Hop Lines' },
}, { prefix = '<leader><leader>' })
