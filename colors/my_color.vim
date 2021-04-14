set background=dark
let g:colors_name='my_color'

lua package.loaded['lush_theme.my_theme'] = nil

lua require 'lush' (require 'lush_theme.my_theme' )
