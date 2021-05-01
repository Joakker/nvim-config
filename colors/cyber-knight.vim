set background=dark
let g:colors_name='cyber-knight'

lua << EOF

package.loaded['lush_theme.cyber-knight'] = nil

require'lush'(require'lush_theme.cyber-knight')

EOF
