" .vimrc
set nocompatible
filetype off

set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" my bundles
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
" Plugin 'tpope/vim-haml'
Plugin 'kien/ctrlp.vim'
" Plugin 'mattn/emmet-vim'
" Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'osyo-manga/vim-over'
Plugin 'rking/ag.vim'
" Plugin 'elixir-lang/vim-elixir'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'SirVer/ultisnips'
" Plugin 'elmcast/elm-vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'vim-scripts/phpfolding.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()

syntax on
filetype plugin indent on

" more naturalsplit opening
" set splitbelow
" set splitright

set clipboard=unnamed

set path+=**

" set dark background and color scheme
set background=dark
colorscheme jellybeans

" Force 256 color mode if available
if $TERM =~ "-256color"
  set t_Co=256
endif

" ---------------
" jellybeans.vim colorscheme tweaks
" ---------------
" Make cssAttrs (center, block, etc.) the same color as units
hi! link cssAttr Constant
hi SignColumn ctermbg=233
hi IndentGuidesEven ctermbg=235
hi IndentGuidesOdd ctermbg=234

" get rid of the | character in vsplits
set fillchars+=vert:\ 

" elm-format
" let g:elm_format_autosave = 1

" UltiSnips config
" let g:UltiSnipsEditSplit = 'context'

" ---------------
" airline
" ---------------
let g:airline_theme = 'jellybeans'
" let g:airline_symbols = {}
" let g:airline_symbols.whitespace = 'Ξ'

let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_mode_map = {
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ 'c'  : 'CMD',
      \ '' : 'VB',
      \ }

" Show the current working directory folder name
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '

" Just show the file name
let g:airline_section_c = '%t'

" enable indent guides
let g:indent_guides_enable_on_vim_startup = 1

" enable mustache abbreviations
" let g:mustache_abbreviations = 1

" emmet support for handlebars
" let g:user_emmet_install_global = 0
" autocmd FileType html.handlebars,hbs,html,css,scss,sass EmmetInstall

" setup some custom colors
highlight VertSplit    ctermbg=236 cterm=none
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
" highlight StatusLineNC ctermbg=238 ctermfg=0
" highlight StatusLine   ctermbg=238 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3 cterm=none
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

" highlight the status bar when in insert mode
" if version >= 700
"   au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
"   au InsertLeave * hi StatusLine ctermfg=240 ctermbg=12
" endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd FileType json setlocal softtabstop=4 shiftwidth=4
autocmd FileType php setlocal noexpandtab

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set softtabstop=2
set expandtab                     " use spaces, not tab characters
set backspace=indent,eol,start
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
" set colorcolumn=80                " show colorcolumn
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=                        " disable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
" set list lcs=tab:»·,trail:·,eol:¬ " show extra space characters
set nobackup                      " don't write backup files
set noswapfile                    " don't write swap files
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full

set wildignore+=*/node_modules/*, " ctrlp ignore indexing node_modules
set wildignore+=*/bower_components/*,
set wildignore+=*/_build/*,
set wildignore+=*/elm-stuff/*,
set wildignore+=*/tmp/*,*/dist/*,*/bin/*,*/.git/*

" Use Silver Searcher instead of grep
set grepprg=ag

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" in php enable tabs
autocmd FileType php setlocal ts=4 sw=4 sts=4

" set leader key to comma
let mapleader = ","

" ctlp config
" let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reverse = 1

" use silver searcher for crtlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" clear the command line and search highlighting
noremap <silent><C-l> :nohlsearch<CR>

" remap [ and ]
nnoremap ü ]
nnoremap Ü [

" got to learn to navigate without the arrow keys ;-)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" H L - center
noremap H Hzz
noremap L Lzz

" some handy shortcuts
nnoremap <Leader>w <C-w>w
nnoremap <C-x> <C-w>c
" noremap <Leader>n :cn<CR>
" noremap <Leader>p :cp<CR>
nnoremap <Leader>A :Ag! 
nnoremap <Leader>ag :Ag! 
nnoremap <Leader>m :NERDTreeToggle<CR>
nnoremap <Leader>l :w<CR>:!clear && node index.js<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>v :vsp <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>vn :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" vim-over - Find and Replace
function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction

function! VisualFindandReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindandReplaceWithSelection()<CR>

" testing stuff
let g:rspec_command = "!clear && mix test {spec}"

" RSpec.vim mappings
map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>n :w<cr>:call RunNearestSpec()<CR>
" map <Leader>s :w<cr>:call RunNearestSpec()<CR>
" map <Leader>l :w<cr>:call RunLastSpec()<CR>
" map <Leader>T :w<cr>:call RunAllSpecs()<CR>


let s:plugin_path = expand("<sfile>:p:h:h")
let s:default_command = "rspec {spec}"
let s:force_gui = 0

if !exists("g:rspec_runner")
  let g:rspec_runner = "os_x_terminal"
endif

function! RunAllSpecs()
  let s:last_spec = "spec"
  call s:RunSpecs(s:last_spec)
endfunction

function! RunCurrentSpecFile()
  if s:InSpecFile()
    let s:last_spec_file = s:CurrentFilePath()
    let s:last_spec = s:last_spec_file
    call s:RunSpecs(s:last_spec_file)
  elseif exists("s:last_spec_file")
    call s:RunSpecs(s:last_spec_file)
  endif
endfunction

function! RunNearestSpec()
  if s:InSpecFile()
    let s:last_spec_file = s:CurrentFilePath()
    let s:last_spec_file_with_line = s:last_spec_file . ":" . line(".")
    let s:last_spec = s:last_spec_file_with_line
    call s:RunSpecs(s:last_spec_file_with_line)
  elseif exists("s:last_spec_file_with_line")
    call s:RunSpecs(s:last_spec_file_with_line)
  endif
endfunction

function! RunLastSpec()
  if exists("s:last_spec")
    call s:RunSpecs(s:last_spec)
  endif
endfunction

" === local functions ===

function! s:RunSpecs(spec_location)
  let s:rspec_command = substitute(s:RspecCommand(), "{spec}", a:spec_location, "g")

  execute s:rspec_command
endfunction

function! s:InSpecFile()
  return match(expand("%"), "_test.exs$") != -1
endfunction

function! s:RspecCommand()
  if s:RspecCommandProvided() && s:IsMacGui()
    let l:command = s:GuiCommand(g:rspec_command)
  elseif s:RspecCommandProvided()
    let l:command = g:rspec_command
  elseif s:IsMacGui()
    let l:command = s:GuiCommand(s:default_command)
  else
    let l:command = s:DefaultTerminalCommand()
  endif

  return l:command
endfunction

function! s:RspecCommandProvided()
  return exists("g:rspec_command")
endfunction

function! s:DefaultTerminalCommand()
  return "!" . s:ClearCommand() . " && echo " . s:default_command . " && " . s:default_command
endfunction

function! s:CurrentFilePath()
  return @%
endfunction

function! s:GuiCommand(command)
  return "silent ! '" . s:plugin_path . "/bin/" . g:rspec_runner . "' '" . a:command . "'"
endfunction

function! s:ClearCommand()
  if s:IsWindows()
    return "cls"
  else
    return "clear"
  endif
endfunction

function! s:IsMacGui()
  return s:force_gui || (has("gui_running") && has("gui_macvim"))
endfunction

function! s:IsWindows()
  return has("win32") && fnamemodify(&shell, ':t') ==? "cmd.exe"
endfunction
