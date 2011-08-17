set gfn="Bitstream Vera Sans Mono"
"set ts=2
"set sw=2
set go=agimrt
set mouse=a

call pathogen#infect()
filetype plugin indent on

" Swtich to current directory of the currently edited file, except /tmp
"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | lcd %:p:h | endif

" Set path to the current directory by default
"set path=$PWD/**10
set path=/home/garrett/Source/builder/**10

" Always add the current file's directory to the path if not already there
"autocmd BufRead *
  "\ let s:tempPath=expand("%:p:h") |
  "\ if strridx(&path,s:tempPath) == -1 |
  "\   let &path=&path.",".s:tempPath |
  "\ endif


"set tags=./tags,./../tags,./../../tags,~/tags,/home/garrett/dev/tags
"set tags=./tags,./../tags,./../../tags
set tags=./tags

version 55.0

set t_mr=[0;1;37;44m
set t_mr=[0;1;37;44m

set keywordprg=ispell

set history=5000    " keep 50 lines of command line history
set ruler   " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=^[[3%dm
  set t_Sb=^[[4%dm
endif

" Set up the color extensions
if version < 600
  "source ~/.vim/colors/mycolors.vim
else    
  "colorscheme mycolors
  "colorscheme github256
endif

set helpfile=$VIMRUNTIME/doc/help.txt

if has("autocmd")

" Set some sensible defaults for editing C-files
augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.c,*.h,*.css set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
  "autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  "autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  setlocal omnifunc=syntaxcomplete#Complete

  " Bind SuperTab to vim's OmniComplete
  let g:SuperTabDefaultCompletionType = "context"

  set cot+=menuone
augroup END

"augroup gzip
  "" Remove all gzip autocommands
  "au!
"
  "" Enable editing of gzipped files
  ""   read: set binary mode before reading the file
  ""   uncompress text in buffer after reading
  ""  write: compress file after writing
  "" append: uncompress file, append, compress file
  "autocmd BufReadPre,FileReadPre  *.gz set bin
  "autocmd BufReadPre,FileReadPre  *.gz let ch_save = &ch|set ch=2
  "autocmd BufReadPost,FileReadPost  *.gz '[,']!gunzip
  "autocmd BufReadPost,FileReadPost  *.gz set nobin
  "autocmd BufReadPost,FileReadPost  *.gz let &ch = ch_save|unlet ch_save
  "autocmd BufReadPost,FileReadPost  *.gz execute ":doautocmd BufReadPost " . expand("%:r")
"
  "autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
  "autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r
"
  "autocmd FileAppendPre     *.gz !gunzip <afile>
  "autocmd FileAppendPre     *.gz !mv <afile>:r <afile>
  "autocmd FileAppendPost    *.gz !mv <afile> <afile>:r
  "autocmd FileAppendPost    *.gz !gzip <afile>:r
"augroup END

augroup bzip2 
  " Remove all bzip2 autocommands
  au!

  " Enable editing of bzipped files
  "       read: set binary mode before reading the file
  "             uncompress text in buffer after reading
  "      write: compress file after writing
  "     append: uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre        *.bz2 set bin
  autocmd BufReadPre,FileReadPre        *.bz2 let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost      *.bz2 |'[,']!bunzip2
  autocmd BufReadPost,FileReadPost      *.bz2 let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost      *.bz2 execute ":doautocmd BufReadPost " . expand("%:r")
    
  autocmd BufWritePost,FileWritePost    *.bz2 !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost    *.bz2 !bzip2 <afile>:r

  autocmd FileAppendPre                 *.bz2 !bunzip2 <afile>
  autocmd FileAppendPre                 *.bz2 !mv <afile>:r <afile>
  autocmd FileAppendPost                *.bz2 !mv <afile> <afile>:r
  autocmd FileAppendPost                *.bz2 !bzip2 -9 --repetitive-best <afile>:r
augroup END

endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*    set ft=mail
  au BufRead *.htt    set ft=html
augroup END

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set ignorecase     " Do case insensitive matching
set incsearch      " Incremental search
set hlsearch       " Highlight searches
set autowrite      " Automatically save before commands like :next and :make

" ========================================================================
" SETtings
" ========================================================================
"
"       autoindent:  "on" as I usually write code.
  set   autoindent
  set   smartindent
"
"       autowrite: "on" saves a lot of trouble
  set noautowrite
"
"       backup:  backups are for wimps  ;-)
set nobackup
"
"       backspace:  '2' is much smarter.
  "set   backspace=2
  set   backspace=2
"
"       compatible  ....
  set nocompatible
"
"       comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  set   comments=b:#,:%,fb:-,n:>,n:)
"
"       dictionary: english words first
  set   dictionary=/usr/dict/words,/local/lib/words
"
"       digraph:    required for those umlauts
  set   nodigraph
"
"       errorbells: damn this beep!  ;-)
  set noerrorbells
"
"       esckeys:  I don't use no steekeen function keys!
 " set noesckeys
"
"       formatoptions: tcq2 is all I need
"set    formatoptions=tcq2
"
"       helpheight: zero disables this.
  set   helpheight=2
"
"       hidden:
  set   hidden
"
"       highlight=8b,db,es,hs,mb,Mn,nu,rs,sr,tb,vr,ws
  set   highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
"
"       icon:       ...
  set icon
"
" set   iconstring  file of icon (not necessary as I don't use an icon)
" set   iconstring
"
"       insertmode:  start in insert mode?  Naah.
  set noinsertmode
"
"       joinspaces:  insert two spaces after a period with a join command. Yes!
  set   joinspaces
"
"       laststatus:  show status line?  Yes, always!  Even for only one buffer.
  set   laststatus=2
"
" [VIM5]lazyredraw:  update screen while executing macros?  Nope.
" set nolazyredraw
"
"       magic:       use some magic in search patterns?  Why, of course!
  set   magic
"
"       modeline:    ...
  set modeline
"
"       number:      ...
  set nonumber
"
"       path:        list of directories to search for files with edit commands
"                    Note:  "~/.P" is a symlink to my dir with www pages
"set   path=.,,~/inc,/~public_html,~/alpha,~/.P/vim,~/.P/mutt/,~/.P/elm,~/.P/slrn/,~/.P/nn,~/.P/persons/**,~/dev
"
"       report:      show report when N lines were changed. report all changes!
  set   report=0
"
"       ruler:       show cursor position?  Yep!
  set   ruler
"
"       shell for DOS
" set   shell=command.com
"       shell for UNIX -  math.fu-berlin.de BSD
  set   shell=bash
"       shell for UNIX -   inf.fu-berlin.de BSD&Solaris
" set   shell=zsh
"       shell for UNIX - zedat.fu-berlin.de BSD&Solaris
" set   shell=/bin/tcsh
"       zsh now available at zedat!  :-)
" set   shell=zsh
"
"       shortmess:   Kind of messages to show.   Abbreviate them all!
  set   shortmess=at
"
"       showcmd:     Show current uncompleted command?  Oh, yes, please!
  set   showcmd
"
"       showmatch:   Show the matching bracket for the last ')'?  Make my day!
  set   showmatch
"
"       showmode:    Show the current mode?  YEEEEEEEEESSSSSSSSSSS!
  set   showmode
"
"       suffixes
  set   suffixes=.bak.swp
"
"       term
  "set   term=rxvt
  "set   term=xterm-color
"
"       textwidth
"  set   textwidth=79
"
"       title:
  set   title
"
"       ttyfast:
  set   ttyfast
"
"       ttybuiltin:
  set nottybuiltin
"
"       visualbell:
  set   visualbell
"
"       t_vb:          terminal's visual bell - turned off to make Vim quiet!
"  set   t_vb=
"
"       whichwrap:
  set   whichwrap=<,>

  " Set wrap at word
  set lbr!

"
"       wildchar       the character used for "expansion" on the command line
"                      the default value is "<C-E>" but I prefer the tab key:
  "set   wildchar=<TAB>
"
"       wrapmargin:
  set   wrapmargin=1
"
"       writebackup:
  set nowritebackup
"
" ========================================================================
" MAPpings
" ========================================================================
" Caveat:  Mapping must be "prefix free", ie no mapping must be the prefix of
" any other mapping.  Example:  "map ,abc foo" and "map ,abcd bar" will give
" you the error message "Ambigous mapping".
"
" With Vim-4 the format command was just 'Q' and
" I am too used to it.  So I need this back!
  nmap Q gq
  vmap Q gq
"
" Disable the command 'K' (keyword lookup) by making it start visual mode.
" Unfortunately there is no way to map something to nothing.  :-(
"  map K <C-V>
"
" Disable the suspend for ^Z.
" I use Vim under "screen" where a suspend would lose the
" connection to the " terminal - which is what I want to avoid.
"  map <C-Z> :shell
"
" Make CTRL-^ rebound to the *column* in the previous file
  noremap <C-^> <C-^>`"
"
" When I let Vim write the current buffer I freuently mistype the command ":w"
" as ":W" - so this mapping will correct this typo right at the start:
  map :W :w
  map :Q :q
"
" Are you used to the Unix commands "alias" and "which"?
" I sometimes use these to look up my abbreviations and mappings.
" So I need them available on the command line:
  map :alias map
  map :which map
"
" Command line (colon mode) mappings
" valid names are:  <Up> <Down> <Left> <Right> <Home> <End> 
" <S-Left> <S-Right> <S-Up> <PageUp> <S-Down> <PageDown>  <LeftMouse> 
"
" Many shells allow editing in "Emacs Style".
" Although I love Vi, I am quite used to this kind of editing now.
" So here it is - command line editing commands in emacs style:
  cnoremap <C-A> <Home>
  cnoremap <C-F> <Right>
  cnoremap <C-B> <Left>
  cnoremap <ESC>b <S-Left>
  cnoremap <ESC>f <S-Right>
  cnoremap <ESC><C-H> <C-W>
"
" ========================================================================
" VIM - Editing and updating the vimrc:
" As I often make changes to this file I use these commands
" to start editing it and also update it:
"     ,v = vimrc editing (edit this file)
  map ,v :e ~/.vimrc<CR>
"     ,u = "update" by reading this file
  map ,u :source ~/.vimrc<CR>

"      CD = cd to www directories
  cmap CD cd ~/public_html/

" ========================================================================
" ABbreviations
" ========================================================================
"
" Abbreviation for some classic long words:
"
"     Yalpha : The lower letter alphabet.
  iab Yalpha abcdefghijklmnopqrstuvwxyz
"
"     YALPHA : The upper letter alphabet.
  iab YALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ
"
"     Ydigit : The ten digits.
  iab Ydigit 1234567890
"
"     Yruler : A ruler.
  iab Yruler 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
"
"     Yupsidedown : Describing the folks from down under (Hi, Dean!).
  iab Yupsidedown umop-ap!sdn
"
"     Ysuper : Supposedly the longest word in the English language (long ago):
  iab Ysuper supercalifragilisticexpialidocious
"
"     Ypass : Standard answer to Usenet posts with "Subject: HELP"  (hehe)
  iab Ypass  "You are in a maze of twisty little passages, all alike."
"
"     Ysesqui : "Sesquipedalophobia" means "fear of big words."  ;-)
  iab Ysesqui    sesquipedalophobia
"
" Inserting an ellipsis to indicate deleted text
  iab  Yell [...]
  vmap ,ell c[...]<ESC>
"
" Damn typos - I almost never get these right.  :-(
"
  iab charcter character
  iab charcters characters
  iab shoudl should
  iab teh the
"
"
" ========================================================================
" HTML - HTML - HTML - HTML - HTML - HTML - HTML - HTML 
" ========================================================================
"
" HTML - HyperText Markup Language - the language of the World Wide Web
"
" ===========================================================================
" HTML - inserting text from standard text files
" ===========================================================================
"
"       Whenever I edit a web page I use ",e" to start the edit command.
" Then I use ",rn" to read in the web page template.  As simple as that.
"
"       ,e  = edit www file
  nmap  ,e :e ~/public_html/
  cmap  ;e  e ~/public_html/
"       I use ",e" here before, but this was part of the default string
"       for "highlight", so while entering the default string the ",e"
"       it got expanded.  Darn!
"
"       ,rm = read mailto
  map   ,rm :r ~/public_html/txt/mailto.html
"       ,rn = read new page form
  map   ,rn :r ~/public_html/txt/New.page.form.html
"       ,rp = read prelude
  map   ,rp :r ~/public_html/txt/prelude.html
"
"
" ===========================================================================
" HTML - reading in the current date
" ===========================================================================
"
"       ,X  = add extra short date
  map   ,X :r!date +\%y\%m\%d<CR>I<br>[<ESC>A]<ESC>
"       ,L  = "Last updated" - insert time stamp and delete old time stamp
  map   ,L mz1G/Last update: */e+1<CR>D:r!date<CR>kJ
