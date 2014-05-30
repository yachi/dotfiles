let g:dotvim_settings = {}
let g:dotvim_settings.version = 1
let g:dotvim_settings.plugin_groups_exclude = []

let g:airline_powerline_fonts = 1

source ~/.vim/vimrc

" CSV {{
NeoBundle 'chrisbra/csv.vim'

if exists("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1

augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat  setfiletype csv
augroup END
" }}

" Slim {{
NeoBundle 'slim-template/vim-slim'
" }}

NeoBundleCheck

set tags+=gems.tags
set tags+=stdlib.tags

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep= "\ue0b0"
