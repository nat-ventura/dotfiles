syntax on

colorscheme elflord

execute pathogen#infect()

" changes tabs to 2 spaces
filetype plugin indent on
set tabstop=2

" when indenting with `>` use 2 spaces
set shiftwidth=2

" insert space chars when tab is pressed
set expandtab

" show whitespace
" set list

" turn on line numbers
set number

" show matching brackets
set showmatch

" automatic bracket setting
" inoremap ( ()<Esc>:let leavechar=")"<CR>i
" inoremap [ []<Esc>:let leavechar="]"<CR>i
" inoremap { {}<Esc>:let leavechar="}"<CR>i
"inoremap " ""<Esc>:let leavechar="\""<CR>i
"inoremap ' ''<Esc>:let leavechar="'"<CR>i
"inoremap < <><Esc>:let leavechar=">"<CR>i

"imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

"inoremap <C-j> <Esc>/[)}"'/]>]<CR>:nohl<CR>a

" remapping `gc` from commentary plugin
xnoremap <C-\> gc
