local luasnip = require 'luasnip'
local util = require 'snippets._utils'

local s = luasnip.s
local i = luasnip.i
local t = luasnip.t
local f = luasnip.f

local receiver_node = f(function(args)
    ---@type string
    local text = args[1][1]

    local letter = util.first_letter(text)
    if letter then
        return letter:lower()
    end

    return ''
end, 2)

return {
    s('tyi', {
        t 'type ',
        i(1, 'Name'),
        t { ' interface {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),
    s('tys', {
        t 'type ',
        i(1, 'Name'),
        t { ' struct {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),

    s('func', {
        t 'func ',
        i(1, 'Name'),
        t '(',
        i(2),
        t ')',
        util.conditional_space(3),
        i(3),
        t { ' {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),
    s('meth', {
        t 'func (',
        receiver_node,
        util.conditional_space(2),
        i(2),
        t ') ',
        i(1, 'Name'),
        t '(',
        i(3),
        t ')',
        util.conditional_space(4),
        i(4),
        t { ' {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),

    s('if', {
        t 'if ',
        i(1, 'true'),
        t { ' {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),

    s('fori', {
        t 'for ',
        i(1, 'i := 0'),
        t ';',
        i(2, 'i < 10'),
        t ';',
        i(3, 'i++'),
        t { ' {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),
    s('for', {
        t 'for ',
        i(1, 'k, v'),
        t ' := range ',
        i(2, 'expr'),
        t { ' {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),
    s('while', {
        t 'for ',
        i(1, 'true'),
        t { ' {', '' },
        t '\t',
        i(0),
        t { '', '}' },
    }),
}
