" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.vim/plugged')
    " Pretty Dress
    Plug 'ayu-theme/ayu-vim'
    Plug 'tomasr/molokai'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'liuchengxu/space-vim-theme'
    Plug 'https://github.com.cnpmjs.org/sickill/vim-monokai.git'
    Plug 'https://github.com.cnpmjs.org/KeitaNakamura/neodark.vim.git'
    Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline.git'
    Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline-themes' "airline 的主题
    Plug 'https://github.com.cnpmjs.org/neoclide/coc.nvim.git', {'branch': 'release'}
    " Error checking
    Plug 'https://github.com.cnpmjs.org/dense-analysis/ale.git'         "代码提示，指出错误
    Plug 'jiangmiao/auto-pairs'
    "Plug 'nine2/vim-copyright'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'preservim/nerdcommenter'
    " File navigation
    Plug 'https://github.com.cnpmjs.org/preservim/nerdtree'    "左侧显示文件树
    Plug 'https://github.com.cnpmjs.org/Xuyuanp/nerdtree-git-plugin'    "应用于Git
    " Taglist
    Plug 'https://github.com.cnpmjs.org/preservim/tagbar'      "左侧显示函数列表
    " Undo Tree
    Plug 'https://github.com.cnpmjs.org/mbbill/undotree'       "树状显示，浏览、切换文件修改历史
    Plug 'https://github.com.cnpmjs.org/rakr/vim-one.git'
    Plug 'https://github.com.cnpmjs.org/sheerun/vim-polyglot.git'
    Plug 'https://github.com.cnpmjs.org/yuttie/inkstained-vim.git'
    Plug 'https://github.com.cnpmjs.org/hzchirs/vim-material.git'
    Plug 'https://github.com.cnpmjs.org/connorholyday/vim-snazzy'
    " Bookmarks
    Plug 'https://github.com.cnpmjs.org/kshenoy/vim-signature'


call plug#end()

" ===
" === ale
" ===
let b:ale_linters = [] "['pylint']
" let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_python_pylint_options = "--extension-pkg-whitelist=pygame"

" ===
" === NERDTree
" ===
":help nerdtree
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
"let g:NERDTreeIndicatorMapCustom = {
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map ml :UndotreeToggle<CR>

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>

" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }



""DoxygenToolkit
" Doxygen for C
let g:DoxygenToolkit_commentType="C"
let g:DoxygenToolkit_dateTag="@modify \t"
let g:DoxygenToolkit_briefTag_pre="@brief \t"
let g:DoxygenToolkit_paramTag_pre="@param[] \t"
let g:DoxygenToolkit_returnTag="@return \t"
let g:DoxygenToolkit_authorTag="@author \t"
let g:DoxygenToolkit_versionTag="@version \t"
let g:DoxygenToolkit_authorName="xiaoyehua<me@xiaoyehua.net>"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_compactDoc="yes" "insert white line
let g:DoxygenToolkit_cinoptions="c0C1" " First '*' indent whitespace default=c1C1
nmap ,hh :DoxAuthor<CR><ESC>k8==j$a
nmap ,ff :Dox<CR><ESC>k8==j$a<TAB>
nmap ,da :DoxAuthor<CR><ESC>k8==
nmap ,db :DoxBlock<CR><ESC>k8==

let g:file_copyright_name = "xiaoyehua"
let g:file_copyright_email = "me@xiaoyehua.net"
let g:file_copyright_auto_filetypes = ['sh', 'plx', 'pl', 'pm', 'py', 'python', 'h', 'hpp', 'c', 'cpp', 'java']
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \   'python': ['pylint'],
            \}

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <lug>(coc-diagnostic-prev)
nmap <silent> ]g <lug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <lug>(coc-definition)
nmap <silent> gy <lug>(coc-type-definition)
nmap <silent> gi <lug>(coc-implementation)
nmap <silent> gr <lug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <lug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <lug>(coc-format-selected)
nmap <leader>f  <lug>(coc-format-selected)

augroup mygroup
        autocmd!
            " Setup formatexpr specified filetype(s).
            "     autocmd FileType typescript,json setl
            "     formatexpr=CocAction('formatSelected')
            "         " Update signature help on jump placeholder
            "             autocmd User CocJumplaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <lug>(coc-codeaction-selected)
