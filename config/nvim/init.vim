" minpac package manager
" Try to load minpac.
set packpath^=~/.vim
packadd minpac

if !exists('*minpac#init')
  " minpac is not available.

  " Settings for plugin-less environment.
  " ...
else
	" init with verbosity 3 to see minpac work
	call minpac#init({'verbose': 3})
	" let minpac manage itself
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	" utils
	call minpac#add('Shougo/vimproc.vim', {'do': 'silent! !make'})
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-vinegar')
	call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
	call minpac#add('junegunn/fzf')														" fuzzy search
	call minpac#add('neoclide/coc.nvim', { 'branch': 'release' })	" completion
	" call minpac#add('tpope/vim-projectionist')
	call minpac#add('tpope/vim-dispatch')
	call minpac#add('jiangmiao/auto-pairs')
	call minpac#add('w0rp/ale')																" linting
	call minpac#add('mhinz/vim-grepper')											" search with grep
	call minpac#add('janko-m/vim-test')												" Run tests
	call minpac#add('christoomey/vim-tmux-navigator')					" tmux navigation
	call minpac#add('tpope/vim-obsession')										" Manage sessions

	" snippets
	call minpac#add('SirVer/ultisnips')												" snippets
	call minpac#add('honza/vim-snippets')	
	" JavaScript
	call minpac#add('pangloss/vim-javascript')
	call minpac#add('maxmellon/vim-jsx-pretty')

	" typescript
	call minpac#add('leafgarland/typescript-vim')
	call minpac#add('peitalin/vim-jsx-typescript')

	" ReasonML
	call minpac#add('reasonml-editor/vim-reason-plus')

" Elm
	call minpac#add('elmcast/elm-vim')

" Haskell
	call minpac#add('neovimhaskell/haskell-vim')

	" Colorschemes
	call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})
	call minpac#add('morhetz/gruvbox', {'type': 'opt'})
	call minpac#add('rakr/vim-one', {'type': 'opt'})
	call minpac#add('NLKNguyen/papercolor-theme', {'type': 'opt'})
	call minpac#add('reedes/vim-colors-pencil', {'type': 'opt'})

	" Themes
	call minpac#add('vim-airline/vim-airline', {'type': 'opt'})
	call minpac#add('vim-airline/vim-airline-themes', {'type': 'opt'})

	" Nerdtree
	call minpac#add('scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] })
	call minpac#add('Xuyuanp/nerdtree-git-plugin')						" Nerdtree git
	call minpac#add('ryanoasis/vim-devicons')									" File type glyphs
	call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight') " Syntax highlighting in nerdtree
endif

" encoding
set encoding=UTF-8
" adding the flags to NERDTree
" let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face

augroup nerdtree
		autocmd!
		autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
		autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

" Toggle NERDTree
function! ToggleNerdTree()
		if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
				:NERDTreeFind
		else
				:NERDTreeToggle
		endif
endfunction
" toggle nerd tree
nmap <silent> <leader>k :call ToggleNerdTree()<cr>
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }

" startify
call minpac#add('mhinz/vim-startify')
" Don't change to directory when selecting a file
call minpac#add('ryanoasis/vim-devicons')									" File type glyphs
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

function! s:list_commits()
		let git = 'git -C ' . getcwd()
		let commits = systemlist(git . ' log --oneline | head -n5')
		let git = 'G' . git[1:]
		return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
\  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
\  { 'type': 'commands',  'header': [ 'Commands' ]       },
\ ]

let g:startify_commands = [
\   { 'up': [ 'Update Plugins', ':PackUpdate' ] }
\ ]

let g:startify_bookmarks = [
		\ { 'c': '~/.dotfiles/config/nvim/init.vim' },
		\ { 'z': '~/.dotfiles/zsh/zshrc.symlink' }
\ ]


" Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" remappings
let mapleader = ','
" split window remapping
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" fzf
nnoremap <C-p> :<C-u>FZF<CR>

" For JavaScript files, use `eslint` (and only eslint)
" ===============================================================
" " Ale Config
" " ===============================================================
" let g:ale_linters = {}
" let g:ale_fixers = {}
" let g:ale_fix_on_save = 1
" let g:ale_set_baloons = 1
"
" :call extend(g:ale_fixers, {'*': ['remove_trailing_lines', 'trim_whitespace']})
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \ }
" let ale lint
" let g:ale_lint_on_text_changed = 'always'	" default
" let g:ale_lint_on_save = 1								" default
" let g:ale_lint_on_enter = 1								" default
" let g:ale_lint_on_filetype_changed = 1		" default
" let g:ale_sign_column_always = 1					" default

" grepper plugin
let g:grepper		= {}
let g:grepper.tools	= ['grep', 'git', 'rg']

" Haskell setup
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Open Greeper-prompt for a particular grep-alike tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

" Colorscheme
set termguicolors
set background=dark
let g:airline_theme='one'
let g:one_allow_italics=1
let g:gruvbox_italics=1
silent! colorscheme one

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" appearance
" Airline
set laststatus=2
set ttimeoutlen=50
" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set number " show line numbers
syntax enable
" set mouse=a
" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

set autoread " detect when a file is changed

set foldcolumn=0
sign unplace *

" Terminal
if has('nvim') || has('terminal')
	highlight! link TermCursor Cursor
	highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
	highlight SpecialKey none
endif

" window switching
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

if has('nvim') || has('terminal')
	tnoremap <M-h> <c-\><c-n><c-w>h
	tnoremap <M-j> <c-\><c-n><c-w>j
	tnoremap <M-k> <c-\><c-n><c-w>k
	tnoremap <M-l> <c-\><c-n><c-w>l
endif

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
" undo
set undodir=$VIMDATA/undo
set undofile

augroup vimrc
	autocmd!
	autocmd BufWritePre /tmp/* setlocal noundofile
augroup END


" NOT MINE

" remove extra whitespace
" nmap <leader><space> :%s/\s\+$<cr>
" nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>
