set background=dark

" let g:colors_name = 'lush_template'

lua package.loaded['themes.autumn'] = nil

lua require'lush'(require'themes.autumn')
