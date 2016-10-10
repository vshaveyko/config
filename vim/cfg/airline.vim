let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1

let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline_powerline_fonts = 1 " use font for triangles
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#hunks#enabled=0
let g:airline_theme='wombat'
let g:airline#extensions#ycm#enabled = 1

function! AirlineInit()
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_warning = airline#section#create(['whitespace'])
  let g:airline_section_error = ''
endfunction
autocmd User AirlineAfterInit call AirlineInit()
