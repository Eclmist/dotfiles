set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'tikhomirov/vim-glsl'

call vundle#end()            " required
filetype plugin indent on    " required re-enables filetype detection

" Airline~
let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='violet'

    if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

" Ctrl-P Funky Search
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=~,*.swp,*.tmp

" Mist ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    syntax on " Syntax highlighting

    set title " Change terminal title
    set number " Line Numbering
    set relativenumber " Relative line numbering
    set ruler " Cursor position in airline
    set wrap " Enable line wrapping
    set ts=4 sts=4 sw=4 expandtab " 4 spaces for tabs
    set smarttab " weird
    set autoindent " yea, no real reason to explain this

    " Disable arrow keys
    map <Down> <NOP>
    map <Up> <NOP>
    map <Left> <NOP>
    map <Right> <NOP>

    " jj to escape
    inore jj <Esc>

    " allow hidden buffers
    set hidden

    " set characters for tabs trails etc.
    nmap <leader>l :set list!<CR>
    set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:¬

    " _$ to remove all trailing white spaces
    " Function to make the cursor jump back and clean search history
    function! Preserve(command)
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        execute a:command
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

    nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
    nmap _= :call Preserve("normal gg=G")<CR>

    " Filetype specific indentation rules
    if has("autocmd")
        autocmd FileType javascript set ts=2 sts=2 sw=2 noet " 2 spaces for js
        autocmd FileType vue set ts=2 sts=2 sw=2 noet " 2 spaces for .vue
        autocmd FileType html set ts=2 sts=2 sw=2 noet " 2 spaces for .html
    endif

    " Map C-w h to just C-h, etc (swithing windows)
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
