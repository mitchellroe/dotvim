" ~/.vimrc
"
" Author: Mitchell Roe

"general:

  syntax enable
  set scrolloff=3
  " Allow switching between buffers even if there are unsaved changes
  set hidden

  " Use the system clipboard
  if has('unnamedplus')
    set clipboard=unnamedplus
  end

  set tabstop=2
  set shiftwidth=2
  set expandtab
  set softtabstop=2
  set autoindent
  set smartindent

  set splitbelow
  set splitright
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  set foldmethod=indent
  set foldlevel=99

  set ignorecase smartcase

  " Switch to i-beam cursor on insert mode
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"

  set number relativenumber
  "noremap <leader>n :set nu! rnu!<CR>

"filetypes:

  "python:
    function PythonOptions()
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      set textwidth=79
      set expandtab
      set autoindent
      set fileformat=unix
    endfunction
    au BufNewFile,BufRead *.py call PythonOptions()

"packages:

  "pathogen:
    execute pathogen#infect()
    filetype plugin indent on

  "ale:
    let g:ale_enabled = 1

  "gruvbox:
    set background=dark
    colorscheme gruvbox

  "indentLine
    let g:indentLine_enabled = 0

  "vim-airline:
    let g:airline_powerline_fonts = 1

  "vim-markdown:
    filetype plugin on
    let g:markdown_enable_spell_checking = 1
    map gf :e <cfile><CR>

  "vim-mergetool
    let g:mergetool_layout = 'mr'
    let g:mergetool_prefer_revision = 'local'

  "vim-table-mode:
    let g:table_mode_corner='|'
