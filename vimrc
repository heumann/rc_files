autocmd!

" {{{ VIM SETTINGS

    " {{{ misc
        "sets indents accoring to filetype
        " NOTE this line needs to be above the next set
        filetype plugin indent on

        " turn on syntax highlighting
        syntax on

        "making vim7 symbol-matcher be a little less intrusive and confusing
        :hi MatchParen cterm=inverse
        :hi MatchParen ctermfg=black
        :hi MatchParen ctermbg=yellow

        "enable extended % matching
        runtime macros/matchit.vim
    " }}}

    " {{{ set
        " display a status bar along the bottom, with filename and cursor position
        set ruler
        set laststatus=2

        "indents like previous line, and other nifty things
        set autoindent
        "actually decides indents on file type
        set smartindent
        "tab=4 spaces, and actual spaces, not tabs, and tab is mapped to 4 spaces
        set tabstop=4
        set shiftwidth=4
        set expandtab
        set shiftround

        set pastetoggle=<f11>

        set foldmethod=marker

        set exrc

        "records history in buffers even when you've left them
        set hidden

        "keep a longer history
        set history=1000

        set ignorecase

        "set linebreak
        set hlsearch

        " makes visual block a sqaure
        set virtualedit=block

        " Erasing previosuly entered characters in insert mode
        " (http://www.vim.org/tips/tip.php?tip_id=17)
        set backspace=2

        set bg=dark

        " make ctrl-n/p only search the current file
        "   see http://vimdoc.sourceforge.net/htmldoc/options.html#'complete'
        "  for more options
        set complete=.

        " show the items vim will tabcomplete to on the command line
        set wildmenu
        " ...and limit what it looks at
        set wildignore=.svn/

        " by default, don't highlight searches
        set nohlsearch

        " use ` (jumps to column and line) insteadm of ' (just jumps to line)
        " via http://items.sjbach.com/319/configuring-vim-right
        " XXX this seems to break using `< and `>, and therefore all bucketize plugins
        " nnoremap ' `
        " nnoremap ` '

        " ignore leading zeros in ctrl-a
        set nrformats=

        " leave N lines of scrolling at the bottom for better context
        set scrolloff=2

        " create new vertical split screens on the right
        set splitright
    " }}}

    " {{{ map
        " toggle wrapping
        "   see http://www.chemie.fu-berlin.de/chemnet/doc/vim/vim.hlp
        "   and search for 'invert toggle'
        map  <F12>      :set invwrap<cr>
        imap <F12> <esc>:set invwrap<cr>a

        map  <F1>     :source ~/.vimrc<CR>
        imap <F1>     <ESC>:source ~/.vimrc<CR>
        map  <F1><F1> :n ~/.vimrc<CR>
        imap <F1><F1> <ESC>:n ~/.vimrc<CR>

        " the most important mapping ever
        map W :w<cr>

        " toggle highlighting
        map ,, :set hlsearch!<CR>

        " create folds quickly
        "   fold on an extra line and close
        vmap {{{ <ESC>`>o}}}<ESC>`<O{{{<ESC>zc
        "   fold on the same line
        vmap }}} <ESC>`>o}}}<ESC>`<O{{{<ESC>J

        " mappings for mulitple-file sessions
        map <F4> :bp<CR>
        map <F5> :bn<CR>
        map <F2> :b#<CR>

        " translate non-breaking html spaces into spaces
        map \<space> :1,$s/&nbsp;/ /g<CR>

        " keep me out of visual mode, amen
        map q: :q
        map Q :q

        " make a line into a header
        map gh yyp^v$r-
          " the version with uppercasing: map gh 0gU$yyp^v$r-

        " make a line into a header, but don't alter the line
        map gH yypVr-

        " scrolling left and right
        map L zl
        map H zh

        " turn a url with a bunch of args into a (more) readable set of key/value pairs
        map \qs :%s/?/<C-v><C-m>    /g<cr>:%s/&/<C-v><C-m>    /g<cr>:%s/=/ = /g<cr>ggjVG:!sort<cr>

        " search for all characters past the 80th character
        map ,8 /\%80v.*<CR>

        " search the current file
        map ,/ :!clear;ack -i  % \| less -R<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

        " format paragraph
        map ,c mhA<space><esc>:%s/\s\+$//g<cr>`hgwap

        " mark something on a checklist as pending/done
        map m- 0:s/.\]/-]/<CR>
        map mx 0:s/.\]/x]/<CR>

        " use tab for switching windows
        map <tab> :wincmd w<CR>

        " remove empty spaces from the end of all lines
        map ,ns mh:%s/\s\+$//g<CR>`h

        " search for the current word in the current directory
        map ,k :!clear;ack -i <cword> \| less -R<cr>
    "}}}
" }}}

" {{{ PERL

    " from Dil: lets you do gf on Perl package names
    set suffixesadd=.pm
    set includeexpr=substitute(v:fname,'::','/','g')

    " .t files are perl files
    autocmd BufNewFile,BufRead *.t set filetype=perl

    " .tt2 files are tt2 files, duh                   
    autocmd BufNewFile,BufRead *.tt2    set filetype=tt2 
    autocmd BufNewFile,BufRead *.tt     set filetype=tt2
    autocmd BufNewFile,BufRead */tt2/*  set filetype=tt2

    " more tt2 abbrs
    autocmd BufNewFile,BufRead */tt2/* abbr ,p [% dump( ); %]<left><left><left><left><left><left>

    map # ^i#<esc>
    map ## :s/^/#/g<cr>:nohl<CR>
    map ,E O<ESC>0C__END__<ESC>
    map ,e o<ESC>0C__END__<ESC>

    " prove and perl the current file
    map <F9>  :w^M:!clear;echo "";prove -mlv %^M
    map <F10> :w^M:!clear;echo "";perl %^M

    " remapping the bufexplorer hook
    map ,b \be

    " quick perl lookups
    map ,d :!perldoc 
    map ,f :!perldoc -f 

    " logging
    map ,l oopen (LOG, '>>/tmp/joshh') or die "can't open /tmp/joshh for writing";<CR>use Data::Dumper;<CR>print LOG Dumper <CR>close LOG;<esc>kA
    map <F3> :!tail -f /tmp/joshh<CR>

    " TEMPLATE TOOLKIT
    map ,. lbi[% <ESC>ea %]<ESC>
    vmap ,. <ESC>`>a %]<ESC>`<i[% <ESC>

    " pairing
    map ,p :set cursorline!<cr>:set number!<cr>

    " these are commented out because they can get annoying when you're not using TT
    " map [[ i[%
    " map ]] i<SPACE>%]
    " abbr [[ [%
    " abbr ]] %]

    " data::dumper
    abbr udd use Data::Dumper;

    abbr ddu die Dumper
    abbr pdu print Dumper
    abbr ddf die Dumper 'FUCKER';
    abbr wdu warn Dumper

    abbr uddu use Data::Dumper;<cr>die Dumper
    abbr updu use Data::Dumper;<cr>print Dumper
    abbr uddf use Data::Dumper;<cr>die Dumper 'FUCKER';
    abbr uwdu use Data::Dumper;<cr>warn Dumper

    " delimiters
    abbr ~~ #<SPACE>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    abbr `` #<SPACE>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    " increment/decrement test count without moving
    map tu mh/use test::more<cr><c-a>`h
    map td mh/use test::more<cr><c-x>`h

    " find all of the subs declared in this file
    map ,su :!clear;ack -i --output='$1' '^sub\s(\w+)' % \| sort<cr>
" }}}

" {{{ SQL

    " commenting in sql
    map -- 0i-- <ESC>
    vmap -- :s/^/-- /<CR>:nohl<CR>

" }}}

" {{{ JAVASCRIPT

    " commenting
    map  c/ ^i// <ESC>
    vmap c/ :s#^#// #<CR>:nohl<CR>

    map  ,* lbO/*<ESC>eo*/<ESC>
    vmap ,* <ESC>`>o*/<ESC>`<O/*<ESC>

    " .html console (firebug)
    autocmd BufNewFile,BufRead *.html abbr ,p console.log( );<left><left><left>
    autocmd BufNewFile,BufRead *.js abbr ,p console.log( );<left><left><left>

    " .html and javascript files only indent 2 spaces
    autocmd BufNewFile,BufRead *.html set shiftwidth=2 
    autocmd BufNewFile,BufRead *.html set tabstop=2 

    autocmd BufNewFile,BufRead *.js set shiftwidth=2 
    autocmd BufNewFile,BufRead *.js set tabstop=2 

    " .html set F9 to open the current file
    autocmd BufNewFile,BufRead *.html map <F9> :w<cr>:!open "%"<cr><cr>
" }}}
"
" TODO: add a mapping for rtk-style auto-aligning using visual objects.  See:
" http://www.vim.org/htmldoc/visual.html#visual-operators

" {{{ SVN
    " svn checkin the current file
    map ,sc :!svn ci -m "" %<left><left><left>

    " use svn_diff_less on the current file
    map ,sd :!svn di % \| ~/bin/diff_painter.pl \| less -R<cr>

    " cvs ann and go straight to the current line
    map ,B :execute '!svn blame ' . expand('%') . ' \| less -I +' . line('.')<CR>

    " svn add the current file
    " NOTE: does not have a <CR> at the end on purpose.
    map ,sa :!svn add %
" }}}

" alignment plugin shortcuts
map ,a viB:Align =><cr>
map ,A vibk:Align =><cr>

" select the last-pasted section
map gp `[v`]

" set indent and tab to common numbers of spaces
map gt2 :set shiftwidth=2<cr>:set tabstop=2<cr>
map gt4 :set shiftwidth=4<cr>:set tabstop=4<cr>

map ,sd :!git diff % \| ~/bin/diff_painter.pl \| less -R<CR>
map ,gc :!git ci -m "" %<left><left><left>

autocmd BufNewFile,BufRead *html* map <F10> :w^M:!open %^M

" highlight the current word everywhere
map ,hl :set hlsearch<cr>:let @/='\<' . expand("<cword>") . '\>'<cr>

" temporary settings
set tabstop=2
set shiftwidth=2
map ,sd :!svn diff % \| ~/bin/diff_painter.pl \| less -R<CR>
set invwrap

map ,wt :%s/'/'/ge<cr>:%w !cat -v \| pbcopy<cr>

map ,r i*<esc>:r !date "+\%Y-\%m-\%d"<cr>kJxA*<esc>

" set up a meeting notes file
map gm gho<esc>,r