"       ,dt = "date and time insert"
  map   ,dt :r!date +\%y\%m\%d\%t\%T<CR>
"       ,cr = "created" - create the "Created" line in HTML files
  map   ,cr OCreated:     <ESC>:r!date<CR>kJWWWdWi00:00:00 <ESC>A<br><ESC>
"       ,da = date insert
  map   ,da :r!date<CR>
"
" HTML - make current word an HTML environment
  map ,me yapa></<ESC>Ea><ESC>Bi<<ESC>/><<CR>
" map! ,c =1Bb"aywi<=1Bea></=1B"apa>=1Bbba
"
" HTML - Inserting "single" tags
"
  iab Ybr <br>
  iab Yhr <hr>
  iab Yp  <p>
"
" HTML - Inserting Environments
"
"           Insert environment <b></b>
  iab  Yb   <b></b><ESC>T>i
  vmap ,b   "zdi<b><C-R>z</b><ESC>2F>
"
"           Insert environment <blockquote></blockquote>
  iab  Ybl  <blockquote></blockquote><ESC>T>i
" vmap ,bl  "zdi<blockquote><C-R>z</blockquote><ESC>2F>
"
"           Insert environment <center></center>
  iab  Ycen <center></center><ESC>T>i
  vmap ,ce  "zdi<center><C-M><C-R>z<C-M></center><ESC>T>i
