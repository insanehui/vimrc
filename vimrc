set nocompatible

"{{{ vundle配置 
" vundle要求filetype off，具体原因不详
filetype off

" 在这之前要先下载vundle，从github克隆即可
" 官方建议: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 当然不克隆到建议的目录，也是可以的。
" 由于~/.vim/bunble/是vundle的默认工作目录，这样方便vundle自己管理自己
" set rtp+=~/.vim/bundle/Vundle.vim 
" vundle用let来代替set rtp，见下：

" 参考自：https://github.com/VundleVim/Vundle.vim/wiki/Tips-and-Tricks 
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/.vim' : '$HOME/.vim' "这里windows和linux一样
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
" call vundle#begin(expand(vimDir . '/bundle'))
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"{{{ vim-go 
Plugin 'fatih/vim-go'
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
"
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0

"}}}

Plugin 'godlygeek/tabular'
Plugin 'bufexplorer.zip'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'mru.vim'
Plugin 'tpope/vim-commentary'
" Plugin 'TabBar'
" Plugin 'FavEx'

"{{{ git相关 
Plugin 'tpope/vim-fugitive'
"}}}

"{{{ vimproc 
Plugin 'Shougo/vimproc.vim'
"}}}

"{{{ vimshell 
Plugin 'Shougo/vimshell.vim'
"}}}

"{{{ neocomplete 
Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
"}}}

"{{{ nerdtree 
Plugin 'scrooloose/nerdtree'

" 自动打开nerdtree，并打开书签
" autocmd vimenter * NERDTree | set number | exec 'normal B' 

" 启动空vim的时候，打开nerdtree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | set number | exec 'normal Bj' | endif
" 只剩nerdtree的时候，自觉退出vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""}}}

" Plugin 'Xuyuanp/nerdtree-git-plugin'

"{{{ 状态栏 
Plugin 'vim-airline/vim-airline'
"}}}

"{{{ 前端 
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'elzr/vim-json'

Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

"}}}

"{{{ markdown 
Plugin 'plasticboy/vim-markdown'
"}}}

"{{{ 主题配色

" 大合集
Plugin 'flazz/vim-colorschemes'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'phd'
"}}}

"{{{ markdown预览的插件 
Plugin 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "C:/Program Files (x86)/Tencent/QQBrowser/QQBrowser.exe"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）

let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令
"}}}

call vundle#end()
" 在vundle end之后，开启plugin indent syntax on，这样实际上filetype也相当于是on的？
" }}}

filetype plugin indent on
syntax on

"{{{ 主题设置 
" 同一个主题，似乎背景也可以有dark和light的模式
colorscheme vs
" set background=light 
" }}}


set backspace =indent,eol,start "使插入状态下能正常使用退格键
set tabstop=4
set shiftwidth=4
set smarttab
set nobackup
set expandtab
set ignorecase
set smartcase
set incsearch

" 自动CD到当前目录
" set autochdir
autocmd BufEnter * silent! lcd %:p:h

" 显示坐标、当前位置百分比
set ruler
" 切换buffer不需要保存
set hidden

" 光标的坐标线
" set cursorline
" set cursorcolumn

" 显示行号
" set number 
set relativenumber

"{{{ 编码设置 

set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
" windows gvim忽略该选项
set termencoding=utf-8
set fileformats=unix,dos

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 以下这两行据说是解决菜单问题，但是没起作用，也不知道是什么含义
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8


"}}}

" 自动缩进
set autoindent
set nowrap
set nowrapscan
set autoread "文件被修改后自动加载"
set showcmd

" 自动读、自动加载（不再弹出文件已经被修改，是否重新加载的提示框）
set autoread
" 自动写，比如在make，next等命令等待的时候，可以保存文件
set autowrite
set scrolloff=3


"{{{ 折叠 
" set foldlevel=99
set foldmethod=marker
set foldcolumn=8
set fillchars=vert:\|,fold:\ 
set foldtext=MyFoldText()

function! MyFoldText()
	let line = getline(v:foldstart)
    
    "以下操作对空格的处理只去掉一个，多余的空格将会保留
    "以后查看看有没有trim之类的函数自动去除两端空白字符

    "删掉折叠标记
    "以前的
	"let line = substitute(line, '//'.'< ', '[', 'g') "这里使用.来连接字符串于是为了防止产生折叠
	let line = substitute(line, '{{'.'{', '[', 'g') "这里使用.来连接字符串于是为了防止产生折叠
    "删掉各种语言的注释标记
    let line = substitute(line, '<!--\|-->\|^"\|//\|#\|/\*\|\*/', '', 'g')
	return line . ' ]'
endf
" }}}

function! TabCmd(cmd) " {{{
  redir => message

  " 如果不用silent的话，会产生需要和用户交互的环节（比如“按Enter键继续”等）
  silent execute a:cmd

  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    " 如果不设置以下选项，会出现一些不方便的情况
    " 比如，关闭时要询问是否保存
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

" 定义成Ex命令
command! -nargs=+ -complete=command TabCmd call TabCmd(<q-args>) 
" }}}

"{{{ 自动最大化 
" 全屏函数（for Linux）
" fun! ToggleFullscreen()
"     call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
" endf

fun! Maximize() "for Windows
    call system("nircmdc win max class Vim")
endf
autocmd GUIEnter * call Maximize()
"}}}

"{{{ 保存状态 
" autocmd QuitPre * mks! ~/.vimses
" autocmd VimEnter * so ~/.vimses
" command! S mks! ~/.vimses
command! Q mks! ~/.vimses | xa
command! L so ~/.vimses
"}}}

" au FileType go nmap <leader>b <Plug>(go-build)

"{{{ 快捷键 keymaps

" 快速编辑vimrc
nnoremap <leader>vc :e $MYVIMRC<cr>
nnoremap <leader>sc :source $MYVIMRC<cr>

" 重映射commentary.vim的快捷键
map <Leader><Bslash> gc
map <Leader><Bslash><Space> gcgc

" 将词移到右边（交换两个词的位置）
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>

" 快捷复制和粘贴到系统剪贴板
" 但好像还是有问题
noremap <Leader>y "+y
noremap <Leader>p "+p

" tabular
" ？现在暂时不会如何映射成operator pending的模式
vnoremap <Leader>t :Tabularize /
vnoremap <Leader><Space> :Tabularize /<Bar><cr>


" 切换查找高亮
noremap <C-h> :set hls!<CR>

" nerdtree相关
noremap <C-n> :NERDTreeToggle<CR>

" 查看oldfiles
noremap <Leader>o :browse old<cr>
" 打开当前文件，这里传到vimproc#system处要转义一次"\"
noremap <Leader>e :call vimproc#system('explorer /select,' . substitute(expand('%:p'), '\\', '\\\\', 'g'))<cr>

"}}}

"{{{ 其他一些供参考的配置 

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

"  }}}

