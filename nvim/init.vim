" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jxnblk/vim-mdx-js'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'elixir-editors/vim-elixir'
Plug 'vim-test/vim-test'
Plug 'pangloss/vim-javascript'
Plug 'dense-analysis/ale'
Plug 'Exafunction/codeium.vim'

call plug#end()

set nocompatible
set encoding=UTF-8

" Set status line to be viewable and to path
set laststatus=2
set statusline+=%F

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Use gruvbox colorscheme
syntax on
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

set number

" Synchronize with system clipboard
set clipboard+=unnamedplus

" Use 2 spaces when pressing on Tab key
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Highlight search
set hlsearch

" Show search matches while typing
set incsearch

" Highlight current line
set cursorline

" Make search case-insensitive except when you include upper-case characters
set ignorecase
set smartcase

" Sane backspace behavior
set backspace=indent,eol,start

" Easily navigate between splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Easy access to the start of a line
nmap 0 ^

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && (git ls-files -co --exclude-standard; echo ' . join(['.env', '.env.custom'], '; echo ') . ')']
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1

" Remove trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Move between wrapped lines, rather than jumping over wrapped segments
nmap j gj
nmap k gk

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Fixes redrawtime exceeded syntax highlighting error
set re=0

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Vim Test Configurations
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>

" Make test commands execute on a new terminal tab
let test#strategy = "terminal"

" Automatically turn on spell-checking for some file types
autocmd BufRead,BufNewFile *.md,*.mdx,*.js,*.jsx,*.ts,*.tsx setlocal spell

" CoC config
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-elixir',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ ]

" Some servers have issues with backup files
set nobackup
set nowritebackup
set hidden

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Prettier command for CoC
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" Source local.vim configuration file
if filereadable(expand("~/.config/nvim/local.vim"))
    source ~/.config/nvim/local.vim
endif