"
"           Insert environment <code></code>
  iab  Ycod <code></code><ESC>T>i
  vmap ,cod "zdi<xmp><C-M><C-R>z<C-M></xmp><C-M><ESC>T>i
"
"           Insert environment <i></i>
  iab  Yi   <i></i><ESC>T>i
  vmap ,i   "zdi<i><C-R>z</i><ESC>T>
"
"           Insert environment <pre></pre>
  iab  Ypre <pre></pre><ESC>T>i
  vmap ,pre "zdi<pre><C-M><C-R>z</pre><C-M><ESC>T>
"
"           Insert environment <tt></tt>
  iab  Ytt  <tt></tt><ESC>T>i
  vmap ,tt  "zdi<tt><C-R>z</tt><ESC>T>i
"
"           Insert environment <xmp></xmp>
  iab  Yxmp <xmp></xmp><ESC>T>i
  vmap ,xmp "zdi<xmp><C-M><C-R>z<C-M></xmp><C-M><ESC>T>i
"
" HTML - Insert Header Lines (h1 to h6)
"
  iab  Yh1 <h1></h1><ESC>T>i
  vmap ,h1 "zdi<h1><C-R>z</h1><ESC>2F>
  iab  Yh2 <h2></h2><ESC>T>i
  vmap ,h2 "zdi<h2><C-R>z</h2><ESC>2F>
  iab  Yh3 <h3></h3><ESC>T>i
  vmap ,h3 "zdi<h3><C-R>z</h3><ESC>2F>
  iab  Yh4 <h4></h4><ESC>T>i
  vmap ,h4 "zdi<h4><C-R>z</h4><ESC>2F>
  iab  Yh5 <h5></h5><ESC>T>i
  vmap ,h5 "zdi<h5><C-R>z</h5><ESC>2F>
  iab  Yh6 <h6></h6><ESC>T>i
  vmap ,h6 "zdi<h6><C-R>z</h6><ESC>2F>
