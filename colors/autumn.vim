set background=dark

let g:colors_name = 'autumn'

lua package.loaded['themes.autumn'] = nil

lua require'lush'(require'themes.autumn')
