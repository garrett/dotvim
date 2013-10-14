" Sexy vim configs with pathogen
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" Enable filetype plugins and indention
filetype on
filetype plugin indent on

" Reload the .vimrc on edit
autocmd BufWritePost .vimrc source %

" Make W and Q work as expected
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" No Vi Compatibility. That just sucks.
set nocompatible

" Fix backspace indentation
set backspace=indent,eol,start

" Popup options
set cpoptions=aABceFs

" Bind SuperTab to vim's OmniComplete
"let g:SuperTabDefaultCompletionType = "context"


" Convince Vim it can use 256 colors inside Gnome Terminal.
" Needs CSApprox plugin
set t_Co=256


" Menus I like :-)
" This must happen before the syntax system is enabled
" aunmenu Help.
" aunmenu Window.
let no_buffers_menu=1

" Enable mouse everywhere
set mouse=a

" Hide mouse pointer while typing
set mousehide
set mousemodel=popup

" Code Folding, everything folded by default
set foldmethod=indent
set foldlevel=99
"set foldenable

" Make mouse middle click paste without formatting it.
map <MouseMiddle> <Esc>"*p

" Better modes.  Remeber where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set directory=~/.vim/sessions
"set backupcopy=no
"set nowritebackup

" Turn off annoying swapfiles
set noswapfile

" Set persistent undo (v7.3 only)
set undodir=~/.vim/undodir
set undofile

" Enable Syntax Colors
syntax on
if has("gui_running")
  set guifont=Mensch\ 12
  "set guifont=Inconsolata\ 11
else
  "colorscheme mustang
endif

set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"call togglebg#map("<F5>")

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Set <leader> to ',' and <localleader> to "\"
let mapleader=","
let maplocalleader="\\"

noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" <F1> and <F2> for save in all three modes
noremap <F2> <Esc>:w<CR>
inoremap <F2> <Esc>:w<CR>
nnoremap <F2> <Esc>:w<CR>
vnoremap <F2> <Esc>:w<CR>

noremap  <F1> <Esc>:w<CR>
inoremap <F1> <Esc>:w<CR>
nnoremap <F1> <Esc>:w<CR>
vnoremap <F1> <Esc>:w<CR>

" <leader>dd to delete buffer
noremap <leader>bd <Esc>:bd<CR>
vnoremap <leader>bd <Esc>:bd<CR>

" Toggle pate with <F3>
set pastetoggle=<F3>

