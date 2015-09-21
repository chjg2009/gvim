
set nocompatible
filetype off
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu
colorscheme desert    "darkblue

let g:winManagerWindowLayout='FileExplorer|TagList' "2 
let g:winManagerWidth =25 "3 
nmap wm :WMToggle<cr>  "4 "定义快捷键5 
nmap <silent> <F7> :WMToggle<cr> "6 "
let g:AutoOpenWinManager = 1 "开启Vim时自动打开

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"ctags set
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
"imap <F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"set tags=D:/tags
"set autochdir

"Cscope set
if has("cscope")
	set csprg=C:\WINDOWS\system32\cscope.exe "/usr/local/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
set cscopequickfix=s-,c-,d-,i-,t-,e-
"map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR

"taglist set
let Tlist_WinWidth=252 
let Tlist_Show_One_File=13 
let Tlist_Exit_OnlyWindow=14 
let Tlist_Use_Right_Window = 15 
let Tlist_File_Fold_Auto_Close=1 "自动折叠6
"映射快捷键F6，开启/关闭窗口 
nmap <silent> <F6> :Tlist<CR>  "taglist


"minibufexpl  set
let g:miniBufExplMapWindowNavVim = 1 
"按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1
"按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1
"启用以下两个功能：Ctrl+tab移到下一个窗口
let g:miniBufExplModSelTarget = 1
"不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer

"genutils set
"command! -nargs=0 -range=% SortByLength <line1>,<line2>call QSort(\ 'CmpByLineLengthNname', 1) 
"command! -nargs=0 -range=% RSortByLength <line1>,<line2>call QSort(\ 'CmpByLineLengthNname', -1) 
"command! -nargs=0 -range=% SortJavaImports <line1>,<line2>call QSort(\ 'CmpJavaImports', 1)

"nnoremap <silent> <C-Space> :call ShiftWordInSpace(1)<CR> 
"nnoremap <silent> <C-BS> :call ShiftWordInSpace(-1)<CR> 
"nnoremap <silent> \cw :call CenterWordInSpace()<CR> 
"nnoremap <silent> \va :call AlignWordWithWordInPreviousLine()<CR>

"command! -nargs=1 -bang -complete=customlist,genutils#UserFileComplete2  
			\ FindInPath :find<bang> <args>
"command! -nargs=* -complete=command Redir 
 "         \ :new | put! =GetVimCmdOutput('<args>') | setl bufhidden=wipe | 
 "        \ setl nomodified


"lookupfile set
let g:LookupFile_MinPatLength = 1               "最少输入一个字符开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"let g:LookupFile_ignorecas = 1
let g:LookupFile_smartcase = 1
" Don't display binary files
let g:LookupFile_FileFilter = '\.class$\|\.o$\|\.obj$\|\.exe$\|\.jar$\|\.zip$\|\.war$\|\.ear$'

let g:LookupFile_EnableRemapCmd = 1
nmap <silent> <leader>lf :LUTags<cr>       	 "映射LookupFile为,lf
nmap <silent> <leader>lw :LUTWalk<cr>   	 "映射LUWalk为,lw
nmap <silent> <leader>lb :LUBufs<cr>   		 "映射LUBufs为，lb

"(echo "!_TAG_FILE_SORTED	2	/2=foldcase/";(find . -type f -printf "%f\t%p\t1\n" | \ sort -f)) > ./filenametag
"find . \( -name .svn -o -wholename ./classes \) -prune -o -not -iregex '.*\.\(jar\|gif\|jpg\|class\|exe\|dll\|pdd\|sw[op]\|xls\|doc\|pdf\|zip\|tar\|ico\|ear\|war\|dat\).*' -type f -printf "%f\t%p\t1\n" \

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'


"omnicppcomplete
"set nocp
"filetype plugin on

"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_DisplayMode = 0
"let OmniCpp_ShowScopeInAbbr = 0
"let OmniCpp_ShowPrototypeInAbbr = 0
"let OmniCpp_ShowAccess = 1
"let OmniCpp_DefaultNamespaces = []
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 0
"let OmniCpp_SelectFirstItem = 0


"The_NERD_Commentor  set
"filetype plugin on
"let NERDShutUp=1
"支持单行和多行的选择，//格式
"map <c-h>,c<space>

"ucompleteme set
"call ucompleteme#Setup()

" YouCompleteMe 功能  
" 补全功能在注释中同样有效  
let g:ycm_complete_in_comments=1  
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示  
let g:ycm_confirm_extra_conf=0  
" 开启 YCM 基于标签引擎  
let g:ycm_collect_identifiers_from_tags_files=1  
" 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径  
set tags+=/data/misc/software/misc./vim/stdcpp.tags  
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键  
inoremap <leader>; <C-x><C-o>  
" 补全内容不以分割子窗口形式出现，只显示补全列表  
set completeopt-=preview  
" 从第一个键入字符就开始罗列匹配项  
let g:ycm_min_num_of_chars_for_completion=1  
" 禁止缓存匹配项，每次都重新生成匹配项  
let g:ycm_cache_omnifunc=0  
" 语法关键字补全              
let g:ycm_seed_identifiers_with_syntax=1  
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;  
let g:ycm_key_invoke_completion = '<M-;>'  
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞  
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$VIM/vimfiles/bundle/vundle.vim/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/Vundle.vim/Vundle.vim/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vimset colorscheme = darkblue'


"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"Plugin 'taglist'
Plugin 'cscope.vim'
"Plugin 'cscope_win'
Plugin 'a.vim'
Plugin 'taglist.vim'
Plugin 'minibufexpl.vim'
Plugin 'winmanager'
Plugin 'The-NERD-Commenter'
"Plugin 'The-NERD-tree'
"Plugin 'OmniCppComplete'
Plugin 'genutils'
Plugin 'lookupfile'
Plugin 'cppcomplete'
Plugin 'ucompleteme'
Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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
			let cmd = '"' . $VIMRUNTIME . '\diff"'
			let eq = '""'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

