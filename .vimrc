" ====== ZHM's vimrc ======

" ------ Part 1: Basic ------
let mapleader=" "      "空格为leader键
set number             "显示行号
set showcmd            "命令模式显示指令
set nocompatible       "不与Vi兼容
set relativenumber     "显示相对行号
set encoding=utf-8     "使用utf-8编码
set t_Co=256           "启用256色
syntax on              "开启语法高亮

set scrolloff=4        "上下滚动保留4行
set autoindent         "保持上行缩进
set textwidth=80       "行宽80个字符
set wrap               "自动折行
set linebreak          "不在单词内折行

set showmatch          "高亮成对括号
set hlsearch           "高亮搜索
set incsearch          "搜索即时匹配
set ignorecase         "搜索忽略大小写
set smartcase          "智能大小写
set nobackup           "不创建备份文件
set noswapfile         "不创建交换文件

set expandtab          "转换Tab为空格，Ctrl-v + Tab输入Tab
set tabstop=4          "Tab显示4个空格不是8个
set shiftwidth=4       "缩进级别差距为4
set softtabstop=4
set foldmethod=indent  "代码按缩进折叠
set foldlevel=99       "打开时不折叠代码

filetype plugin indent on               "开启文件类型检查
nnoremap <F4> :w<CR>                    "保存快捷键
nnoremap <F5> :wq<CR>                   "保存退出快捷键
nnoremap <F6> :q<CR>                    "退出快捷键
nnoremap <F7> :set hlsearch!<CR>        "搜索高亮开关


" ------ Part 2: Advance ------
"自动跳至上次关闭时光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"分屏与光标跳转
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

"将g映射为Ctrl-w后配合hjkl跳转光标
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

"调整分屏大小
map <LEADER><up> :res +3<CR>
map <LEADER><down> :res -3<CR>
map <LEADER><left> :vertical resize+3<CR>
map <LEADER><right> :vertical resize-3<CR>

"使用Tab切换补全备选项
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ------ Part 3: Plug-in ------
call plug#begin('~/.vim/plugged')
     Plug 'scrooloose/nerdtree'                       "文件树插件

     Plug 'chun-yang/auto-pairs'                      "括号影号补全
     
     Plug 'tpope/vim-surround'                        "给文本加括号等

     "Plug 'valloric/youcompleteme'                    "自动补全

     Plug 'chiel92/vim-autoformat'                    "自动格式化

     Plug 'rust-lang/rust.vim'                        "Rust插件

     Plug 'neoclide/coc.nvim', {'branch': 'release'}  "自动补全

     Plug 'mattn/emmet-vim'                           "前端插件
call plug#end()


" ------ Part 3: Plug Settings ------
" ---NerdTree---
map <F2> :NERDTreeToggle<CR>        "设置NT开关快捷键


" ---Emmet---
let g:user_emmet_leader_key = ','   "设置html补全快捷键
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" ---AutoFormat---
"格式化快捷键
nnoremap <F3> :Autoformat<CR>

"设置C,C++为谷歌样式,
"下一行中的Google可以换为LLVM、Mozilla、WebKit、Microsoft、GNU
let g:formatdef_clangformat_google = '"clang-format -style=Microsoft -"'
let g:formatters_c = ['clangformat_google']

"缩进规则设置
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
autocmd FileType vim,tex let b:autoformat_autoindent=0


" ---Rust.Vim---
let g:rustfmt_autosave = 1     "保存时格式化代码


" ---CocRust---
"变量重命名
nmap <leader>r <Plug>(coc-rename)
"代码块重构
nmap <leader>g <Plug>(coc-refactor)

"定义跳转
nmap <silent> fd <Plug>(coc-definition)
nmap <silent> fy <Plug>(coc-type-definition)
nmap <silent> fi <Plug>(coc-implementation)
nmap <silent> fr <Plug>(coc-refreences)

"开启悬浮文档
nnoremap <silent> <leader>f :call CocActionAsync('doHover')<CR>
"悬浮文档滚动翻页
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" ---YouCompleteMe---
"显示Hover的快捷键
nmap <leader>j <plug>(YCMHover)

let g:ycm_cache_omnifunc=0                   "禁止缓存匹配项
let g:ycm_seed_identifiers_with_syntax=1     "语法关键字补全
let g:ycm_confirm_extra_conf=0               "不再提示加载
let g:ycm_show_diagnostics_ui=0              "禁用诊断信息显示
let g:ycm_complete_in_comments=1             "补全功能在注释中同样有效

"跳转到声明、文档、类型、引用处
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gi :YcmCompleter GoToImplementation<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gt :YcmCompleter GetType<CR>

"两个字母自动弹出补全选项
let g:ycm_semantic_triggers =  {'c,cpp,python': ['re!\w{2}']}

"设置补全框的颜色
highlight PMenu ctermfg=yellow ctermbg=240 guifg=yellow guibg=#585858
highlight PMenuSel ctermfg=14 ctermbg=darkgrey guifg=#00ffff guibg=black

"禁用自动弹出函数原型
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

"设置YCM起作用的文件类型
let g:ycm_filetype_whitelist = {"c":1, "cpp":1, "python":1}
"let g:ycm_filetype_whitelist = {"python":1}

"设置python路径
let g:ycm_python_interpreter_path = "/usr/bin/python"
let g:ycm_python_binary_path = "/usr/bin/python"

"设置配置文件路径
let g:ycm_global_ycm_extra_conf = '/home/zhm/.vim/plugged/youcompleteme/.ycm_extra_conf.py'