" Keyboard mapping for cursor keys
   map <ESC>[A <Up>
   map <ESC>[B <Down>
   map <ESC>[C <Right>
   map <ESC>[D <Left>
  imap <ESC>[A <Up>
  imap <ESC>[B <Down>
  imap <ESC>[C <Right>
  imap <ESC>[D <Left>

" Rempam Vim 0 to ^
noremap 0 ^

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable hidden buffers
set hidden

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Activate a permanent ruler
set ruler

" Disable Toolbar, Scrollbar
set guioptions=agimrc

" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview

" Disable the blinking cursor.
set gcr=a:blinkon0

" Highlight current line
set cursorline

set ttyfast

" Customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmode=list:longest,full


" Go with smartindent if there is no plugin indent file.
set autoindent smartindent
" But don't outdent hashes
inoremap # X#

" Global by default
set gdefault

" Better Search
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Ask if necessary
set confirm

" Hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" <leader>v selects the just pasted text
nnoremap <leader>v V`]

" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP


" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" NERDtree on <leader>t
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ %#warningmsg#%{SyntasticStatuslineFlag()}%*
set showcmd
set showmode
set number

function! CWD()
    let curdir = substitute(getcwd(), '/home/garrett', "~/", "g")
    return curdir
endfunction

" Set current directory to that of the file
set autochdir

set smarttab
set expandtab
set tabstop=2
set colorcolumn=79
%retab

" Taglist
"let Tlist_Compact_Format = 1
"let Tlist_Ctags_Cmd = 'ctags'
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Exist_OnlyWindow = 1
"let Tlist_File_Fold_Auto_Close = 0
"let Tlist_sort_type = "name"
"let Tlist_Use_Right_Window = 1
"let TlistHighlightTag = 1
"let Tlist_Width = 40
"let Tlist_GainFocus_On_ToggleOpen = 1
"nnoremap <leader>l :Tlist<CR>

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" only variables and f = () -> functions, no class members, methods etc (yet)
let g:tagbar_type_coffee = {
      \ 'ctagstype' : 'coffee',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'v:variables'
      \ ],
      \ }


" GUI Tab settings
function! GuiTabLabel()
  let label = ''
  let buflist = tabpagebuflist(v:lnum)
  if exists('t:title')
    let label .= t:title . ' '
  endif
  let label .= bufname(buflist[tabpagewinnr(v:lnum) - 1])
  for bufnr in buflist
    if getbufvar(bufnr, '&modified')
      let label .= '*'
      break
    endif
  endfor
  return label
endfunction
set guitablabel=%{GuiTabLabel()}

" Gvim Settings

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" utf-8 default encoding
set enc=utf-8

" Prefer unix over windows over os9 formats
set fileformats=unix,dos,mac

" Don't bell or blink(Courtesy: Cream Editor).
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" Keep some more lines for scope
set scrolloff=5

" hide some files and remove stupid help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'

" Split window management
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s
nnoremap <leader>s :new<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ; is an alias for :
nnoremap ; :

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
autocmd FileType * setlocal colorcolumn=0

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79

" template language support (SGML / XML too)
" ------------------------------------------
" and disable that stupid html rendering (like making stuff bold etc)

fun! SelectHTML()
  let n = 1
  while n < 50 && n < line("$")
    " check for jinja
    if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set ft=htmljinja
      return
    endif
    " check for mako
    if getline(n) =~ '<%\(def\|inherit\)'
      set ft=mako
      return
    endif
    " check for genshi
    if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
      set ft=genshi
      return
    endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun

autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufNewFile,BufRead *.html,*.htm  call SelectHTML()
let html_no_rendering=1

autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" CSS
" ---
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let g:syntastic_csslint_options = "--exclude-list=id,star-property-hack,underscore-property-hack"

" rst
" ---
autocmd BufNewFile,BufRead *.rst setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79
\ formatoptions+=nqt textwidth=74

" markdown
" ---
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md setlocal ft=markdown colorcolumn=79 nofoldenable
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79
let javascript_enable_domhtmlcss=1
autocmd FileType coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79

" CoffeeScript
" ------------
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent shiftwidth=2 expandtab

" Nifty tabularize options
" ------------------------
let mapleader=','
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
  nmap <leader>a, :Tabularize /,\zs<CR>
  vmap <leader>a, :Tabularize /,\zs<CR>
endif

" Show whitespace toggle (with ",s")
" ------------------------
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>


" Colorschemes!
" -------------

"colorscheme autumn
"colorscheme bayQua
"colorscheme blackboard
"colorscheme bluegreen
"colorscheme blueshift
"colorscheme clarity
"colorscheme coal-graal
"colorscheme cool
"colorscheme darkocean
"colorscheme darkspectrum
"colorscheme darktango
"colorscheme dawn
"colorscheme desert
"colorscheme desertEx
"colorscheme desert-light
"colorscheme django
"colorscheme doorhinge
"colorscheme dusk
"colorscheme ekvoli
"colorscheme fruity
"colorscheme gardener
"colorscheme github
"colorscheme github256
"colorscheme gobo
"colorscheme grape
"colorscheme guardian
"colorscheme guardian2
"colorscheme industrial
"colorscheme ir_black
"colorscheme kib_darktango
"colorscheme lingodirector
"colorscheme mango
"colorscheme martin_krischik
"colorscheme mod_tcsoft
"colorscheme molokai
"colorscheme mustang
"colorscheme mycolors
"colorscheme myterm
"colorscheme native
"colorscheme nicotine
"colorscheme oceanlight
"colorscheme pastie
"colorscheme phd
"colorscheme proton
"colorscheme ps_color
"colorscheme pyte
"colorscheme rdark
"colorscheme rubyforen
"colorscheme sidewalkchalk
"colorscheme simpleandfriendly
"colorscheme snowy
colorscheme solarized
"colorscheme summerfruit
"colorscheme tango
"colorscheme tango2
"colorscheme taqua
"colorscheme tesla
"colorscheme textmate16
"colorscheme tidy
"colorscheme Tomorrow
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Blue
"colorscheme Tomorrow-Night-Eighties
"colorscheme twilight
"colorscheme two2tango
"colorscheme two2tango2
"colorscheme vcbc
"colorscheme railscasts
"colorscheme vo_dark
"colorscheme vo_light
"colorscheme zenburn

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Tabs!
"set showtabline=2 " File tabs always visible
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
:map <C-t> :tabnew<cr>
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:map <C-w> :tabclose<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>

" Make vim prefer tabs instead of buffers
" via http://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
:set switchbuf=usetab,newtab

" Make vim work better on GNOME
" http://blogs.operationaldynamics.com/andrew/software/gnome-desktop/taming-gvim

" Pull in the Windows default settings
source $VIMRUNTIME/mswin.vim

" Undo the Windows-style selection, re-enabling vi selection
set keymodel=""

set guicursor=a:ver1,a:blinkon0
set mouseshape=n:beam,ve:beam,sd:updown

" Set fixed height of gvim window
if has("gui_running")
  set lines=52
  set columns=95
  "set guifont=DejaVu\ Sans\ Mono\ 11
endif

set foldlevel=999
set nofoldenable

" Two spaces after punctuation is old-school — and wrong.
set nojoinspaces

" Crank up the history!
set history=10000

" Vim likes to fsync a lot...
set nofsync

" Short message
set shortmess=atI

"set formatoptions=tcqroawn1j
"set formatoptions=tcqroa1j
set formatoptions+=1

set textwidth=72

" Make sure to break at words when wrapping lines
set linebreak

function! SetWrap()
  setlocal wrap linebreak nolist
  set virtualedit=
  setlocal display+=lastline
  noremap  <buffer> <silent> <Up>   gk
  noremap  <buffer> <silent> <Down> gj
  noremap  <buffer> <silent> <Home> g<Home>
  noremap  <buffer> <silent> <End>  g<End>
  inoremap <buffer> <silent> <Up>   <C-o>gk
  inoremap <buffer> <silent> <Down> <C-o>gj
  inoremap <buffer> <silent> <Home> <C-o>g<Home>
  inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction

autocmd FileType markdown,text,html,txt call SetWrap()

let g:neocomplcache_enable_at_startup = 1

"highlight Constant ctermfg=Blue guifg=DarkBlue
"highlight String ctermfg=Blue cterm=bold guifg=DarkBlue gui=bold
"highlight Comment ctermfg=Grey guifg=DarkGrey
