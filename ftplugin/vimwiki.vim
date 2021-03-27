lua require 'completion'.on_attach()

imap <buffer> <TAB>     <Plug>(completion_smart_tab)
imap <buffer> <S-TAB>   <Plug>(completion_smart_s_tab)
inoremap <buffer><expr> <C-f>  vimwiki#tbl#kbd_tab()
inoremap <buffer><expr> <C-b>  vimwiki#tbl#kbd_shift_tab()