nmap <leader>a  <lug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <lug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <lug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <lug>(coc-funcobj-i)
xmap af <lug>(coc-funcobj-a)
omap if <lug>(coc-funcobj-i)
omap af <lug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'angr'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <lug>AirlineSelectTab1
nmap <leader>2 <lug>AirlineSelectTab2
nmap <leader>3 <lug>AirlineSelectTab3
nmap <leader>4 <lug>AirlineSelectTab4
nmap <leader>5 <lug>AirlineSelectTab5
nmap <leader>6 <lug>AirlineSelectTab6
nmap <leader>7 <lug>AirlineSelectTab7
nmap <leader>8 <lug>AirlineSelectTab8
nmap <leader>9 <lug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
" nmap <leader>- <lug>AirlineSelectrevTab
" " 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
" nmap <leader>+ <lug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 
filetype plugin on
" 设置为双字宽显示，否则无法完整显示如:☆
" set ambiwidth=double
set t_ut= " 防止vim背景颜色错误
set showmatch " 高亮匹配括号
set matchtime=1
set report=0
set ignorecase
set nocompatible
set noeb
set softtabstop=4
set shiftwidth=4
set nobackup
set autoread
set nocompatible
set backspace=2 "能使用backspace回删
set ruler "显示最后一行的状态
set laststatus=2 "两行状态行+一行命令行
set ts=4
set expandtab
set autoindent "设置c语言自动对齐
set selection=exclusive
" set selectmode=mouse,key
set tabstop=4 "设置TAB宽度
set history=1000 "设置历史记录条数   
"共享剪切板
set clipboard+=unnamed 
set cmdheight=3
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif


" autocmd FileType json syntax match Comment +\/\/.\+$+
set foldmethod=indent " 设置默认折叠方式为缩进
set foldlevelstart=99 " 每次打开文件时关闭折叠

" hi Normal ctermfg=252 ctermbg=none "背景透明
" au FileType gitcommit,gitrebase let g:gutentags_enabled=0

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set updatetime=300
set shortmess+=c
set signcolumn=yes

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===


" ===
" === Editor Property
" ===

"set clipboard=unnamedplus
let &t_ut=''    "让不同终端配色一致
set autochdir   "当需要执行某命令时，让vim执行在当前工作目录
"set mouse=a    "vim中使用鼠标
set cursorcolumn
set cursorline
set pastetoggle=<F9>

set tabstop=2   "设置Tab缩进
set shiftwidth=2
set softtabstop=2
set autoindent
set scrolloff=4
set tw=0
set indentexpr=

set backspace=indent,eol,start      "当光标位于行首时，按退格键回到行尾
set foldmethod=indent               "折叠代码
set foldlevel=99

set list    "行尾显示空格
set listchars=tab:\|\ ,trail:▫

"在vim不同模式下光标显示不同
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"重新打开时，光标放在上次编辑的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax on
set nu "设置显示行号
set relativenumber "从当前行往下数，是第几行
"set norelativenumber "关闭
set wrap "让字不会超出当前窗口显示范围（软换行）
set showcmd "屏显当前输入键盘符
set wildmenu "按Tab键滚选文件

" ===
" === Dress up my vim
" ===
"map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
"map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_light<CR>

" 配色方案
" let g:seoul256_background = 234
" colo monokai
" colo molokai          " Is good
"set background=light
"colorscheme one
colo evening            " Is good

" ===
" === Editor behavior
" ===

" Disabling the default s key
noremap s <nop>

" Faster in-row navigation
"noremap K 5k
noremap J 10j
noremap H 10h
noremap L 10l

" Faster in-line navigation
noremap W 5w
noremap B 5b

"noremap = nzz "向上、下搜索，并将当前行变为中心行
"noremap - Nzz

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map su :set nosplitbelow  <CR>:split <CR>  "往上分屏
map sn :set splitbelow    <CR>:split <CR>  "往下分屏
map sd :set nosplitright  <CR>:vsplit<CR>  "往左分屏
map sl :set splitright    <CR>:vsplit<CR>  "往右分屏

" Place the two screens up and down
map sm <C-w>t<C-w>K  "左右切至上下分屏
" Place the two screens side by side
map sl <C-w>t<C-w>H  "上下切至左右分屏

"map <LEADER>= <C-w>k  "在分屏中往上移动
"map <LEADER>' <C-w>j  "在分屏中往下移动
"map <LEADER>[ <C-w>h  "在分屏中往左移动
"map <LEARER>] <C-w>l  "在分屏中往右移动

"map ji <C-w>k  "在分屏中往上移动
"map jn <C-w>j  "在分屏中往下移动
"map jh <C-w>h  "在分屏中往左移动
"map jk <C-w>l  "在分屏中往右移动

" Moving in splits with arrow keys
map <Up>    <C-w>k  "在分屏中往上移动
map <Down>  <C-w>j  "在分屏中往下移动
map <Left>  <C-w>h  "在分屏中往左移动
map <Right> <C-w>l  "在分屏中往右移动

" Resize splits keys
map \= :res +5<CR>             "往上+5
map \' :res -5<CR>
map \[ :vertical resize-5<CR>  "往左-5
map \] :vertical resize+5<CR>

" ===
" === Tab management
" ===
" create a new tab with tu

":-tabnext<CR>      "打开左边标签
":+tabnext<CR>      "打开右边标签
map tu :tabe<CR>
map sk :-tabnext<CR> "标签左移
map sl :+tabnext<CR> "标签右移


