"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My .vimrc configuration based on the configuration of amix the lucky stiff
"             http://amix.dk - amix@amix.dk
"
"
" Sections:
"    -> General
"    -> Vundle configuration
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"
"    -> Cope
"    -> Minibuffer plugin
"    -> Omni complete functions
"    -> Python section
"    -> JavaScript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove vi old behavior
set nocompatible 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check system configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! MySys()
   return "$1"
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required!
Bundle 'gmarik/vundle'

" My Bundles:
"
" Original repos on github
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'xolox/vim-shell'
Bundle 'xolox/vim-session'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-textobj-user'
Bundle 'jpalardy/vim-slime'

" Javascript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jQuery'
Bundle 'jelera/vim-javascript-syntax'

" Markup
Bundle 'hallison/vim-markdown'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-haml'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'othree/html5.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'wavded/vim-stylus'
Bundle 'JSON.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'linhmtran168/xmledit'
Bundle 'indenthtml.vim'

" Indent
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'michaeljsmith/vim-indent-object'

" Ruby & Rails
Bundle 'tpope/vim-rails'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'skalnik/vim-vroom'

" Haskell
Bundle 'Twinside/vim-syntax-haskell-cabal'
Bundle 'lukerandall/haskellmode-vim'

" Other languages
Bundle 'derekwyatt/vim-scala'
Bundle 'mileszs/ack.vim'
Bundle 'python.vim'
Bundle 'VimClojure'
Bundle 'c.vim'

" Vim scripts repos
Bundle 'ZoomWin'
Bundle 'YankRing.vim'
Bundle 'minibufexpl.vim'
Bundle 'mru.vim'
Bundle 'matchit.zip'
Bundle 'FencView.vim'
Bundle 'sudo.vim'
Bundle 'scratch.vim'
Bundle 'vimwiki'

" Vim themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'peaksea'
Bundle 'Zenburn'
Bundle 'Lucius'

" Non github repos


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=1 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
" if MySys() == "mac"
"   set gfn=:h14
"   set shell=/bin/zsh
" elseif MySys() == "windows"
"   set gfn=Bitstream\ Vera\ Sans\ Mono:h10
" elseif MySys() == "linux"
"   set gfn=DejaVu\ Sans\ Mono\ 11
"   set shell=/bin/zsh
" endif

set gfn=Menlo:h11
set shell=/bin/zsh

if has('gui_running')
  set guioptions-=T
  set lines=36
  set background=dark
  colorscheme solarized 
  set nonu
else
  " set t_Co=256
  " let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  set background=dark
  colorscheme solarized
  set nonu
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    " if MySys() == "windows"
    "   set undodir=C:\Windows\Temp
    " else
    "   set undodir=~/.vim/undodir
    " endif

    set undodir=~/.vim/undodir

    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2
set tabstop=2

set lbr
set tw=500

set ai "Auto indent
" set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" Some useful keys for vimgrep
map <leader>r :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" " 
" From an idea by Michael Naumman
" 
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Useful on some European keyboards
map ½ $
imap ½ $
vmap ½ $
cmap ½ $


func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  " if MySys() == "linux" || MySys() == "mac"
  "   let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  " else
  "   let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  " endif
  " if g:cmd == g:cmd_edited
  "   if MySys() == "linux" || MySys() == "mac"
  "     let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
  "   else
  "     let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
  "   endif
  " endif
  let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  if g:cmd == g:cmd_edited
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>



""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplVSplit = 25
" let g:miniBufExplSplitBelow=1
let g:miniBufExplSplitBelow = 0

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
" au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript setl foldmethod=manual
au FileType javascript setl foldlevelstart=1

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My personal configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Neocomplcache configuration
" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()


" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" superTab like snippets behavior
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings for neocomplcache
" <CR>: close popup and save indent. 
inoremap <expr><CR>  neocomplcache#smart_close_popup()
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" <C-h>, <BS>: close popup and delete backword char. 
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><C-y>  neocomplcache#close_popup() 
inoremap <expr><C-e>  neocomplcache#cancel_popup() 

" Enable heavy omni completion for neocomplcache
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Complete Functions
let g:neocomplcache_omni_functions = {
    \ 'python' : 'pythoncomplete#Complete',
    \ 'ruby' : 'rubycomplete#Complete',
    \}
let g:neocomplcache_vim_completefuncs = {
    \ 'VimShellExecute' : 'vimshell#complete#vimshell_execute_complete#completefunc',
    \ 'VimShellInteractive' : 'vimshell#complete#vimshell_execute_complete#completefunc',
    \ 'VimShellTerminal' : 'vimshell#complete#vimshell_execute_complete#completefunc',
    \}

"" NERDTree Configuration
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinSize = 30
let NERDTreeQuitOnOpen = 1
nmap <leader>n :NERDTreeToggle<CR>

"" Minibuffer Configuration
let g:miniBufExplMapCTabSwitchBufs = 1
set nu!

"" Jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"" Disable auto-comment
au FileType * setlocal comments-=:#
au FileType * setlocal comments-=://
au FileType * setlocal comments-=:--
au FileType * setlocal comments-=:"

"" Easymotion
let g:EasyMotion_leader_key = '<leader>m'

"" Zencoding
let g:use_zen_complete_tag = 1

"" VimShell
noremap <silent> <Leader>v :VimShell<CR>

"" Ctrlp.vim
let g:ctrlp_map = '<leader>j'

"" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_expand = 1

"" CoffeeTags
" Add this type definition to your vimrc
" or do
" coffeetags --vim-conf >> <PATH TO YOUR VIMRC>
" if you want your tags to include vars/objects do:
" coffeetags --vim-conf --include-vars
 let g:tagbar_type_coffee = {
  \ 'kinds' : [
  \   'f:functions',
  \   'o:object'
  \ ],
  \ 'kind2scope' : {
  \  'f' : 'object',
  \   'o' : 'object'
  \},
  \ 'sro' : ".",
  \ 'ctagsbin' : 'coffeetags',
  \ 'ctagsargs' : ' ',
  \}

 "" Scala Tagbar
 let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds' : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \]
\}

""JSON
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd 
    autocmd! 
    autocmd FileType json set autoindent 
    autocmd FileType json set formatoptions=tcq2l 
    autocmd FileType json set textwidth=78 shiftwidth=4 
    autocmd FileType json set softtabstop=4 tabstop=4 
    autocmd FileType json set expandtab 
    autocmd FileType json set foldmethod=syntax 
augroup END

"" delimitMate
au FileType xhtml,html,xml,php let b:delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1

"" Solarized
call togglebg#map("<F5>")

"" Change cursor color between mode in terminal
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;blue\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]12;white\007"
  " use \003]12;gray\007 for gnome-terminal
endif

"" Jade template syntax
au BufRead,BufNewFile *.jade set ft=jade syntax=jade

"" Less template syntax
au BufRead,BufNewFile *.less set ft=less syntax=less

"" Indent html
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"" Slime
let g:slime_target = "tmux"

"" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"" Vimwiki
let g:vimwiki_list = [{ 'path': '~/SkyDrive/Documents/vimwiki', 'syntax': 'markdown', 'ext': '.md' }]

"" Indent for python, java, c, cpp
autocmd FileType python,java,c,cpp,markdown set softtabstop=4
autocmd FileType python,java,c,cpp,markdown set shiftwidth=4
autocmd FileType python,java,c,cpp,markdown set tabstop=4
