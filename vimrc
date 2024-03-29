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
  " A nice, easy way to expand and contract folds
  nnoremap <space> za

  set ignorecase smartcase

  " Switch to i-beam cursor on insert mode
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"

  set number relativenumber
  "noremap <leader>n :set nu! rnu!<CR>

  "Highlight trailing whitespace
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/

"filetypes:

  "restore last known position
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif


"packages:

  "pathogen:
    execute pathogen#infect()
    filetype plugin indent on

  "ale:
    nmap <silent> <A-k> <Plug>(ale_previous_wrap)
    nmap <silent> <A-j> <Plug>(ale_next_wrap)
    " See ftplugin directory for file type definitions
    let g:ale_fix_on_save = 1

  "base16-vim:
    let base16colorspace=256
    if filereadable(expand("~/.vimrc_background"))
      source ~/.vimrc_background
    endif
    " Added so I *actually* get a transparent background.
    " https://github.com/chriskempson/base16-shell/issues/94#issuecomment-276286916
    hi Normal  ctermbg=none
    hi NonText ctermbg=none

  "indentLine:
    let g:indentLine_enabled = 0
    " indentLine sets the conceallevel to 2. You may want to set this
    " explicitely for other modes.

  "nerdtree:
    " Automatically open NERDTree if we're in a git repository and we weren't
    " told to open a specific file.
    if argc() == 0
      silent! !git rev-parse --is-inside-work-tree
      if v:shell_error == 0
        autocmd VimEnter * NERDTreeVCS
        autocmd VimEnter * wincmd w
      else
        autocmd VimEnter * NERDTree
        autocmd VimEnter * wincmd w
      endif
    endif
    nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTree<CR>
    nnoremap <C-t> :NERDTreeToggle<CR>

  "simpylfold:
    let g:SimpylFold_docstring_preview=1

  "vim-airline:
    let g:airline_powerline_fonts = 1

  "vim-json
    let g:vim_json_syntax_conceal = 0

  "vim-markdown:
    filetype plugin on
    let g:markdown_enable_spell_checking = 1
    map gf :e <cfile><CR>

  "vim-mergetool:
    let g:mergetool_layout = 'mr'
    let g:mergetool_prefer_revision = 'local'

  "vim-table-mode:
    let g:table_mode_corner='|'
