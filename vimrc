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
"set nobackup " do not keep the backup~ file

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
syntax enable " enable syntax highlighting

" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set vb t_vb=             " don't beep & don't blink
set noerrorbells         " don't beep

" For latex documents
let g:tex_flavor = "latex"
" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>
" " View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>)

"colorscheme solarized
colorscheme pyte
set guifont=Courier\ Bold\ 12
"hi Visual guibg=#404850  
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
    autocmd FileType text hi Visual guibg=#404850
    " not inserting new //
    autocmd FileType c,cpp,js setlocal comments-=:// comments+=f://

    " clean-up commands that run automatically on write; use with caution

    " delete empty or whitespaces-only lines at the end of file
    "autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

    " replace groups of empty or whitespaces-only lines with one empty line
    "autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

    " delete any trailing whitespaces
    "autocmd BufWritePre * :%s/\s\+$//ge
endif
nnoremap j j^zz
nnoremap k k^zz
" windows movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

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

" usual save works
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" new lines in comand mode
nmap <c-n> i<CR><Esc>
nmap <c-w> i<CR><Esc>

nmap <Backspace> i<Backspace><right><Esc>
nmap X <Backspace>
nmap <Space>  i<Space><right><Esc><c-s>
nmap <CR> o<Esc>

nmap s a,<Esc>
vmap s xi, <Esc>
nmap w a;<Esc>
vmap w xi;<Esc>i

nmap e a"" <Esc>
imap <c-e> ""<Esc>i
vmap e xi""<Esc>


"set different cursore for different modes"
"set cul
"hi CursorLine cterm=NONE ctermbg=black
"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul
"
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
nmap <leader>s :source ~/Dropbox/Scripts.vim<CR>
nmap <leader>S :source $MYVIMRC<CR>

"Function for checking the correct state of vim program
function! ReadingMode()
    nmap j j^zbma
    nmap k k^zbma
    nmap , `af,mav$ 
    vmap , <Esc>`af,mav$ 
endfunction

function! EquationMode()
    nmap j j^zbma
    nmap k k^zbma
    imap . <Esc>f"a
    imap / divided by
    imap * multiplied by
    nmap . f"a
    imap $ sum over
endfunction

function! PlaySound()
    silent! exec '!play ~/.vim/support/key04.aiff&'
endfunction

"Use control - space to leave the insert mode
inoremap <C-Space> <Esc>
nnoremap <C-Space> <Esc>


vnoremap c U
"autocmd FocusGained * call PlaySound()

"let g:do_auto_show_process_window = 0
"let g:do_update_time=1
"call do#ReloadOptions()

" commands for note taking with note.vim
let g:notes_directories = ['~/Dropbox/notes']
vmap <Leader>ns :NoteFromSelectedText<CR>

"Comments
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/* ','right': '*/' } }
let g:NERDCustomDelimiters = { 'js': { 'left': '/* ','right': ' */' } }

"Focus mode
"let g:focus_use_default_mapping = 0
"nmap <F11> <Plug>FocusModeToggle      
