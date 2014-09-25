set nocompatible              " be improved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'      " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'vim-scripts/YankRing.vim'       " History of yanked lines

"------------------=== Editing ===----------------------
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-ragtag'               " Closing html-tags
Plugin 'jiangmiao/auto-pairs'           " Autoclosing ', \", etc.
Plugin 'justinmk/vim-sneak'             " Fast moving
Plugin 'kshenoy/vim-signature'          " Shows marks

Plugin 'xolox/vim-notes'                " Notes 
Plugin 'xolox/vim-misc'                 " dep. for vim-notes

"--------------=== Snippets support ===---------------
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'             " Snippets repo
Plugin 'Valloric/YouCompleteMe'

"---------------=== Languages support ===-------------
" --- Common ---
Plugin 'tomtom/tcomment_vim'            " Commenting/uncommenting lines of code
Plugin 'nathanaelkane/vim-indent-guides' " Showing indent lines
Plugin 'craigemery/vim-autotag'         " Updating tags file on saving
Plugin 'aperezdc/vim-template'          " Inserting templates in new files

" --- Python ---
Plugin 'klen/python-mode'               " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

call vundle#end()                       " required

filetype on
filetype plugin on
filetype plugin indent on

"Snippets dir
let g:snippets_dir = "~/.vim/bundle/vim-snippets/snippets"

"UltiSnips
let g:ultisnips_python_style="sphinx"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Jedi:
"disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

"YouCompleteMe:
"1. goto definition/implementation
nnoremap <leader>yg :YcmCompleter GoTo<CR>
let g:ycm_collect_identifiers_from_tags_files = 1

"Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
" don't show buffers names if open only one file
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0

"Macroses for quick switching between buffers
nmap <leader>1 <Plug>AirlineSelectTab1i
nmap <leader>2 <Plug>AirlineSelectTab2i
nmap <leader>3 <Plug>AirlineSelectTab3i
nmap <leader>4 <Plug>AirlineSelectTab4i
nmap <leader>5 <Plug>AirlineSelectTab5i
nmap <leader>6 <Plug>AirlineSelectTab6i
nmap <leader>7 <Plug>AirlineSelectTab7i
nmap <leader>8 <Plug>AirlineSelectTab8i
nmap <leader>9 <Plug>AirlineSelectTab9i

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

"TagBar
let g:tagbar_autofocus = 0 " disable autofocus on Tagbar

"Indent guides
let g:indent_guides_guide_size = 1

"Correct ctags binary
let g:autotagCtagsCmd = "/usr/local/bin/ctags"

"File with yankring history
let g:yankring_history_dir = "$HOME/.vim"

"Notes directory
let g:notes_directories = ['~/Documents/notes']

" NERDTree options
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

if has("mac")
  set guifont=Consolas:h13
  set fuoptions=maxvert,maxhorz
endif

"Support Cyrillic mapping
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,фa,ыs,вd,аf,пg,рh,оj,лk,дl,яz,чx,сc,мv,иb,тn,ьm,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,х[,Х{,ъ],ж\\;,Ж:,э',Э\\",б\\,,Б<,ю.,Ю>

"For using local .vimrc files
set exrc
set secure

"Indent, tabs, spaces
set ts=4
set cindent shiftwidth=4
set expandtab
set softtabstop=4


set autowrite backup
set bs=indent,eol,start
set incsearch
set isfname-==

"Mixing relative and original linenumbers:
" 2
" 1
"10 <- this is a current line
" 1
" 2
set nu
set rnu

set spell

set langmenu=uk_ua.koi8-u
set textwidth=120

" ---== Keyboard mappings ==---

"TaskList
map <F2> :TaskList<CR>

"F3 - open Yankring window
nmap <F3> :YRShow<cr>
imap <F3> <esc>:YRShow<cr>

"TagBar
map <F5> :TagbarToggle<CR>

"F6 - switch to the next buffer
imap <C-F6> <Esc>:bn<Cr>i
map <C-F6> :bn<CR>

" F10 - open/close NERDTree
nmap <F10> :NERDTreeToggle<cr>
imap <F10> <esc>:NERDTreeToggle<cr>

" Jump to the next line from the beginning of previous one
set whichwrap=b,s,<,>,[,]

" File encoding menu
set wildmenu
set wcm=<Tab>
    menu Encoding.koi8-r       :e ++enc=koi8-r<CR>
    menu Encoding.koi8-u       :e ++enc=koi8-u<CR>
    menu Encoding.windows-1251 :e ++enc=cp1251<CR>
    menu Encoding.ibm-866      :e ++enc=ibm866<CR>
    menu Encoding.utf-8        :e ++enc=utf-8 <CR>


autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Jump to the last position next opening 
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
    if v:version >= 700
        set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
    else
        set list listchars=tab:»·,trail:·,extends:…
    endif
else
    if v:version >= 700
        set list listchars=tab:>-,trail:.,extends:>,nbsp:_
    else
        set list listchars=tab:>-,trail:.,extends:>
    endif
endif
set list

" Turn off any existing search
if has("autocmd")
    au VimEnter * nohls
endif

" Use movement commands with ~ : ~w - change word register
set tildeop
