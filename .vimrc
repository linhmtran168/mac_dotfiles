"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My .vimrc configuration based on the configuration of amix the lucky stiff
"             http://amix.dk - amix@amix.dk
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif

" Remove vi old behavior
set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim plug Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required:
if has('nvim')
  call plug#begin('~/.nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
end


" My Bundles here:

" Editor
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'Lokaltog/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'sjl/vitality.vim'
Plug 'gcmt/taboo.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'YankRing.vim'
Plug 'rizzatti/dash.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
Plug 'terryma/vim-multiple-cursors'

" Coding
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer' }

" Search
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'moll/vim-node'

" Markup
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'othree/html5.vim'
Plug 'wavded/vim-stylus'
Plug 'mustache/vim-mustache-handlebars'
Plug 'JSON.vim'
Plug 'digitaltoad/vim-jade'
Plug 'sukima/xmledit'
Plug 'mxw/vim-jsx'
Plug 'xsbeats/vim-blade'
Plug 'Glench/Vim-Jinja2-Syntax'

" Indent
Plug 'nathanaelkane/vim-indent-guides'

" Ruby & Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'slim-template/vim-slim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" Go
Plug 'fatih/vim-go'

" CSharp
Plug 'OmniSharp/omnisharp-vim', { 'do': 'git submodule update --init --recursive && cd server && xbuild' }
Plug 'OrangeT/vim-csharp'

" Python
Plug 'hdima/python-syntax'

" Scala
Plug 'derekwyatt/vim-scala'

" Vim themes
Plug 'chriskempson/base16-vim'

call plug#end()

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
nnoremap <space> <nop>
let mapleader   = "\<space>"
let g:mapleader = "\<space>"

" Fast saving
nmap <leader>w :w!<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Set default shell
set shell=/usr/local/bin/zsh

" No showmatch
set noshowmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

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

set lazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

set scrolloff=5 "Always 5 lines above/below the cursor

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" Fold option
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"Set font
set gfn=Sauce\ Code\ Powerline\ Light:h12
set background=dark
set t_Co=256

if has('gui_running')
  set guioptions-=T
  set guioptions-=e
  colorscheme base16-eighties
else
  let base16colorspace=256
  colorscheme base16-eighties
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
try
  lang en_US
catch
endtry

" Set Unix as the standard file type
set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
"
"Persistent undo
try
    set undodir=~/.vim/undodir

    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable hightlight when <leander><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Split
set splitbelow
set splitright

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leaner>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
" set viminfo^=%


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2
set noshowmode

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


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

"For mac
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>gr :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and of
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
      execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
      call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
  elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
      execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
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

func! DeleteTillSlash()
  let g:cmd = getcmdline()

  if has("win16") || has("win32")
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  endif

  if g:cmd == g:cmd_edited
    if has("win16") || has("win32")
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif
  endif

  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerShowRelativePath=1

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/usr/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My personal configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General setting
" Sets show line number
set number
" Show relative line number
set relativenumber
set ttyfast
set fillchars=diff:·
" Fix ruby slow navigation
set re=1
" Fix popup
map q: :q

" Set xterm2 mouse mode to allow resizing of splits with mouse inside tmux
set ttymouse=xterm2
" Highlight cursor line.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
" Make trailing whitespace annoyingly highlighted.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Fast reload vimrc
map <leader>vi :so $MYVIMRC<CR>

" Tmux
" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"""
" Plugin settings
"""
"" NERDTree Configuration
let NERDTreeChDirMode                   = 2
let NERDTreeShowBookmarks               = 1
let NERDTreeWinSize                     = 30
let NERDTreeQuitOnOpen                  = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
nmap <leader>n :NERDTreeMirrorToggle<CR>

"" Ctrlp.vim
let g:ctrlp_map = '<leader>j'
noremap <leader>f :CtrlPMRU<CR>
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>g :CtrlPGhq<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir'  : '\v[\/](\.(git|hg|svn|bzr|DS_Store|coffee)|node_modules|)$',
  \ 'file' : '\v\.(o|swp|pyc|wav|mp3|ogg|blend|exe|so|dll)$',
  \ }

"" Tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_width  = 30
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
  \  'o' : 'object'
  \ },
  \ 'sro'       : ".",
  \ 'ctagsbin'  : 'coffeetags',
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
    autocmd FileType json set textwidth=78
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END

"" Jade template syntax
au BufRead,BufNewFile *.jade set ft=jade syntax=jade

"" Less template syntax
au BufRead,BufNewFile *.less set ft=less syntax=less

"" Blade template filytype
au BufRead,BufNewFile *.blade.php set ft=html syntax=blade

"" Indent html
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"

"" Indent for python, c, cpp, c#, go, java
autocmd FileType python,c,cpp,markdown,cs,go,java set softtabstop=4
autocmd FileType python,c,cpp,markdown,cs,go,java set shiftwidth=4
autocmd FileType python,c,cpp,markdown,cs,go,java set tabstop=4

"" DelimitMate
let delimitMate_expand_space = 1
let delimitMate_matchpairs   = "(:),[:],{:}"

"" Ultisnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsListSnippets        = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

"" YankRing
nmap <leader>y :YRShow<CR>

"" Tabular
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:<CR>
vmap <leader>a: :Tabularize /:<CR>

"" Gundo
nnoremap <leader>gu :GundoToggle<CR>
let g:gundo_close_on_revert = 1

"" Vim indent guides
let indent_guides_enable_on_vim_startup = 1

"" Vim Airline
set timeoutlen=1000 ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = -1

"" Markdown
let g:vim_markdown_folding_disabled=1

"" Emmet
let g:user_emmet_leader_key="<c-e>"

"" Taboo
let g:taboo_tab_format=' %N %f%m '

"" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"" Ag.vim
nnoremap <leader>a :Ag ""<left>

"" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_autoclose_preview_window_after_insertion = 1

"" Haskell
autocmd FileType haskell set softtabstop=4
autocmd FileType haskell set tabstop=8
autocmd FileType haskell set shiftwidth=4
autocmd FileType haskell set shiftround
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"" Omnisharp
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
augroup END

"" Vim Plug options
let g:plug_timeout = 360
let g:plug_retries = 5

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" C#
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" Javascript
let g:syntastic_javascript_checkers = ['eslint']

"" Dash
:nmap <silent> <leader>da <Plug>DashSearch

"" For quick find git conflict
function! FindConflict()
  try
    /<<<<<<<
  catch
  endtry
endfunction
nnoremap <leader>gc :call FindConflict()<CR>
