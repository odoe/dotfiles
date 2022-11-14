call plug#begin()

Plug 'k-takata/minpac', {'type': 'opt'}
" utils
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'Shougo/vimproc.vim', {'do': 'silent! !make'}
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-scriptease', {'type': 'opt'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzysearch
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }	" completion
Plug 'editorconfig/editorconfig-vim' " Editor config
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'											" linting
Plug 'mhinz/vim-grepper'											" search with grep
Plug 'janko-m/vim-test'												" Run tests
Plug 'christoomey/vim-tmux-navigator'					" tmux navigation
Plug 'tpope/vim-obsession'										" Manage sessions
"Plug 'vim-syntastic/syntastic'
" Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'puremourning/vimspector'

" snippets
" Plug 'SirVer/ultisnips'												" snippets
Plug 'honza/vim-snippets'

" JavaScript
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'wuelnerdotexe/vim-astro'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" vue
Plug 'leafOfTree/vim-vue-plugin'

" ReasonML
Plug 'reasonml-editor/vim-reason-plus'

" Solidity
Plug 'tomlion/vim-solidity'

" Elm
Plug 'elmcast/elm-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Rust
Plug 'rust-lang/rust.vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Colorschemes
Plug 'lifepillar/vim-solarized8', {'type': 'opt'}
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one', {'type': 'opt'}
Plug 'NLKNguyen/papercolor-theme', {'type': 'opt'}
Plug 'reedes/vim-colors-pencil', {'type': 'opt'}

" Themes
Plug 'vim-airline/vim-airline', {'type': 'opt'}
Plug 'vim-airline/vim-airline-themes', {'type': 'opt'}

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'						" Nerdtree git
Plug 'ryanoasis/vim-devicons'									" File type glyphs
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax highlighting in nerdtree

call plug#end()

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

let g:netrw_browser_split=2
let g:netrw_banner=0

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
" Plug 'mhinz/vim-startify'
" Don't change to directory when selecting a file
" Plug 'ryanoasis/vim-devicons'									" File type glyphs
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
			\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] }
			\ ]

let g:startify_bookmarks = [
			\ { 'c': '~/.dotfiles/config/nvim/init.vim' },
			\ { 'z': '~/.dotfiles/zsh/zshrc.symlink' }
			\ ]


" Commands
" command! PackUpdate call minpac#update()
" command! PackClean call minpac#clean()

" remappings
let mapleader = ","
" split window remapping
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" fzf
" nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <silent><leader>l :Buffers<CR>

" For JavaScript files, use `eslint` (and only eslint)
" ===============================================================
" " Ale Config
" " ===============================================================
" let g:ale_linters = {}
" let g:ale_fixers = {}
let g:ale_fix_on_save = 1
" let g:ale_set_baloons = 1
"
" :call extend(g:ale_fixers, {'*': ['remove_trailing_lines', 'trim_whitespace']})
let g:ale_fixers = {
			\   'javascript': ['eslint'],
			\   'typescript': ['eslint'],
			\ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" let ale lint
" let g:ale_lint_on_text_changed = 'always'	" default
" let g:ale_lint_on_save = 1								" default
" let g:ale_lint_on_enter = 1								" default
" let g:ale_lint_on_filetype_changed = 1		" default
" let g:ale_sign_column_always = 1					" default

" grepper plugin
let g:grepper		= {}
let g:grepper.tools	= ['grep', 'git', 'rg']

if executable('rg')
	let g:rg_derive_root='true'
endif

" vimspector
nnoremap <Leader>dl :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Haskell setup
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Svelte
let g:svelte_preprocessor_tags = [
  \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' }
  \ ]
let g:svelte_preprocessors = ['ts']

" Astro
let g:astro_typescript = 'enable'

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
let g:airline_theme='gruvbox'
let g:one_allow_italics=1
let g:gruvbox_italics=1
let g:gruvbox_contrast_dark = 'hard'
silent! colorscheme gruvbox-material
hi! Normal guibg=NONE ctermbg=NONE



set guifont=FiraMono\ Nerd\ Font:h12
let g:airline_powerline_fonts = 1

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
" turn relative line numbers on
:set relativenumber
:set rnu
syntax enable
" set mouse=a
" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set smartindent
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
" set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

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
set undodir=$HOME/.vim/undo
set undofile

" ========================================================
" CoC

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" START COC

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
	  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" END COC

" ========================================================

augroup vimrc
	autocmd!
	autocmd BufWritePre /tmp/* setlocal noundofile
augroup END


" NOT MINE

" remove extra whitespace
" nmap <leader><space> :%s/\s\+$<cr>
" nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>
