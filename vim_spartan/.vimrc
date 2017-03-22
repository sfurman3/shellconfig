syntax on
filetype plugin indent on

" Set values of backspace, to delete over line breaks, or automatically-inserted
" indentation, or the place where insert mode started
" (for some reason none of these are set by default in Vim 7.4
set backspace=indent,eol,start

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
"set statusline+=%=%{strftime('%a\ %d\ %b\ %Y\ \ \ ')}   "date

"Change the window-local current directory to be the same as the directory of
"the current file.
    "NOTE: There is no easy way to test for this autocmd in a script like there
    "is for the 'autochdir' option.
autocmd BufEnter * silent! lcd %:p:h

"Keymappings for custom macros
    "Add Markdown-style 'dash' underline to a line of text
kddPj^' @d = 'yyp:s/./-/g
    "Add Markdown-style 'equal-sign' underline to a line of text
kddPj^' @e = 'yyp:s/./=/g
    "Remove whitespace from empty lines
`a' let @w = 'ma:%s/^\s*$//g

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

"Textwidth (i.e. wrapping)
set tw=79

"Colored bar at the 80th column
set colorcolumn=80

" Settings for Solarized colorscheme
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized
