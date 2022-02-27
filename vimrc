" System Windows/Vim
" vim version 8.2
" Vim with all enhancements 启用Vim增强功能
source $VIMRUNTIME/vimrc_example.vim

" 这里没有映射那些Windows的快捷键，所以Ctrl S不是保存 Ctrl C不是复制，

" Mouse behavior (the Windows way) 采用Windows鼠标行为
behave mswin

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"编码设置
set enc=utf-8
set fencs=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,shift-jis

"Windows避免菜单栏乱码
if(has("win32") || has("win95") || has("win64") || has("win7") || has("win10"))
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif


"显示行号
set number

"默认打开代码高亮
syntax on

"tab默认4格
set tabstop=4

"打开自动对齐缩进，且缩进默认4格空格长度，然后智能缩进
set autoindent
set inde=4
set smartindent

"设置主题为所谓“白天”
colorscheme morning

"设置不自动换行
set nowrap

"设置可以从行首或行尾移动到另一行
set whichwrap=b,s,<,>,[,]

"显示制表符且将指标符显示为'>---',行尾空格显示为' '
set list
set listchars=tab:>-,trail:-

"自动设置目录为正在编辑的文件所在的目录
set autochdir

"高亮显示搜索结果
set hlsearch

"智能搜索（或者说增量搜索，指搜索时不必回车即可高亮搜索的内容）
set incsearch

"替换时所有行内匹配都被替换，而不是那一个
set gdefault

"打开文件，光标默认在首行
set scrolloff=0

"编辑时，右下角显示光标所在
set ruler

"在遍历文件时识别括号的起始和结束位置
set showmatch

"搜索忽略大小写，但当搜索包含大写字母时就只查看大写
set smartcase


