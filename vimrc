
colorscheme zellner

syntax on

set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp936

""""""""""""""""""""""""""""
"vundle config
""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vunble and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""" git repo """""""
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'

"""""" vim scriptes """"
"Plugin 'c.vim'

call vundle#end()
filetype plugin indent on

let mapleader="\<Space>"

"nerdtree """"""""""""""""""""""""""""""
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeWinSize=26
let g:NERDTreeChDirMode=2
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"taglist """"""""""""""""""""""""""""""

let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Sort_Type='name'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth=30
let Tlist_Ctags_Cmd='/usr/bin/ctags'
map <F2> :TlistToggle<CR>

"syntastic """"""""""""""""""""""""""""
" :help syntastic to reading manual
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  set csverb
endif
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type 
" makes the vim window split horizontally, with search
" result display in the new window
"nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


set splitbelow
set splitright

nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

"YouCompleteMe setting
"inoremap <expr> <CR> 	pumvisible() ? "\<C-y>" : "\<CR>"
"nnoremap <leader>jh :YcmCompleter GoToInclude<CR>
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 	"按,jd回跳转到定义
"nmap <F4>	:YcmDiags<CR>
"
"set completeopt=longest,menu
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py' "配置默认的ycm_extra_conf.py
"let g:ycm_confirm_extra_conf=0					"打开vim时不再询问是否加载ycm_extra_conf.py配置
"let g:ycm_collect_identifiers_from_tags_files=1 "使用ctags生成的tags文件
"let g:ycm_python_binary_path='/usr/bin/python3'
"let g:ycm_seed_identifiers_with_syntax=1		" 语法关键字补全
"let g:ycm_key_invoke_completion = '<C-Space>'	" c 全局函数补全

"display setting
set scrolloff=2
set showcmd
set showmode
set ruler
set title
set cursorline


"EDITOR SETTING
set nu

set shiftwidth=4
set tabstop=4
"set expandtab

"set foldmethod=indent
set ignorecase smartcase
set autoindent
set copyindent
"set cindent
set nobackup

set fileformat=unix
set fileformats=unix,dos,mac

set history=1000
set undolevels=1000
set autoread
"set mouse=a

" toggle vim's paste mode; when we want to paste something into vim 
" form a different application, turning on paste mode prevents the
" insertion of extra whitespace
set pastetoggle=<F7>

" Right-click on selection should bring up a menu 
"set mousemodel=popup_setpos

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain command, add a second <cr>
" at the end of the map command
set shortmess=a

" Look for tag def in a "tags" file in the dir of the current file,
" then for that same file in every folder above the folder of the
" current file, until the root
"set tags=./tags;/

" turns off all error bells, visual or otherwise
set noerrorbells visualbell t_vb=
"autocmd vimrc GUIEnter * set visualbell t_vb=

" allow backspace and cursor keys to cross line boundaries 
set whichwrap+=<,>,h,l
set nohlsearch 		" do not highlight searched-for phrases
set incsearch 		" ...but do highligth-as-I-type the search
set gdefault		" this make search/replace global by default

set textwidth=80

" options for formatting text; see :h formatoptions
set formatoptions=tcroqnj
