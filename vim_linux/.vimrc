"******************************************************************************
"general configuration
"******************************************************************************
execute pathogen#infect()
filetype plugin indent on

"******************************************************************************
"colorscheme
"******************************************************************************
syntax enable           "syntax highlighting
set background=dark     "background color

if !has('gui_running')
    let g:solarized_termcolors=256
    set t_Co=256
endif
colorscheme solarized

"******************************************************************************
"filetype detection
"******************************************************************************
autocmd BufNewFile,BufRead *.edl   set syntax=cpp

"******************************************************************************
"display options
"******************************************************************************
set number          "number lines
"set colorcolumn=80  "colored bar at the 80th column

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"statusline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 "set statusline always on

"left info
set statusline=\ %m                                     "modified flag
set statusline+=%t                                      "tail of the filename
set statusline+=%r                                      "read only flag
set statusline+=\ %{expand('%:p:h')}                    "full file path
"set statusline+=\ %y                                    "filetype
"set statusline+=\ [enc:%{strlen(&fenc)?&fenc:'none'},   "file encoding
"set statusline+=\ fmt:%{&ff}]                           "file format

"right info
set statusline+=%=\ \ \ \ BN:\ %{bufnr('%')}\ \ \       "buffer number
set statusline+=%=%{fugitive#statusline()}\ \           "current git branch
"set statusline+=%=%{strftime('%a\ %d\ %b\ %Y\ \ \ ')}   "date

" *****************************************************************************
"Change the window-local current directory to be the same as the directory of
"the current file.
" *****************************************************************************
    "NOTE: There is no easy way to test for this autocmd in a script like there
    "is for the 'autochdir' option.
autocmd BufEnter * silent! lcd %:p:h

"******************************************************************************
"gui options
"******************************************************************************
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"******************************************************************************
"editing options
"******************************************************************************
set encoding=utf-8  "default file encoding

set tabstop=4       "show existing tab with 4 spaces width
set shiftwidth=4    "when indenting with '>', use 4 spaces width
set expandtab       "on pressing tab, insert 4 spaces
set softtabstop=4   "number of spaces a <Tab> counts for when editing

set tw=79           "textwidth (i.e. wrapping)

"set values of backspace, to delete over line breaks, or automatically-inserted
"indentation, or the place where insert mode started
"(for some reason none of these are set by default in Vim 7.4)
"set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set a dictionary for CTRL-N autocomplete
set dictionary+=/usr/share/dict/words
set dictionary+=/usr/share/dict/

"enable dictionary completion source (For the CTRL-N shortcut in insert mode)
"autocmd FileType markdown,text,tex set complete+=k
set complete+=k

"******************************************************************************
"@ mappings
"******************************************************************************
nmap @s = :SyntasticToggleMode<CR>

let @d = 'yyp:s/./-/g
kddPj^' "underline with dashes
let @e = 'yyp:s/./=/g
kddPj^' "underline with equals signs
let @w = 'ma:%s/^\s*$//g
`a'  "remove whitespace from empty lines

"******************************************************************************
"plugins
"******************************************************************************

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

"replace Vim's default search with an EasyMotion search for n characters.
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"remap `n` and `N` to EasyMotion
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"hjkl motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"keep cursor column when JK motion
let g:EasyMotion_startofline = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = '-std=c++11'
"let g:syntastic_cpp_compiler_options = '-std=c++14 -stdlib=libc++'

"set syntax checkers
let g:syntastic_aggregate_errors = 1

"add sgx include directories
let g:syntastic_cpp_include_dirs = ['/opt/intel/sgxsdk/include', '../Include', './libs/', './libs/remote_attestation', './libs/bitcoin-abc']

"let g:syntastic_go_checkers=['go']
"let g:syntastic_c_checkers=['gcc']
"let g:syntastic_cpp_checkers=['gcc']
"let g:syntastic_go_checkers=['go', 'gometalinter']
"let g:syntastic_python_checkers=['python']
"let g:syntastic_python_checkers=['flake8']
"let g:syntastic_sql_checkers=['sqlint']
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"let g:syntastic_ocaml_checkers = ['merlin']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"trim trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map to <C-N>
nmap <silent> <C-N> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"delimitmate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_matchpairs = "(:),[:],{:}"  "matched characters
let delimitMate_quotes = "\" '"             "matched quote marks

"enable 'expansion' (correct white space and positioning of cursor when
"pressing <Return> between matched characters)
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"let delimitMate_jump_expansion = 1 "move cursor past closing character of expanded pair

"balance matched pair when an opening character is added before an unpaired
"closing character
let delimitMate_balance_matchpairs = 1

"disable autoclose except for certain filetypes
let b:delimitMate_autoclose = 0
autocmd FileType c,cpp,go,java,python,ocaml,tex let b:delimitMate_autoclose = 1
