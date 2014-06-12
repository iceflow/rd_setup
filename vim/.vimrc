"set tabstop=4 "Tab键的宽度
"set expandtab "统一缩进为4个空格
"set softtabstop=4
"set shiftwidth=4

" taglist.vim 插件设置
let Tlist_Show_One_File=1               " 只打开当前文件Tlist
let Tlist_Exit_OnlyWindow=1     " 当只有Tlist窗口也退出
let g:winManagerWindowLayout='FileExplorer|TagList' " 结合winManager插件，实现IDE布局
nmap wm :WMToggle<cr>
let Tlist_Sort_Type = "name" " order by
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Compart_Format = 1 " show small meny
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0 " do not close tags for other files
let Tlist_Enable_Fold_Column = 0 " do not show folding tree
map <down> <ESC>:Tlist<RETURN>
" vi编辑窗口内，当文件发生变动，映射 F4 重新生成tags文件，即时生效
nmap <F4> :! vim_tags && vim_csfile<CR>

" cscope 使用快捷方式 ，例如  <C-_>s 意思就是 normal 模式下 输入 Ctrl+shift+-
" 放开后，快速输入s , 就能找到光标当前函数的定义
if has("cscope")
        set csprg=/usr/bin/cscope
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
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" a.vim 插件 c/h头文件快速切换  :A :AV :AS
" 下面做了 normal 模式下映射 F12, c/h切换
nnoremap <silent> <F12> :A<CR>

" grep.vim 插件 可在vi编辑中使用grep搜索，将输出结果放入quickfix窗口后编辑
nnoremap <silent> <F3> :Grep<CR>

" 编译模式
" 映射 F5 为 make
nmap <F5> :make<cr>
" 映射 F6 为查询quickfix窗口内的下一项
nmap <F6> :cn<cr>
" 映射 F7 为查询quickfix窗口内的上一项
nmap <F7> :cp<cr>
"" quickfix 窗口 :cw 调出


" omnicpp.vim 插件 ，实现C/C++自动补齐，可显示类成员，函数，结构内容
let OmniCpp_DefaultNamespaces = ["std"]
let OmniCpp_NamespaceSearch = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1

" supertab.vim 插件，使用tab来完成自动补齐，超级爽的功能！！
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

" 打开折叠功能，但是默认不折叠
set foldmethod=syntax
set foldlevel=100

" 启用plugin
filetype plugin on

""""""""""""""""""""
"filetype plugin indent on
"set completeopt=longest,menu
"color torte
"color oceandeep

"set mouse=a

" commented lines start with `"'

set tabstop=4
"set softtabstop=4
set shiftwidth=4
set fileencodings=utf-8,gb2312,gbk,gb18030
"set cindent  " 复制自动缩进


" enable syntax highlighting
syntax on
