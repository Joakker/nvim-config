set background=dark
let g:colors_name='my_color'

lua << EOF
    package.loaded['lush_theme.my_theme'] = nil
    require'lush'(require 'lush_theme.my_theme')
EOF