"
" HTML - Inserting Lists
"
"           Insert "ordered list" with one list element
    iab Yol <ol><CR><li><CR></ol><ESC>k
"           Insert "unordered list" with one list element
    iab Yul <ul><CR><li><CR></ul><ESC>k
"           Insert "decsription list" with one list element
"   iab Ydl <dl><CR><dt><CR><dd><CR><p><CR></dl><CR><ESC>4kA
    iab Ydl <dl><CR><CR><dt><CR><dd><CR><p><CR><CR></dl><CR><ESC>5kA
"
" HTML - Inserting List Items
"
"           Insert "list" item (for both ordered and unordered list)
    iab Yli <li>
"           Insert "description list" item
    iab Ydt <dt><CR><dd><CR><p><CR><ESC>kA
    iab Ydp <dt><CR><dd><C-M><p><C-M><ESC>kkkA 
"
" HTML - Inserting Links
"
"            Insert/make reference link
  iab  Yhref <a href=""></a><ESC>?""<CR>a
  vmap ,href "zdi<a href=""><C-R>z</a><ESC>2F>
"
"            Insert/make reference link to overview list (short "cut")
  iab  Ycut  \| <a href="#"<C-I>></a><ESC>F#a
  vmap ,cut  "zdi<a href="#<C-R>z"<C-I>><C-R>z</a><ESC>2F>
