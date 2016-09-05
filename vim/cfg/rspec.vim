" let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
let g:rspec_command = "!rspec --drb {spec}"
" RSpec.vim mappings
map <Leader><S-r> :call RunCurrentSpecFile()<CR>
map <Leader>rsn :call RunNearestSpec()<CR>
map <Leader>rsl :call RunLastSpec()<CR>
map <Leader>rsa :call RunAllSpecs()<CR>
