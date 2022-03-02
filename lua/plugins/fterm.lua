local ft = require 'FTerm'
local wk = require 'which-key'

ft.setup {}

wk.register { ['<F7>'] = { ft.toggle, 'Toggle Fterm' } }
wk.register({ ['<F7>'] = { ft.toggle, 'Toggle Fterm' } }, { mode = 't' })