"
"            Insert/make reference link with complete URL
  iab  Ylink <a href=""<CR><C-I>></a><ESC>?""<CR>a
  vmap ,link "zdi<a href="<C-R>z"<C-M><C-I>><C-R>z</a><ESC>2F>
"
"            Insert/make name tag
  iab  Yname <a name=""></a><ESC>?""<CR>a
  vmap ,name "zdi<a name="<C-R>z"<C-M><C-I>><C-R>z</a><ESC>2F>
"
"            Insert/make link to image
  iab  Yimg  <img alt="[picture: title]"<C-M>   align=<C-M>     src=""></a><ESC>?""<CR>a
"
"            Insert/make mailto link
  iab  Ymail <a href="mailto:"></a><ESC>?:<CR>a
  vmap ,mail "zdi<a href="mailto:<C-R>z"><C-R>z</a><ESC>2F>
"
"            Insert/make link to newsgroup
  iab  Ynews <a href="news:"></a><ESC>?:<CR>a
  vmap ,news "zdi<a href="news:<C-R>z"><C-R>z</a><ESC>2F>
"
"      Ypage Insert page description with a possible link and text
  iab  Ypage   <C-M>page:<C-I><C-M>link:<C-I><C-M>text:<C-I><ESC>kkA
" 
"
" HTML - Converting umlauts to digraphs [960430]
"
" cnoremap ,ae %s/ae/<C-V>228/gc
" cnoremap ,oe %s/oe/<C-V>246/gc
" cnoremap ,ue %s/ue/<C-V>252/gc
" cnoremap ,Ae %s/Ae/<C-V>196/gc
" cnoremap ,Oe %s/Oe/<C-V>124/gc
" cnoremap ,Ue %s/Ue/<C-V>220/gc
" cnoremap ,ss %s/ss/<C-V>223/gc
"
" HTML - Add closing tags to name tag (which I forgot when I started HTML):
" map ,,,, :g/^<a name="[a-z_]*">$/s/$/<\/a>/
"
" HTML - Useful external commands
"
"       ,p = make current file public readable
  nmap  ,p :!chmod 644 %<CR>
"
"       ,= = turn "===" into headline of size 1
" nmap  ,= :%s/^===\(.*\)$/<h1>^M^I\1^M<\/h1>/<CR>
"
" For adding descriptions and keywords to important pages:
" <META Name="description" Content="Write your description here">
" <META Name="keywords"    Content="Write your keywords here">
"
" ========================================================================
" PGP - encryption and decryption
" ========================================================================
"
" encrypt
  nmap ;e :%!/bin/sh -c 'pgp -feast 2>/dev/tty'
  vmap ;e :%!/bin/sh -c 'pgp -feast 2>/dev/tty'
" decrypt
  nmap ;d :/^-----BEG/,/^-----END/!/bin/sh -c 'pgp -f 2>/dev/tty'
  vmap ;d :/^-----BEG/,/^-----END/!/bin/sh -c 'pgp -f 2>/dev/tty'
" sign 
  nmap ;s :,$! /bin/sh -c 'pgp -fast +clear 2>/dev/tty'
" 
  nmap ;v :,/^-----END/w !pgp -m
