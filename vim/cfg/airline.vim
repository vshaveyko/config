let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1

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
let g:airline_theme='wombat'
let g:airline#extensions#ycm#enabled = 1

let g:airline#extensions#tabline#buffer_nr_show = 1

function! AirlineInit()
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_warning = airline#section#create(['whitespace'])
  " let g:airline_section_error = ''
endfunction

autocmd User AirlineAfterInit call AirlineInit()
