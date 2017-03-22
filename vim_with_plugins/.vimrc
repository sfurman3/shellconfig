" Setup for Vim Pathogen
execute pathogen#infect()

filetype plugin indent on
syntax on

" Vim general settings
        " Set values of backspace, to delete over line breaks, or automatically-inserted
        " indentation, or the place where insert mode started
        " (for some reason none of these are set by default in Vim 7.4)
        set backspace=indent,eol,start

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
            "Show (partial) command in the last line of the screen
            set showcmd
            "Automatic folding based on indentation
            set foldmethod=syntax
            "Start with all folds open
            set foldlevelstart=99

            "Textwidth (i.e. wrapping)
            set tw=79

            "Colored bar at the 80th column (with the given color)
            set colorcolumn=80
            highlight ColorColumn ctermbg=0 guibg=lightgrey

            "Set the default window size
            "set lines=45 columns=90

        "Autocompletion
            "Autocompletion with CTRL-N
            "Set a dictionary for CTRL-N autocomplete
            set dictionary+=/usr/share/dict/words
            set dictionary+=/usr/share/dict/
            "Enable dictionary completion source (For the CTRL-N shortcut in insert
            "mode)
            set complete+=k

        " statusline settings
                " Set the color of the statusline
                highlight Statusline ctermbg=0 ctermfg=0

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

" NERD Commenter Settings
        " Add spaces after comment delimiters by default
        " let g:NERDSpaceDelims = 1

        " Enable trimming of trailing whitespace when uncommenting
        let g:NERDTrimTrailingWhitespace = 1

" NERDTree Settings
        " Map to <C-N>
        nmap <silent> <C-N> :NERDTreeToggle<CR>

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

" Syntastic settings
        " Map toggling of syntastic to @s
        nmap @s = :SyntasticToggleMode<CR>

        " Set the (full path to) the shell syntastic will use to run the checkers.
        " ------------------------------------------------------------------------
        let g:syntastic_shell = "/bin/bash"

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

"" Tagbar settings
        "" Map TagbarToggle to F8 and @t
        "nmap <F8> :TagbarToggle<CR>
        "nmap @t :TagbarToggle<CR>

        "" Expanded the vim window by the width of the Tagbar window (1).
        "" Setting it to (2) will also try expanding a terminal, but note that this is
        "" not supported by all terminals.
        "let g:tagbar_expand = 2

        "" NOTE: I installed ctags with Homebrew for this plugin.

" TaskList.vim settings
        " Overwrite the TaskList plugin mapping
        map <leader>v <Plug>TaskList

        " Set the Tokens to recognize when searching for tasks to complete
        let g:tlTokenList = ['TODO', 'FIXME']
