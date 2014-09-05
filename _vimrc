""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"	For Vimrc  By  .Mac
"
"                           2013-05-15 17:35:50
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Tips:
"   For.Windows :
"       拷贝字体Monaco.ttf 到Windows下的fonts; Windows用的字体也是Monaco
"       Ctags.exe文件也要拷贝到Windows/system32目录下面
"
"
"
"
"
"
"



""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	default
"""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif


"设置默认编码
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

"不使用VI的键盘模式，用VIm自己的
set nocompatible

"语法高亮
syntax on

"设置行号
set number

"设置历史记录为400条
set history=400

"自动对齐,样式缩进
set autoindent
set smartindent
set cindent

" 设置匹配模式高亮显示
set showmatch

"搜索选项
set incsearch

"在搜索的时候忽略大小写
set ignorecase

"处理未保存或只读文件，弹出确认
set confirm

"侦测文件类型
filetype on

"载入文件类型插件
filetype plugin on

"为特定文件类型载入相关缩进文件
filetype indent on

"保存全局变量
set viminfo+=!

"状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"不备份文件
set nobackup

"不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

"字符间插入的像素行数目
set linespace=0

"增强模式中的命令行自动完成操作
set wildmenu

"在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

"命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

"启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

"通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

"不让vim发出讨厌的滴滴声
set noerrorbells

"在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"总是显示状态行
set laststatus=2

"自动格式化
set formatoptions=tcrqn

" 自动重新读入
set autoread

" 设定鼠标可用
if has('mouse')
	set mouse=a
endif

" 代码折叠
"set foldmethod=indent

"Tab为四空格
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"因为设定为不换行，所以要显示底部滚动条，不显示左右滚动条和工具栏
set guioptions-=b
set guioptions-=r
set guioptions-=l
set guioptions-=T

"用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se nocul


"For vundle.Config
set nocompatible
filetype off
if has("win32")
    set rtp+=$HOME/.vim/bundle/vundle/
else
    set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()
Bundle 'gmarik/vundle'
" vim-scripts repos
Bundle 'bash-support.vim'
Bundle 'perl-support.vim'
Bundle 'scrooloose/NerdTree'
"Bundle 'taglist.vim'
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'Markdown'
Bundle 'Markdown-syntax'
Bundle 'php.vim-html-enhanced'
Bundle 'css_color.vim'
Bundle 'Tagbar'
Bundle 'The-NERD-Commenter'
Bundle 'ctrlp.vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'Valloric/YouCompleteMe'
filetype plugin indent on




" """"""""""""""""""""""""""""
" AutoCmd
" """"""""""""""""""""""""""""
if has("autocmd")
    filetype plugin indent on

    " 括号自动补全
    func AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf

    func ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf

    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=80
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END

    "auto close for PHP and Javascript script
    "au FileType php,c,python,javascript exe AutoClose()

    " 绑定 PHP 检查语法的快捷键
    au FileType php map <C-s><C-p> :!php -l %<cr>

    " PHP Twig 模板引擎语法
    au BufRead,BufNewFile *.twig set syntax=twig

    " JavaScript 语法高亮
    au FileType html,javascript let g:javascript_enable_domhtmlcss = 1

    " 给 Javascript 文件添加 Dict
    au FileType javascript setlocal dict+=$VIM/vimfiles/dict/javascript.dict

    " 给 CSS 文件添加 Dict
    au FileType css setlocal dict+=$VIM/vimfiles/dict/css.dict

    " 给 PHP 文件添加 Dict
    au FileType php setlocal dict+=$VIM/vimfiles/dict/php.dict

    " 自动最大化窗口
    if has('gui_running')
        if has("win32")
            au GUIEnter * simalt ~x
        elseif has("unix")
            au GUIEnter * winpos 0 0
            set lines=999 columns=9999
        endif
        "切换当前文件夹
        set autochdir
    endif
endif

" 全屏插件，按 F12
if has("win32")
    source $VIMRUNTIME/mswin.vim
    set guifont=MONACO:h16:cANSI
    map <F12> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>
endif

"python支持
let g:pydiction_location='$VIM/dict/complete-dict'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySys()
	if has("win32") || has("win64")
    	return "windows"
	elseif has("mac")
		return "mac"
	else
    	return "linux"
  	endif
endfunction

if has("gui_running") || has("gui_macvim")
	colorscheme textmate
	let g:colors_name="textmate"
else
	colorscheme slate
endif
" all.so
colorscheme textmate
let g:colors_name="textmate"


if MySys() == "mac"
    set guifont=Monaco:h18
elseif MySys() == "linux"
	set guifont=Monospace
elseif MySys() == "windows"
    set guifont:Monaco:h14
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		statusline 状态栏设置	
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline= 
"set statusline+=%h%#StatuslineFlag#%m%r%w                         " flags  
"set statusline+=%#StatuslinePath#\ %-0.20{StatusLineGetPath()}%0* " path  
"set statusline+=%#StatuslineFileName#//%t/                        " file name  
"set statusline+=%#StatuslineFileType#\ %{strlen(&ft)?&ft:'**'}    " filetype  
set statusline+=%#StatusLineNC#\ %<%F%h%m%r%h%w
set statusline+=%#StatuslineChar#\ %y
set statusline+=%#StatuslineFileType#\ Format:%{&fileformat}             " file format  
set statusline+=%#StatuslineFileEnc#\ Encoding:%{&encoding}                " encoding  
"set statusline+=%#StatuslineFileEnc#\ X:%-2B\ %0*                 " current char  
set statusline+=%#StatuslinePosition#\ Line:%l\ Cursor:%c\                 "line  
set statusline+=%#StatuslinePercent#\ Position:%L\ %P\                  "position percentage  
set statusline+=%#StatuslineCapsBuddy#%{exists('*CapsLockSTATUSLINE')?CapsLockSTATUSLINE():''} "Caps  
"set statusline+=%#StatuslineCapsBuddy#/ %{VimBuddy()}             "Buddy  
set statusline+=%#StatuslineTime#\ Time:%{strftime(\"%Y-%m-%d\ %H:%M\")}  
"set statusline=%<%F%h%m%r%h%w%y\ 

function! StatusLineGetPath() "{{{ 
  let g:Statusline_Max_Path = 20 
  let p = expand('%:.:h') "relative to current path, and head path only 
  let p = substitute(p,'','/','g') 
  let p = substitute(p, '^\V' . $HOME, '~', '') 
  if len(p) > g:Statusline_Max_Path 
    let p = simplify(p) 
    let p = pathshorten(p) 
  endif 
  return p 
endfunction "}}}

"statusline.Color
hi StatusLineNC cterm=none ctermbg=none ctermfg=darkgrey guibg=#fff8dc guifg=#555753 gui=none
hi StatuslineBufNr cterm=none ctermfg=black ctermbg=cyan gui=none guibg=#840c0c guifg=#ffffff
hi StatuslineFlag cterm=none ctermfg=black ctermbg=cyan gui=none guibg=#f57900 guifg=black
hi StatuslinePath cterm=none ctermfg=white ctermbg=green gui=none guibg=#fff8dc guifg=black
hi StatuslineFileName cterm=none ctermfg=white ctermbg=blue gui=none guibg=#acff84 guifg=black
hi StatuslineFileType cterm=none ctermbg=white ctermfg=black gui=none guibg=#ff8ae2 guifg=black
hi StatuslineFileEnc cterm=reverse ctermfg=white ctermbg=blue gui=none guibg=#f36161 guifg=black
hi StatuslineChar cterm=reverse ctermbg=white ctermfg=green gui=none guibg=#3366cc guifg=black
hi StatuslinePosition cterm=none ctermfg=white ctermbg=magenta gui=none guibg=#8a2be2 guifg=white
hi StatuslinePercent cterm=reverse ctermfg=white ctermbg=red gui=none guibg=#ffc0cb guifg=black
hi StatuslineCapsBuddy cterm=none ctermfg=white ctermbg=green gui=none guibg=#8ae234 guifg=black
hi StatuslineTime cterm=none ctermfg=black ctermbg=cyan gui=none guibg=#acff84 guifg=black
hi StatuslineSyn cterm=none ctermbg=white ctermfg=yellow gui=none guibg=#60af9f guifg=black
hi StatuslineRealSyn cterm=none ctermbg=white ctermfg=yellow gui=none guibg=#5881b7 guifg=black
hi StatuslineTermEnc cterm=none ctermbg=white ctermfg=yellow gui=none guibg=#77cf77 guifg=black



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype and syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"minibufexpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

"cscope
"222 "$cd /sourceDirectory 
"223 "$find ./ -name '*.c' -o '*.h' >cscope.files
"224 "$cscope -Rbkq
"225 "open file and :cscope add cscope.out
if has("cscope")
	  "set csprg=/usr/bin/cscope
	  set csto=1
	  set cst
	  set nocsverb
	" add any database in current directory
	  if filereadable("cscope.out")
			  cs add cscope.out
	  endif
	  set csverb
	  map <C-g> :cs find g <C-R>=expand("<cword>")<CR>
	  map <C-h> :cs find c <C-R>=expand("<cword>")<CR>
	  map <C-j> :cs find s <C-R>=expand("<cword>")<CR>
endif

"Ctrl+F12更新或者删除ctags文件和cscope
function! DeleteTagsFile()
    if has("win32")
        silent !del /F /Q tags
        silent !del /F /Q cscope.*.*
    else
        silent !rm -f tags
        silent !rm -f cscope.*
    endif
    silent !find $(pwd) -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.php" >cscope.files
    silent !cscope -bkq -i cscope.files
    silent !ctags -R 2>/dev/null
endfunction
map <F4> :call DeleteTagsFile()<CR>

""""""""""""""""""""""""""""""""""""""""""
"快捷键绑定
""""""""""""""""""""""""""""""""""""""""""
nmap <C-q> :q<cr>
nmap <M-q> :q!<cr>
nmap <C-s> :w<cr>

"F4 映射到启动TagList插件
"map <F4> :Tlist<CR>

"TabBar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_right = 1
let g:tagbar_width = 25
"autocmd VimEnter * nested :call tagbar#autoopen(1)

"pyflakes
filetype on
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""
"NERDTree
" t新标签页打开文件
" p到上层目录
" P到顶层目录
" Shift + R 刷新目录文件
" Shift + c 将选中目录作为父节点
" cd 将选中目录作为当前路径
" Shift + R 刷新目录文件
" Ctrl+w+h 切换到左边焦点
" Ctrl+w+l 切换到右边焦点
" Ctrl+w+w 左右切换
"
"F5 映射到启动NERDTree插件  
map <F5> :NERDTreeMirror<CR>
map <F5> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0


"插入时间快捷键
nmap <F3> <c-r>=strftime("20%y-%m-%d %H:%M:%S")<C-I><Esc>
imap <F3> <c-r>=strftime("20%y-%m-%d %H:%M:%S")<cr><Esc>
"标签相关的快捷键
map <C-t> :tabnew<cr>
map <C-p> :tabprevious<cr>
map <C-n> :tabnext<cr>
map <C-k> :tabclose<cr>
map <C-Tab> :tabnext<cr>

"代码加上头信息
function AddTitle()
    call setline(1,"/****************************************************")
    call append(1,"#        Author          :   @ph4nf4n")
    call append(2,"#        Email           :   ph4nf4n@gmail.com")
    call append(3,"#        Filename        :   " . expand("%"))
    call append(4,"#        Last modified   :   " . strftime("%Y-%m-%d %H:%M"))
    call append(5,"#        Description     : ")
    call append(6,"# ***************************************************/")
endf

"更新代码头信息
function UpdateTitle()
    call setline(4,"#        Filename        :   " . expand("%"))
    call setline(5,"#        Last modified   :   " . strftime("%Y-%m-%d %H:%M"))
endf


map <F2> :call AddTitle()<CR>
map <F1> :call UpdateTitle()<CR>