"
" PGP - original mappings
"
"       encrypt and sign (useful for mailing to someone else)
"csh: map #1 :,$! /bin/sh -c 'pgp -feast 2>/dev/tty^V|^V|sleep 4'
" sh: map #1 :,$! pgp -feast 2>/dev/tty^V|^V|sleep 4
"
"       sign (useful for mailing to someone else)
"csh: map #2 :,$! /bin/sh -c 'pgp -fast +clear 2>/dev/tty'
" sh: map #2 :,$! pgp -fast +clear 2>/dev/tty
"
"       decrypt
"csh: map #3 :/^-----BEG/,/^-----END/! /bin/sh -c 'pgp -f 2>/dev/tty^V|^V|sleep 4'
" sh: map #3 :/^-----BEG/,/^-----END/! pgp -f 2>/dev/tty^V|^V|sleep 4
"
"       view (pages output, like more)
"csh: map #4 :,/^-----END/w !pgp -m
" sh: map #4 :,/^-----END/w !pgp -m
"
"       encrypt alone (useful for encrypting for oneself)
"csh: map #5 :,$! /bin/sh -c 'pgp -feat 2>/dev/tty^V|^V|sleep 4'
" sh: map #5 :,$! pgp -feat 2>/dev/tty^V|^V|sleep 4
"
" Elijah http://www.mathlab.sunysb.edu/~elijah/pgppub.html says :
" The significant feature is that stderr is redirected independently of
" stdout, and it is redirected to /dev/tty which is a synonym for the current
" terminal on Unix.  I don't know why the ||sleep 4 stuff is there, but it is
" harmless so I left it. Since csh is such junk, special rules are used if you
" are using it (tcsh, too). ksh and bash should use the sh form. zsh, et al:
" consult your manual.  The #<num> format is used to map function keys. If you
" terminal does not support the requested function key, use a literal #<num>.
" Not all of the clones correctly support this.
"
" ========================================================================
" Useful stuff.  At least these are nice examples.  :-)
" ========================================================================
"
"     ,t = transpose two characters next to cursor position from aXb -> bXa
" map ,t XplxhhPl
"
" make space move the cursor to the right - much better than a *beep*
" nmap \  l
"
"     ,E = execute line
" map ,E 0/\$<CR>w"yy$:<C-R>y<C-A>r!<C-E>
" This command excutes a shell command from the current line and reads in
" its output into the buffer.  "      It assumes that the command starts with
" the fist word after the first '$' (the shell prompt of /bin/sh).
" Try ",E" on this line, ie place the cursor on it and then press ",E":
" $ ls -la
" Note: The command line commands have been remapped to tcsh style!! 
"
" put parentheses around "visual text" 
" vmap ,, v`>a)<ESC>`<i(<ESC>
"
"      ,dr = decode/encode rot13 text
  vmap ,dr :!tr A-Za-z N-ZA-Mn-za-m

" Use this with an external "rot13" script:
" "    ,13 - rot13 the visual text
" vmap ,13 :!rot13<CR>
"
" Give the URL under the cursor to Netscape
" map ,net yA:!netscape -remote "openurl <C-R>""
"
"
" ========================================================================
" ASCII tables - you may need them some day.  Save them to a file!
" ========================================================================
"
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ========================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|
" 
" ========================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ========================================================================
"
" ========================================================================
" Mapping of special keys - arrow keys and function keys.
" ========================================================================
" Buffer commands (split,move,delete) -
" this makes a little more easy to deal with buffers.
" (works for Linux PCs in room 030)
  map <F4>  :split<C-M>
  map <F5>  :bp<C-M>
  map <F6>  :bn<C-M>
  map <F12> :bd<C-M>
