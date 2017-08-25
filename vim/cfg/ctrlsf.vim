let g:ctrlsf_extra_backend_args = { 'ag': ' -i
                                         \ --ignore .git
                                         \ --ignore tags
                                         \ --ignore .svn
                                         \ --ignore .hg
                                         \ --ignore node_modules
                                         \ --ignore bower_components
                                         \ --ignore www
                                         \ --ignore images
                                         \ --ignore fonts
                                         \ --ignore gulp_tasks
                                         \ --ignore log
                                         \ --ignore tmp
                                         \ --ignore bin
                                         \ --ignore .DS_Store
                                         \ --ignore "**/*.pyc"'
                                \ }

let g:ctrlsf_mapping = { "split"   : "<C-O>",
                       \ "vsplit"  : "",
                       \ "tab"     : "`",
                       \ "tabb": "",
                       \ "popen"   : "",
                       \ "popenf"  : "",
                       \ "pquit"   : "q",
                       \ "loclist" : "",
                       \ "chgmode" : "M",
                     \ }

let g:ctrlsf_indent = 2
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_case_sensitive = 'no'

let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=0
let g:ctrlsf_position='bottom'
" let g:ctrlsf_winsize = '100%'
" let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=0
