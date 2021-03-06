let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1

let g:airline#extensions#wordcount#enabled=0

let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 :execute "normal \<Plug>AirlineSelectTab1"<cr>
nmap <leader>2 :execute "normal \<Plug>AirlineSelectTab2"<cr>
nmap <leader>3 :execute "normal \<Plug>AirlineSelectTab3"<cr>
nmap <leader>4 :execute "normal <Plug>AirlineSelectTab4"<cr>
nmap <leader>5 :execute "normal <Plug>AirlineSelectTab5"<cr>
nmap <leader>6 :execute "normal <Plug>AirlineSelectTab6"<cr>
nmap <leader>7 :execute "normal <Plug>AirlineSelectTab7"<cr>
nmap <leader>8 :execute "normal <Plug>AirlineSelectTab8"<cr>
nmap <leader>9 :execute "normal <Plug>AirlineSelectTab9"<cr>

let g:airline_powerline_fonts = 1 " use font for triangles
set laststatus=2

let g:airline_detect_paste=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#ycm#enabled = 0

let g:airline_theme='wombat'

let g:airline#extensions#tabline#buffer_nr_show = 1
"
" function! xkblayoutstatus()
"   let keyboard_layout = libcall(g:xkbswitchlib, 'xkb_switch_getxkblayout', '')
"
"   let short_codes = {'0': 'en', '2': 'ru'}
"
"   if has_key(short_codes, keyboard_layout)
"     let keyboard_layout = short_codes[keyboard_layout]
"   endif
"
"   return keyboard_layout
" endfunction

function! AirlineInit()
  " call airline#parts#define_function('xkblayout', 'XkblayoutStatus')

  " let g:airline_section_x = airline#section#create(['xkblayout'])
  let g:airline_section_y = ''
  let g:airline_section_warning = airline#section#create(['whitespace'])
  " let g:airline_section_error = ''
endfunction

" autocmd! UltiSnips_AutoTrigger

autocmd! User AirlineAfterInit
autocmd User AirlineAfterInit call AirlineInit()
