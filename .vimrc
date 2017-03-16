" **************************************************
" Configuration for Vundle ("Vim bundle" -- a Vim plugin manager)

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" MY PLUGINS
" ----------
" Versatile plugins (no depencies)
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'danro/rename.vim'
Plugin 'duff/vim-bufonly'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/pythoncomplete'
Plugin 'fatih/vim-go'
Plugin 'exu/pgsql.vim'

" Plugins with dependencies
Plugin 'majutsushi/tagbar'
Plugin 'Rip-Rip/clang_complete'
"Plugin 'vim-scripts/Conque-Shell'
"Plugin 'vim-scripts/Conque-GDB'
"Plugin 'vim-scripts/OmniCppComplete'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" END (Vundle)
" **************************************************

" **************************************************
" Vim general settings

" Set values of backspace, to delete over line breaks, or automatically-inserted
" indentation, or the place where insert mode started
" (for some reason none of these are set by default in Vim 7.4
set backspace=indent,eol,start

" END (Vim general settings)
" **************************************************


" **************************************************
" NERD Commenter Settings

" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" END (NERD C... Settings)
" **************************************************


" **************************************************
" CtrlP Settings

"Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"When invoked without an explicit starting directory, CtrlP will set its local
"working directory according to:
let g:ctrlp_working_path_mode = 'ca'

" END (CtrlP Settings)
" **************************************************


" **************************************************
" EasyMotion settings

" n-character search motion
    " Replace Vim's default search with an EasyMotion search for n characters.
    " Use <Tab> and <S-Tab> to scroll down/up a page.
    " Press <CR> to get the usual EasyMotion highlighting.
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" hjkl motions
" Configure EasyMotion to avoid repetitive use of the h j k and l keys.
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" END (CtrlP Settings)
" **************************************************


" **************************************************
" Syntastic settings

" Map toggling of syntastic to @s
nmap @s = :SyntasticToggleMode<CR>

" Set the (full path to) the shell syntastic will use to run the checkers.
" ------------------------------------------------------------------------
let g:syntastic_shell = "/usr/local/bin/bash"

