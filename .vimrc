let g:dotvim_settings = {}
let g:dotvim_settings.version = 1
let g:dotvim_settings.plugin_groups_exclude = []

let g:airline_powerline_fonts = 1

let g:ctrlp_user_command = 'cd %s && ((test -e ./.git && git ls-files -o --exclude-standard --cached) || find * -type f)'

source ~/.vim/vimrc

set tags+=gems.tags
set tags+=stdlib.tags

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep= "\ue0b0"

set relativenumber
set number

set wildmode=longest,list,full
set wildmenu

let base16colorspace=256
set background=dark
colorscheme base16-3024
