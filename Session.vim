let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>(coc-snippets-expand-jump) coc#_insert_key('request', 'snippets-expand-jump', 1)
inoremap <silent> <expr> <Plug>(coc-snippets-expand) coc#_insert_key('request', 'snippets-expand', 1)
inoremap <silent> <Plug>CocRefresh =coc#_complete()
inoremap <silent> <Plug>(ale_complete) :ALEComplete
cnoremap <C-G> 
cnoremap <M-d> <S-Right><Del>
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>
cnoremap <C-D> <Del>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
map! <D-v> *
noremap  h
noremap <NL> j
noremap  k
noremap  l
nnoremap <silent>  :CtrlP
nnoremap   ;
cnoremap ä <S-Right><Del>
cnoremap æ <S-Right>
cnoremap â <S-Left>
nmap <silent> \W\m <Plug>VimwikiMakeTomorrowDiaryNote
nmap <silent> \W\y <Plug>VimwikiMakeYesterdayDiaryNote
nmap <silent> \W\t <Plug>VimwikiTabMakeDiaryNote
nmap <silent> \W\w <Plug>VimwikiMakeDiaryNote
nmap <silent> \W\i <Plug>VimwikiDiaryGenerateLinks
nmap <silent> \Wi <Plug>VimwikiDiaryIndex
nmap <silent> \Ws <Plug>VimwikiUISelect
nmap <silent> \Wt <Plug>VimwikiTabIndex
nmap <silent> \Ww <Plug>VimwikiIndex
nmap \h :call GOVIMHover()
noremap \5 4gt
noremap \4 4gt
noremap \3 3gt
noremap \2 2gt
noremap \1 1gt
noremap \T gT
noremap \t gt
map \Bl :set background=light
map \Bd :set background=dark
map \Wg :VimwikiDiaryGenerateLinks
map \Wy :VimwikiIndex:VimwikiMakeDiaryNote
map \Wb :VimwikiAll2HTML:Vimwiki2HTMLBrowse
nnoremap \\c :call DRD_toggleCol()
nnoremap <silent> \z :ZoomWin
map \E =
map \x :execute getline(".")
map \R 1z=
nnoremap \\p :w !pbcopy
vnoremap \y :w !pbcopy
nnoremap \P "ap
nnoremap \Y :let @a=expand("%") . ':' . line(".")
nnoremap \w :w
map \ss :setlocal spell spelllang=en_us
map \se :setlocal spell spelllang=es_es
nnoremap \sf 1z=
nnoremap \sp :set spell!
nnoremap <silent> \gb :e $HOME/Dropbox/Documents/GTD/Inbox.md:vsp:e $HOME/Dropbox/Documents/GTD/Today.md
nnoremap <silent> \gl :e $HOME/Dropbox/Documents/librato/index.md
nnoremap <silent> \gc :e $HOME/Dropbox/Documents/GTD/Scratch.md
nnoremap <silent> \gt :e $HOME/Dropbox/Documents/GTD/Today.md
nnoremap <silent> \gp :e $HOME/Dropbox/Documents/GTD/Progress_Update.md
nnoremap <silent> \gi :e $HOME/Dropbox/Documents/GTD/Inbox.md
nnoremap <silent> \gs :e $HOME/Dropbox/Documents/GTD/Scratch.md
nnoremap <silent> \gd :e $HOME/Dropbox/Documents/GTD/Done.md
vnoremap \kv y:Ack =fnameescape(@")
noremap \kc :Ack <cword>
noremap \vu :BundleUpdate
noremap \nf :NERDTreeFind
noremap <silent> \nt :NERDTreeToggle
noremap \rr :redraw!
nnoremap \p :cd %:h
nnoremap \l :set list!
nnoremap \q :nohlsearch
noremap \sg fL
noremap \sv :vsp
noremap \sh :sp
noremap \sc :close
noremap \uy :windo execute ':set number'
noremap \un :windo execute ':set nonu norelativenumber'
nnoremap \f 
noremap \\q :qa!
nnoremap \ev :e $MYVIMRC
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nnoremap j gj
nnoremap k gk
xnoremap <silent> <Plug>(coc-git-chunk-outer) :call coc#rpc#request('doKeymap', ['git-chunk-outer'])
onoremap <silent> <Plug>(coc-git-chunk-outer) :call coc#rpc#request('doKeymap', ['git-chunk-outer'])
xnoremap <silent> <Plug>(coc-git-chunk-inner) :call coc#rpc#request('doKeymap', ['git-chunk-inner'])
onoremap <silent> <Plug>(coc-git-chunk-inner) :call coc#rpc#request('doKeymap', ['git-chunk-inner'])
nnoremap <silent> <Plug>(coc-git-commit) :call coc#rpc#notify('doKeymap', ['git-commit'])
nnoremap <silent> <Plug>(coc-git-chunkinfo) :call coc#rpc#notify('doKeymap', ['git-chunkinfo'])
nnoremap <silent> <Plug>(coc-git-prevchunk) :call coc#rpc#notify('doKeymap', ['git-prevchunk'])
nnoremap <silent> <Plug>(coc-git-nextchunk) :call coc#rpc#notify('doKeymap', ['git-nextchunk'])
vnoremap <silent> <Plug>(coc-snippets-select) :call coc#rpc#notify('doKeymap', ['snippets-select'])
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
onoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectFunction', [v:false, ''])
onoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectFunction', [v:true, ''])
vnoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectFunction', [v:false, visualmode()])
vnoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectFunction', [v:true, visualmode()])
nnoremap <silent> <Plug>(coc-cursors-position) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'position', 'n'])
nnoremap <silent> <Plug>(coc-cursors-word) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'word', 'n'])
vnoremap <silent> <Plug>(coc-cursors-range) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'range', visualmode()])
nnoremap <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <Plug>(coc-float-jump) :call       coc#util#float_jump()
nnoremap <Plug>(coc-float-hide) :call       coc#util#float_hide()
nnoremap <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <Plug>(coc-references) :call       CocActionAsync('jumpReferences')
nnoremap <Plug>(coc-type-definition) :call       CocActionAsync('jumpTypeDefinition')
nnoremap <Plug>(coc-implementation) :call       CocActionAsync('jumpImplementation')
nnoremap <Plug>(coc-declaration) :call       CocActionAsync('jumpDeclaration')
nnoremap <Plug>(coc-definition) :call       CocActionAsync('jumpDefinition')
nnoremap <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction',         '')
vnoremap <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction',         visualmode())
vnoremap <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected',     visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocAction('rangeSelect',     '', v:true)
vnoremap <Plug>(coc-range-select-backward) :call       CocAction('rangeSelect',     visualmode(), v:false)
vnoremap <Plug>(coc-range-select) :call       CocAction('rangeSelect',     visualmode(), v:true)
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_vsplit) :ALEGoToTypeDefinitionInVSplit
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_split) :ALEGoToTypeDefinitionInSplit
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_tab) :ALEGoToTypeDefinitionInTab
nnoremap <silent> <Plug>(ale_go_to_definition_in_vsplit) :ALEGoToDefinitionInVSplit
nnoremap <silent> <Plug>(ale_go_to_definition_in_split) :ALEGoToDefinitionInSplit
nnoremap <silent> <Plug>(ale_go_to_definition_in_tab) :ALEGoToDefinitionInTab
nnoremap <silent> <Plug>(ale_repeat_selection) :ALERepeatSelection
nnoremap <silent> <Plug>(ale_rename) :ALERename
nnoremap <silent> <Plug>(ale_documentation) :ALEDocumentation
nnoremap <silent> <Plug>(ale_hover) :ALEHover
nnoremap <silent> <Plug>(ale_find_references) :ALEFindReferences
nnoremap <silent> <Plug>(ale_go_to_type_definition) :ALEGoToTypeDefinition
nnoremap <silent> <Plug>(ale_go_to_definition) :ALEGoToDefinition
nnoremap <silent> <Plug>(ale_fix) :ALEFix
nnoremap <silent> <Plug>(ale_detail) :ALEDetail
nnoremap <silent> <Plug>(ale_lint) :ALELint
nnoremap <silent> <Plug>(ale_reset_buffer) :ALEResetBuffer
nnoremap <silent> <Plug>(ale_disable_buffer) :ALEDisableBuffer
nnoremap <silent> <Plug>(ale_enable_buffer) :ALEEnableBuffer
nnoremap <silent> <Plug>(ale_toggle_buffer) :ALEToggleBuffer
nnoremap <silent> <Plug>(ale_reset) :ALEReset
nnoremap <silent> <Plug>(ale_disable) :ALEDisable
nnoremap <silent> <Plug>(ale_enable) :ALEEnable
nnoremap <silent> <Plug>(ale_toggle) :ALEToggle
nnoremap <silent> <Plug>(ale_last) :ALELast
nnoremap <silent> <Plug>(ale_first) :ALEFirst
nnoremap <silent> <Plug>(ale_next_wrap_warning) :ALENext -wrap -warning
nnoremap <silent> <Plug>(ale_next_warning) :ALENext -warning
nnoremap <silent> <Plug>(ale_next_wrap_error) :ALENext -wrap -error
nnoremap <silent> <Plug>(ale_next_error) :ALENext -error
nnoremap <silent> <Plug>(ale_next_wrap) :ALENextWrap
nnoremap <silent> <Plug>(ale_next) :ALENext
nnoremap <silent> <Plug>(ale_previous_wrap_warning) :ALEPrevious -wrap -warning
nnoremap <silent> <Plug>(ale_previous_warning) :ALEPrevious -warning
nnoremap <silent> <Plug>(ale_previous_wrap_error) :ALEPrevious -wrap -error
nnoremap <silent> <Plug>(ale_previous_error) :ALEPrevious -error
nnoremap <silent> <Plug>(ale_previous_wrap) :ALEPreviousWrap
nnoremap <silent> <Plug>(ale_previous) :ALEPrevious
nnoremap <silent> <C-P> :CtrlP
noremap <C-L> l
noremap <C-K> k
noremap <C-J> j
noremap <C-H> h
vmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
cnoremap  <Home>
cnoremap  <Left>
cnoremap  <Del>
cnoremap  <Right>
cnoremap  
inoremap  <Nop>
cnoremap d <S-Right><Del>
cnoremap f <S-Right>
cnoremap b <S-Left>
let &cpo=s:cpo_save
unlet s:cpo_save
set paste
set backspace=indent,eol,start
set backupdir=~/.vim.backup/
set balloondelay=250
set directory=~/.vim.swp/,/var/tmp/,/tmp/,.
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:▸-,space:x,eol:X,trail:·,nbsp:_
set modelines=3
set mouse=a
set runtimepath=
set runtimepath+=~/.vim
set runtimepath+=~/.vim/plugged/nerdtree
set runtimepath+=~/.vim/plugged/vim-devicons
set runtimepath+=~/.vim/plugged/ctrlp.vim
set runtimepath+=~/.vim/plugged/vim-graphql
set runtimepath+=~/.vim/plugged/vim-lua
set runtimepath+=~/.vim/plugged/govim
set runtimepath+=~/.vim/plugged/vim-airline
set runtimepath+=~/.vim/plugged/vim-airline-themes
set runtimepath+=~/.vim/plugged/vim-nerdtree-syntax-highlight
set runtimepath+=~/.vim/plugged/vim-polyglot
set runtimepath+=~/.vim/plugged/ale
set runtimepath+=~/.vim/plugged/coc.nvim
set runtimepath+=~/.vim/plugged/vimwiki
set runtimepath+=~/.vim/plugged/taboo.vim
set runtimepath+=~/.vim/plugged/oceanic-next
set runtimepath+=~/.vim/plugged/papercolor-theme
set runtimepath+=~/.vim/plugged/vim-misc
set runtimepath+=~/.vim/plugged/vim-session
set runtimepath+=~/.vim/bundle/ctrlp.vim
set runtimepath+=/usr/local/share/vim/vimfiles
set runtimepath+=/usr/local/share/vim/vim82
set runtimepath+=/usr/local/share/vim/vimfiles/after
set runtimepath+=/usr/local/go/misc/vim
set runtimepath+=~/.config/coc/extensions/node_modules/coc-snippets
set runtimepath+=~/.vim/plugged/vim-graphql/after
set runtimepath+=~/.vim/plugged/vim-nerdtree-syntax-highlight/after
set runtimepath+=~/.vim/plugged/vim-polyglot/after
set runtimepath+=~/.vim/plugged/oceanic-next/after
set runtimepath+=~/.vim/after
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal,tabpages,globals
set shiftwidth=2
set shortmess=filnxtToOSc
set showcmd
set smartcase
set spelllang=en_us
set nostartofline
set tabline=%!TabooTabline()
set tabstop=2
set updatetime=500
set viminfo='100,n$HOME/.vim/files/info/viminfo
set wildignore=*.so,*.swp,*.zip,*.pyc
set wildmenu
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
let NERDTreeMapPreviewSplit = "gi"
let NERDTreeMapCloseChildren = "X"
let DevIconsEnableNERDTreeRedraw =  0 
let NERDTreeHijackNetrw = "1"
let NERDTreeShowHidden = "0"
let NERDTreeMapChangeRoot = "C"
let NERDTreeMapCloseDir = "x"
let NERDTreeMarkBookmarks = "1"
let NERDTreeSortHiddenFirst = "1"
let NERDTreeShowLineNumbers = "0"
let WebDevIconsNerdTreeGitPluginForceVAlign =  1 
let NERDTreeRespectWildIgnore = "0"
let NERDTreeAutoDeleteBuffer =  0 
let NERDTreeMapHelp = "?"
let NERDTreeMapCWD = "CD"
let NERDTreeBookmarksFile = "/Users/drio/.NERDTreeBookmarks"
let NERDTreeMapToggleHidden = "I"
let NERDTreeWinSize =  30 
let NERDTreeMenuUp = "k"
let DevIconsEnableFoldersOpenClose =  0 
let NERDTreeUseTCD = "0"
let WebDevIconsNerdTreeAfterGlyphPadding = " "
let DevIconsEnableFolderExtensionPatternMatching =  0 
let NERDTreeCascadeSingleChildDir = "1"
let Taboo_tabs = ""
let NERDTreeNotificationThreshold = "100"
let NERDTreeMapActivateNode = "o"
let NERDTreeMapCustomOpen = "<CR>"
let NERDTreeAutoCenter = "1"
let NERDTreeDirArrowExpandable = "▸"
let WebDevIconsUnicodeDecorateFileNodes =  1 
let NERDTreeMapMenu = "m"
let DevIconsEnableFolderPatternMatching =  1 
let NERDTreeStatusline = "%{exists('b:NERDTree')?b:NERDTree.root.path.str():''}"
let NERDTreeMapOpenInTabSilent = "T"
let NERDTreeMapJumpParent = "p"
let NERDTreeMapToggleFilters = "f"
let WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ""
let NERDTreeLimitedSyntax =  1 
let NERDTreeMapJumpPrevSibling = "<C-k>"
let WebDevIconsTabAirLineAfterGlyphPadding = ""
let NERDTreeNodeDelimiter = ""
let NERDTreeShowBookmarks = "0"
let NERDTreeRemoveDirCmd = "rm -rf "
let DevIconsArtifactFixChar = " "
let NERDTreeChDirMode =  2 
let NERDTreeCreatePrefix = "silent"
let NERDTreeMinimalUI = "0"
let WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ""
let NERDTreeAutoCenterThreshold = "3"
let NERDTreeShowFiles = "1"
let NERDTreeMapOpenVSplit = "s"
let NERDTreeMapOpenSplit = "i"
let NERDTreeMapPreview = "go"
let NERDTreeCaseSensitiveSort = "0"
let WebDevIconsUnicodeDecorateFolderNodesExactMatches =  1 
let NERDTreeBookmarksSort = "1"
let NERDTreeHighlightCursorline =  0 
let WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ""
let DevIconsAppendArtifactFix =  0 
let NERDTreeMouseMode = "1"
let WebDevIconsUnicodeDecorateFolderNodes =  1 
let WebDevIconsNerdTreeBeforeGlyphPadding = " "
let WebDevIconsUnicodeGlyphDoubleWidth =  1 
let NERDTreeMapUpdir = "u"
let WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol = ""
let NERDTreeMapJumpRoot = "P"
let NERDTreeMapChdir = "cd"
let NERDTreeMenuDown = "j"
let NERDTreeMapToggleZoom = "A"
let NERDTreeMapPreviewVSplit = "gs"
let NERDTreeMinimalMenu = "0"
let NERDTreeMapRefreshRoot = "R"
let NERDTreeCascadeOpenSingleChildDir = "1"
let NERDTreeMapJumpLastChild = "J"
let NERDTreeWinPos = "left"
let NERDTreeMapRefresh = "r"
let NERDTreeMapDeleteBookmark = "D"
let NERDTreeNaturalSort = "0"
let NERDTreeMapJumpNextSibling = "<C-j>"
let NERDTreeUpdateOnCursorHold =  1 
let NERDTreeMapOpenInTab = "t"
let DevIconsDefaultFolderOpenSymbol = ""
let NERDTreeDirArrowCollapsible = "▾"
let NERDTreeMapQuit = "q"
let MRU_Use_Current_Window =  1 
let NERDTreeSortDirs = "1"
let NERDTreeMapToggleFiles = "F"
let NERDTreeDirArrows =  1 
let NERDTreeMapOpenExpl = "e"
let NERDTreeMapJumpFirstChild = "K"
let NERDTreeGlyphReadOnly = "RO"
let NERDTreeMapOpenRecursively = "O"
let NERDTreeMapToggleBookmarks = "B"
let NERDTreeCopyCmd = "cp -r "
let WebDevIconsTabAirLineBeforeGlyphPadding = " "
let NERDTreeMapUpdirKeepOpen = "U"
let NERDTreeQuitOnOpen = "0"
silent only
silent tabonly
cd ~/dev/iot/golights
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit Makefile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:#\ -,mO:#\ \ ,b:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'make'
setlocal filetype=make
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*include
setlocal includeexpr=
setlocal indentexpr=GetMakeIndent()
setlocal indentkeys=!^F,o,O,<:>,=else,=endif
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=yes
setlocal signcolumn=yes
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en_us
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'make'
setlocal syntax=make
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 17 - ((16 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 0
tabnext 1
badd +1 setup-tmux.sh
badd +0 Makefile
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSc
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