" Set up syntax checkers
" ----------------------
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_checkers=['gcc']
let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_go_checkers=['go']
"let g:syntastic_go_checkers=['go', 'golint', 'govet']
let g:syntastic_sql_checkers=['sqlint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" Enable Syntastic to use merlin for syntax checking in ocaml
let g:syntastic_ocaml_checkers = ['merlin']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" END (Syntastic Settings)
" **************************************************


" **************************************************
" DelimitMate settings

" Set the characters that are matched by DelimitMate
let delimitMate_matchpairs = "(:),[:],{:}"

" Set the quote marks that are matched by DelimitMate
let delimitMate_quotes = "\" '"

" Turn on "expansion" e.g. correct white space and positioning of cursor when
" pressing <Return> between {}
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Move the cursor past the closing brace, quote, etc. of an expanded pair
"let delimitMate_jump_expansion = 1

" Balances a matched pair when an opening character is added before an unpaired
" closing character
let delimitMate_balance_matchpairs = 1

" Turn off autoclose except for certain filetypes
let b:delimitMate_autoclose = 0
autocmd FileType c,cpp,go,java,python,ocaml,tex let b:delimitMate_autoclose = 1

" END (DelimitMate Settings)
" **************************************************


" **************************************************
" Tagbar settings

" Map TagbarToggle to F8 and @t
nmap <F8> :TagbarToggle<CR>
nmap @t :TagbarToggle<CR>

" Expanded the vim window by the width of the Tagbar window (1).
" Setting it to (2) will also try expanding a terminal, but note that this is
" not supported by all terminals.
let g:tagbar_expand = 2

" NOTE: I installed ctags with Homebrew for this plugin.

" END (Tagbar  Settings)
" **************************************************


" **************************************************
" NERDTree Settings

" Map to <C-N>
nmap <silent> <C-N> :NERDTreeToggle<CR>

" END (NERDTree Settings)
" **************************************************


" **************************************************
" OmniCppComplete Settings

" To extract C/C++ symbols information, the script needs an Exuberant_ctags
" database.

" Build recursively a ctags database from the current directory
"
" If your project contains files of other languages you may add the following
" options:
"         --languages=c++ : Builds only the tags for C++ files.
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 4.5. Show prototype in abbreviation~
let OmniCpp_ShowPrototypeInAbbr = 1

" The internal search function for variable definitions of vim requires that
" the enclosing braces of the function are located in the first column. You can
" change this behaviour with the OmniCpp_LocalSearchDecl option. The local
" version works irrespective the position of braces.
"let OmniCpp_LocalSearchDecl = 1

" Close the Omni-Completion tip window when a selection is made: this line
" closes it on movement in insert mode or when leaving insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Get rid of the preview window when doing a completion.
set completeopt-=preview

" END (OmniCppCompleteSettings)
" **************************************************


" **************************************************
" clang_complete settings

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" END (clang_complete settings)
" **************************************************


" **************************************************
" Settings for Vim's Conceal feature

" Enable Conceal for Markdown and Tex files
autocmd FileType markdown,tex, :set cole=2

" Conceal everything except superscripts and subscripts
"
" a = conceal accents/ligatures
" d = conceal delimiters
" g = conceal Greek
" m = conceal math symbols
" s = conceal superscripts/subscripts
let g:tex_conceal="adgm"

" END (Settings for Vim's Conceal feature)
" **************************************************


" **************************************************
" statusline settings

" Set statusline always on
set laststatus=2

" Set info on the left
set statusline=\ %m                                     "modified flag
set statusline+=%t                                      "tail of the filename
set statusline+=%r                                      "read only flag
set statusline+=\ %y                                    "filetype
set statusline+=\ [enc:%{strlen(&fenc)?&fenc:'none'},   "file encoding
set statusline+=\ fmt:%{&ff}]                           "file format

" Set info on the right
set statusline+=%=\ \ \ \ BN:\ %{bufnr('%')}\ \ \       "buffer number
set statusline+=%=%{fugitive#statusline()}\ \           "current git branch
"set statusline+=%=%{strftime('%a\ %d\ %b\ %Y\ \ \ ')}   "date

" END (Settings for Vim's Conceal feature)
" **************************************************


" **************************************************
" Settings for OCaml programming

" Ocp-indent
" ----------
" Handles the task of indenting your OCaml files. It is an OCaml executable
" that can be used from the command line or directly from your editor.
set rtp+="/Users/sethfurman/.opam/4.03.0/share/ocp-indent/vim"

" Merlin
" ------
" Performs "static analysis" of your source files. The analysis is then used to
" provide error reporting, source browsing, auto-completion and more.
"
" NOTE: You need to run the following command manually in order to update the
" documentation
" :execute "helptags " . substitute(system('opam config var share'),'\n$',','')
" .  "/merlin/vim/doc"
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" END (Settings for OCaml programming)
" **************************************************


" **************************************************
" TaskList.vim settings

" Overwrite the TaskList plugin mapping
map <leader>v <Plug>TaskList

" Set the Tokens to recognize when searching for tasks to complete
let g:tlTokenList = ['TODO', 'FIXME']

" END
" **************************************************


" **************************************************
" Settings for Go Programming

" Shortcuts for building and running a Go program
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" Display the protoype of a function or the type of a variable
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" END (Settings for Go Programming)
" **************************************************


" **************************************************
" Settings for SQL Programming

" make pgsql.vim the default for SQL syntax
let g:sql_type_default = 'pgsql'

" END (Settings for SQL Programming)
" **************************************************


"" **************************************************
"" Settings for Conque-GDB
"" 1: strip color after 200 lines, 2: always with color
"let g:ConqueTerm_Color = 2
"let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
"" display warning messages if conqueTerm is configured incorrectly
"let g:ConqueTerm_StartMessages = 0

"" END (Settings for Conque-GDB)
"" **************************************************


"Change the window-local current directory to be the same as the directory of
"the current file.
    "NOTE: There is no easy way to test for this autocmd in a script like there
    "is for the 'autochdir' option.
autocmd BufEnter * silent! lcd %:p:h

"Keymappings for custom macros
    "Add Markdown-style 'dash' underline to a line of text
    let @d = 'yyp:s/./-/gkddPj^'
    "Add Markdown-style 'equal-sign' underline to a line of text
    let @e = 'yyp:s/./=/gkddPj^'
    "Remove whitespace from empty lines
    let @w = 'ma:%s/^\s*$//g`a'

"Hides buffers instead of closing them.
    "This means that you can have unwritten changes to a file and open a new
    "file using :e, without being forced to write or undo your changes first.
    "Also, undo buffers and marks are preserved while the buffer is open.
    "set hidden

"Autocompletion
    "Autocompletion with CTRL-N
    "Set a dictionary for CTRL-N autocomplete
    set dictionary+=/usr/share/dict/words
    set dictionary+=/usr/share/dict/
    "Enable dictionary completion source (For the CTRL-N shortcut in insert
    "mode)
    set complete+=k

""Omnicompletion - complete syntax words (<CTRL-X><CTRL-O>)
"if has("autocmd") && exists("+omnifunc")
  "autocmd Filetype *
          "\	if &omnifunc == "" |
          "\		setlocal omnifunc=syntaxcomplete#Complete |
          "\	endif
"endif

"Programming formatting
    "Lines numbers
    set number
    set autoindent
    "Syntax highlighting
    syntax enable
    set tabstop=8
    "Convert tabs to spaces
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    "filetype indent plugin on
        "^^^ Redundant b/c exists in Vundle settings above
    "Show (partial) command in the last line of the screen
    set showcmd
    "Automatic folding based on indentation
    set foldmethod=syntax
    "Start with all folds open
    set foldlevelstart=99
    "Python Folding
        "Enable previewing of docstrings in the fold text
        let g:SimpylFold_docstring_preview = 1
        "Prevent Folding of docstrings
        let g:SimpylFold_fold_docstring = 0
        "Prevent Folding of imports
        let g:SimpylFold_fold_import = 0

"Textwidth (i.e. wrapping)
set tw=79

"Colored bar at the 80th column
set colorcolumn=80

"Set the default window size
set lines=45 columns=90


"Set Solarized colorscheme
    "Used limited colors for terminal (assuming you're not using the custom
    "terminal colorscheme provided by solarized)
    let g:solarized_termcolors=256
let g:solarized_contrast='normal'
set background=dark
colorscheme solarized
hi MatchParen cterm=bold ctermbg=none ctermfg=172