"
" Buffer commands (split,move,delete) -
" for Mac keyboard (Performa 5200, US keyboard)
"
  map <ESC>[19~ :split<C-M>
  map <ESC>[20~ :bp<C-M>
  map <ESC>[23~ :bn<C-M>
  map <ESC>[31~ :bd<C-M>
"
" Obvious mappings 
"
" map <PageUp>   <C-B>
" map <PageDown> <C-F>
"
" Emacs style editing in insert mode
" This is something I tried for a minute
" and forgot about the minute after. ;-)
"
 imap <C-A>  <ESC>0i
" imap <C-B>  <ESC>hi
" imap <C-D>  <ESC>xi
 imap <C-E>  <ESC>A
" imap <C-F>  <ESC>lli
" imap <C-N>  <ESC>jli
" imap <C-P>  <ESC>kli
" imap <ESC>b <ESC>bi
" imap <ESC>f <ESC>lWi
"
" Normal mode - tcsh style movements [960425]
"
" nmap <C-A>  0
" nmap <C-B>  h
" nmap <C-D>  x
" nmap <C-E>  $
" nmap <C-F>  l
" nmap <ESC>b b
" nmap <ESC>f w
"
" DOS keyboard mapping for cursor keys
"
"  map <ESC>[A <Up>
"  map <ESC>[B <Down>
"  map <ESC>[C <Right>
"  map <ESC>[D <Left>
" imap <ESC>[A <Up>
" imap <ESC>[B <Down>
" imap <ESC>[C <Right>
" imap <ESC>[D <Left>
"
" DOS keyboard
" "insert"
"  map <ESC>[1~ i
"  map <ESC>[1~ <insert>
" "home"
"  map <ESC>[2~ ^
"  map <ESC>[2~ 0
"  map <ESC>[2~ <Home>
" "pgup"
"  map <ESC>[3~ <C-B>
"  map <ESC>[3~ <PageUp>
" "delete"
"  map <ESC>[4~ x
"  map <ESC>[4~ <Del>
" "end"
"  map <ESC>[5~ $
"  map <ESC>[5~ <END>
" "pgdn"
"  map <ESC>[6~ <C-F>
"  map <ESC>[6~ <PageDown>
"
" Keyboard mapping for cursor keys
" [works for SUNs in Solarium (room 030) - 970815]
"
   map <ESC>OA <Up>
   map <ESC>OB <Down>
   map <ESC>OC <Right>
   map <ESC>OD <Left>
  imap <ESC>OA <Up>
  imap <ESC>OB <Down>
  imap <ESC>OC <Right>
  imap <ESC>OD <Left>
"
" Keyboard mapping for cursor keys
" [works for XTerminals - 970818]
   map <ESC>[A <Up>
   map <ESC>[B <Down>
   map <ESC>[C <Right>
   map <ESC>[D <Left>
  imap <ESC>[A <Up>
  imap <ESC>[B <Down>
  imap <ESC>[C <Right>
  imap <ESC>[D <Left>
"
" ========================================================================
" TEMPORARY STUFF
" ========================================================================
"
" With this abbreviation I once added a link to all my pages about ELM:
" iab YEHP <li><a href="HPE"><CR><C-I>ELM Pages - Home Page</a>
"
"       map     ,U %s#<URL:\(.*\)>#<a href="\1"></a>#gc
"       map ,F {jma}kmb:'a,'b!sed -e "s/^>//"<C-V><C-V>|sed -f public_html/elm/scripts/weedout.sed
"       map ,mb ebi<CR><b><ESC>Ea</b><CR><ESC>dw
"
"
" stripping netscape bookmarks and making them list items
" vmap ,ns :.,$s/^ *<DT><\(A.*"\) ADD.*">\(.*\)$/<li> <\1><C-M><C-I>\2/
"
" ========================================================================
" TEST of AutoCommands 
" ========================================================================
" Enable editing of gzipped files.  This comes straight from the vim
" distribution and it served me well.
"   uncompress them after reading
"   compress them before writing, undone after writing
"   binary mode is needed when writing gzipped files
 "autocmd BufRead *.gz set bin|%!gunzip
 "autocmd BufRead *.gz set nobin
 "autocmd BufWritePre *.gz %!gzip
 "autocmd BufWritePre *.gz set bin
 "autocmd BufWritePost *.gz undo|set nobin
 "autocmd FileReadPost *.gz set bin|'[,']!gunzip
 "autocmd FileReadPost set nobin

  " Enable editing of bzipped files
  "       read: set binary mode before reading the file
  "             uncompress text in buffer after reading
  "      write: compress file after writing
  "     append: uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre        *.bz2 set bin
  autocmd BufReadPre,FileReadPre        *.bz2 let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost      *.bz2 |'[,']!bunzip2
  autocmd BufReadPost,FileReadPost      *.bz2 let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost      *.bz2 execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost    *.bz2 !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost    *.bz2 !bzip2 <afile>:r

  autocmd FileAppendPre                 *.bz2 !bunzip2 <afile>
  autocmd FileAppendPre                 *.bz2 !mv <afile>:r <afile>
  autocmd FileAppendPost                *.bz2 !mv <afile> <afile>:r
  autocmd FileAppendPost                *.bz2 !bzip2 -9 --repetitive-best <afile>:r
"
"     \<> = change to <> notation by substituting ^M and ^[
" cab \<> s/<C-V><ESC>/<ESC>/gc<C-M>:s/<C-V><C-M>/<C-M>/gc<C-M>
"
" Jump to the last space before the 80th column.
" map ,\| 80\|F 
"
" extracting variable names from mutt's init.c
" :%s/^.*"\([a-z0-9_]*\)".*$/\1/
"
" Automatically placing the cursor onto the first line withon the mail body:
" autocmd BufRead .followup,.article,.letter 1G}j;set fo=tcq tw=78
"
" Changing the From_ line in pseudo mail folders to an appropriate value -
" so you can read them with a mailer.
" %s/^From /From guckes Thu Apr  6 12:07:00 1967/
"
syntax on
"  COLOR!!!  Let's try this!
"

if exists("has_syntax")
    " Help files for Vim
au BufNewFile,BufReadPost,TermChanged snd*,mutt*,.letter,nn.*,.followup source ~/.public_html/vim/mailnews.vim
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.json setfiletype javascript
source $VIMRUNTIME/syntax/syntax.vim
source $VIMRUNTIME/syntax/latex.vim
source $VIMRUNTIME/syntax/c.vim
source $VIMRUNTIME/syntax/perl.vim
autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
syntax sync maxlines=10

endif

autocmd BufRead *.jl,.sawfishrc,custom source $VIMRUNTIME/syntax/lisp.vim
autocmd BufRead *.tpl source $VIMRUNTIME/syntax/html.vim
"autocmd BufRead *.tmpl source ~/.vim/extensions/php.vim
autocmd BufRead *.tmpl source $VIMRUNTIME/syntax/php.vim
autocmd BufRead *.theme source $VIMRUNTIME/syntax/php.vim
autocmd BufRead *.htt source $VIMRUNTIME/syntax/html.vim
autocmd BufRead *.script source $VIMRUNTIME/syntax/python.vim
autocmd BufRead *.svg source $VIMRUNTIME/syntax/xml.vim
autocmd BufRead *.json source $VIMRUNTIME/syntax/javascript.vim

autocmd BufReadPre *.pdf set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78

autocmd BufRead,BufNewFile *.wiki setfiletype Wikipedia
autocmd BufRead,BufNewFile *.wikipedia.org* setfiletype Wikipedia

filetype on
filetype indent on
"set ts=2
"set sw=4

" tabstop stuff
set smarttab
set expandtab
"set tabstop=2
"set softtabstop=2
" shiftwidth:  Number of spaces to use for each step of (auto)indent.
"set   shiftwidth=2

" Makefile sanity
"autocmd BufEnter ?akefile* set noet ts=8 sw=8
"autocmd BufEnter */debian/rules set noet ts=8 sw=8

"function Kees_settabs()
  "if len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^\\t"')) > len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^ "'))
    "set noet ts=8 sw=8
  "endif
"endfunction
"autocmd BufReadPost * call Kees_settabs()

:let g:detectindent_preferred_expandtab = 1
:let g:detectindent_preferred_indent = 2

:autocmd BufReadPost * :DetectIndent

%retab

set wildmode=longest:list,full

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0

source ~/.vim/extensions/php.vim

source ~/.vim/plugin/sessions.vim

map <C-T> <Esc>:tabnew<CR>
map <C-W> <Esc>:tabclose<CR>

set cursorline

autocmd BufWritePost .vimrc source %

"nnoremap <silent> <C-f><C-t> :FuzzyFinderTag!<CR>

"" Increase the # of the max FuzzyFinder list
"nnoremap <silent> <C-S-f> :FuzzyFinderFile **/
""nnoremap <silent> <C-m>      :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
""nnoremap <silent> <C-]>      :FuzzyFinderTag! <C-r>=expand('<cword>')<C

"vmap gl :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
"vmap gl :<C-U>!git blame -L<C-R>=line("'<"),<C-R>=line("'>") <C-R>=expand("%:p")

"imap ,t <Esc>:tabnew<CR>

" run jslint, as suggested in http://mikecantelon.com/story/javascript-syntax-checking-vim
"cabbr jslint !js /home/garrett/bin/runjslint.js "`cat %`" \| /home/garrett/bin/format_lint_output.py

set list lcs=tab:»· lcs+=trail:♯
set autoread

" Commentify
"source ~/.vim/plugin/EnhancedCommentify.vim
"map <M-c> :call ToggleCommentify()<CR>j
"imap <M-c> <ESC>:call ToggleCommentify()<CR>j 

":autocmd BufEnter * call DoWordComplete()

"source ~/.vim/plugin/ToggleComment.vim

":call DoWordComplete()
":autocmd BufEnter * call DoWordComplete()

" ctags magic
" see http://amix.dk/blog/viewEntry/19329
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F9> :TlistToggle<cr>
map <F10> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Disable code folding
"set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "

" Command-T (open files)
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" CloseTag, only for HTML/XML files
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" Tagbar awesomeness
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>


"END
