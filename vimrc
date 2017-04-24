"Test
" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible

" use pathogen to easily modify the runtime path ->
" -> to include all plugins under the ~/.vim /bundle
call pathogen#helptags()
call pathogen#infect()
"set hidden

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set mousefocus
"display settings
set encoding=utf-8 " encoding used for displaying file
set ruler " show the cursor position all the time
set showmatch " highlight matching braces
set showmode " show insert/replace/visual mode

" write settings
set confirm " confirm :q in case of unsaved changes
set fileencoding=utf-8 " encoding used when saving file
set nobackup " do not keep the backup~ file

" edit settings
set backspace=indent,eol,start " backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number
set expandtab " fill tabs with spaces
set nojoinspaces " no extra space after '.' when joining lines
set shiftwidth=4 " set indentation depth to 8 columns
set softtabstop=4 " backspacing over 8 spaces like over tabs
set tabstop=4 " set tabulator length to 8 columns
set textwidth=80 " wrap lines automatically at 80th column

" search settings
set hlsearch " highlight search results
set ignorecase " do case insensitive search...
set incsearch " do incremental search
set smartcase " ...unless capital letters are used

syntax on
" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
let g:tex_flavor = "latex"
" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>
" " View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>)

set t_Co=128
"colorscheme solarized
colorscheme pyte
syntax enable " enable syntax highlighting
set guifont=Courier\ Bold\ 12
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"Translation to greek characters
"g:translit_map "greek"
"g:translit_toggle_keymap "<C-T>"
nnoremap <C-G> :exec Translit('greek')<cr>
inoremap <C-G> <C-r>=Translit('greek')<cr>

" automatic commands
if has('autocmd')
        " file type specific automatic commands

        " don't replace Tabs with spaces when editing makefiles
        autocmd Filetype makefile setlocal noexpandtab

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge
endif
nnoremap j jzz
nnoremap k kzz
" windows movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" general key mappings

"replacing : with ;

nnoremap ; :

" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a

"set backup " make backup files
"set backupdir = ~/vim_backup

" different paste regime
set pastetoggle=<F2>

" not inserting new //
au FileType c,cpp setlocal comments-=:// comments+=f://

" usual save works
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" new lines in comand mode
nmap <c-n> i<CR><Esc>

nmap <Backspace> i<Backspace><right><Esc>
nmap <Space>  i<Space><right><Esc>
nmap <CR> o<Esc>

nmap <c-d> i:;dot;dot;<CR><Esc>

"set different cursore for different modes"
"set cul
"hi CursorLine cterm=NONE ctermbg=black
"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul
"
"Use control - space to leave the insert mode
inoremap <C-o> <Esc>
"Folding properties
set foldmethod=manual
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
set viewoptions=cursor,folds,slash,unix

set wrap
set linebreak
set nolist
set textwidth=0
"Command for scripting
"nmap <leader>s :source ~/Dropbox/Script/text.vim

"Mapping for complex regular expression
vnoremap c U
function! PlaySound()
  :DoQuietly play ~/.vim/support/key13.mp3
endfunction
autocmd CursorMovedI * call PlaySound()

let g:do_auto_show_process_window = 0
let g:do_update_time=1
call do#ReloadOptions()

"commands for note taking with note.vim
let g:notes_directories = ['~/Dropbox/notes']
vmap <Leader>ns :NoteFromSelectedText<CR>
