execute pathogen#infect()
syntax on
packadd! onedark.vim
filetype plugin indent on
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
autocmd BufWritePre * %s/\s\+$//e

set termguicolors
set belloff=all

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:onedark_termcolors=256
colorscheme onedark
set background=dark

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set backspace=indent,eol,start

" Spacebar is leader
nnoremap <SPACE> <Nop>
let mapleader=" "

map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\\.swo$', '\\.swp$', '\\.git']
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*

let NERDTreeRespectWildIgnore=1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
end

" bind K to grep work under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nnoremap <leader>c :%s/\<<C-r><C-w>\>//gn<CR>


let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'tmp'

autocmd BufNewFile,BufRead *.es6 set syntax=javascript
autocmd BufNewFile,BufRead *.es6.erb set syntax=javascript
let g:ale_linter_aliases = {'es6': 'javascript'}

command! W  write
