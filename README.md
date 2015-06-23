"非兼容vi模式设置
set nocompatible

"显示行号
set nu    

"自动保存缓冲区
set autowrite

"编码
set encoding=CP936
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,CP936,big5,gb18030,euc-jp,euc-kr,latin1

let g:ycm_global_ycm_extra_conf = '$vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0                                                          "允许加载.ycm_extra_conf.py文件不在提示
let g:ycm_seed_identifiers_with_syntax=1												"语法自动补全
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>  "ALT+G跳转到定义处

let g:AutoPairsFlyMode = 1              
"let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

set rtp+=$vim/vimfiles/bundle/Vundle.vim/
let path='$vim/vimfiles/bundle'


colorscheme evening
set tags=tags;                
set autochdir

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1

nnoremap <silent> <F12> :A<CR>

nnoremap <silent> <F3> :Grep<CR>


set cscopequickfix=s-,c-,d-,i-,t-,e-

let g:miniBufExplorerMoreThanOne=0

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


