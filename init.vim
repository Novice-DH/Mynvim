" 
"  __  ____   __  _   ___     _____ __  __ ____   ____ 
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |    
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___ 
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"                                                      

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
    Plug 'https://github.com.cnpmjs.org/rakr/vim-one.git'
    Plug 'https://github.com.cnpmjs.org/sheerun/vim-polyglot.git'
    Plug 'https://github.com.cnpmjs.org/yuttie/inkstained-vim.git'
    Plug 'https://github.com.cnpmjs.org/hzchirs/vim-material.git'
    Plug 'https://github.com.cnpmjs.org/connorholyday/vim-snazzy'
    " Auto Complete
    Plug 'https://github.com.cnpmjs.org/neoclide/coc.nvim.git', {'branch': 'release'}
    Plug 'https://github.com.cnpmjs.org/honza/vim-snippets'             "代码补全片段
    Plug 'https://github.com.cnpmjs.org/MaskRay/ccls'
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
    Plug 'https://github.com.cnpmjs.org/dart-lang/dart-vim-plugin'       "用于支持flutter（跨平台开发框架）代码高亮
    "Plug 'https://github.com.cnpmjs.org/theniceboy/coc-flutter-tools'       "flutter（跨平台开发框架)，vim中保存自动加载
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
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank']
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
" 按下Tab自动补全
inoremap <expr><T-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"inoremap <silent><expr> <c-space> coc#refresh()
" <c-t>唤醒Tab自动补全
inoremap <silent><expr> <c-t> coc#refresh()
" 通过回车确认补全选项
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 搜索上下文的代码报错
nnoremap <silent><nowait> <Space>d :CocList diagnostics<cr>
nmap <silent> <Space>- <Plug>(coc-diagnostic-prev)
nmap <silent> <Space>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>

""function! Show_documentation()
""	call CocActionAsync('highlight')
""	if (index(['vim','help'], &filetype) >= 0)
""		execute 'h '.expand('<cword>')
""	else
""		call CocAction('doHover')
""	endif
""endfunction
" 光标停留在目标字符，调用help文档
nnoremap <Space>h :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

" 光标停留在某词，高亮相同词
autocmd CursorHold * silent call CocActionAsync('highlight')
" 重命名某变量
" Symbol renaming.
nmap <Space>rn <Plug>(coc-rename)
" 代码格式调整
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
" 查看函数定义、调用
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
" 同名函数跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap te :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" 代码片段补全
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-k>'
let g:coc_snippet_prev = '<c-j>'
nmap <leader>qf  <Plug>(coc-fix-current)
imap <C-s> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'David Chen'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

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
"map <SPACE>tm :TableModeToggle<CR>

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

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set shortmess+=c
"set signcolumn=yes

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===

"set clipboard=unnamedplus
let &t_ut=''    "让不同终端配色一致
set autochdir   "当需要执行某命令时，让vim执行在当前工作目录
"set mouse=a    "vim中使用鼠标


" ===
" === Editor behavior
" ===

syntax on
set cursorcolumn
set cursorline
set pastetoggle=<F9>
set nu                              "设置显示行号
set relativenumber                  "从当前行往下数，是第几行
"set norelativenumber               "关闭
set wrap                            "让字不会超出当前窗口显示范围（软换行）
set showcmd                         "屏显当前输入键盘符
set wildmenu                        "按Tab键滚选文件
set exrc
set secure
set hidden
set noexpandtab
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set tw=0
set indentexpr=
set tabstop=2                       "设置Tab缩进
set shiftwidth=2
set softtabstop=2
set autoindent
set scrolloff=5                     "光标顶部、底部始终显示5行
set backspace=indent,eol,start      "当光标位于行首时，按退格键回到行尾
set foldmethod=indent               "折叠代码
set foldlevel=99
set list                            "行尾显示空格
set listchars=tab:\|\ ,trail:▫
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
""silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.
"endif
"set colorcolumn=100
set updatetime=100
set virtualedit=block

" ===
" === Editor Property
" ===

"在vim不同模式下光标显示不同
"只适合部分终端
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Restore Cursor Position
" ===
"重新打开时，光标放在上次编辑的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


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
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>
"let mapleader=" "

" Column (:) mods
"map ; :
"map q; q:
"map <LEADER>/ :!
"map <LEADER>r :r !
map <SPACE>s :%s/
"map <C-> <Esc>

" Spelling Check with <space>sc
"map <Space>sc :set spell!<CR>
"noremap <C-x> <C-x>s
"inoremap <C-x> <Esc>ea<C-x>s

" Save & quit
map Q :q<CR>
map WQ :q!<CR>
map S :w<CR>
map AS :wq<CR>
map AR :wq<CR>ra<CR>

" Open the vimrc file anytime
" Open the init.vim file anytime
"map <LEADER>rc :e ~/.vim/vimrc<CR>
"""""first open the nvim
map <SPACE>n :e ~/.config/nvim/init.vim<CR>
map <SPACE>b :e ~/.bashrc<CR>
map <SPACE>c :e ~/.config/nvim/coc-settings.json<CR>
"map vi in<CR> vim ~/.config/nvim/init.vim<CR>

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

" Search
map <LEADER><CR> :nohlsearch<CR>
"noremap = nzz "向上、下搜索，并将当前行变为中心行
"noremap - Nzz

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1    "搜索正则表达式的块：两个相同且相连的字符

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
"map <LEADER>[ <C-w>h  "往上分屏中往左移动
"map <LEARER>] <C-w>l  "在分屏中往右移动

"map ji <C-w>k  "在分屏中往上移动
"map jn <C-w>j  "在分屏中往下移动
"map jh <C-w>h  "在分屏中往左移动
"map jk <C-w>l  "在分屏中往右移动

" Moving in splits with arrow keys
noremap <Up>    <C-w>k  "在分屏中往上移动
noremap <Down>  <C-w>j  "在分屏中往下移动
noremap <Left>  <C-w>h  "在分屏中往左移动
noremap <Right> <C-w>l  "在分屏中往右移动

" Resize splits keys
map \= :res +5<CR>             "往上+5
map \' :res -5<CR>
map \[ :vertical resize-5<CR>  "往左-5
map \] :vertical resize+5<CR>

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" ===
" === Tab management
" ===
" create a new tab with tu
"只适合在文件内新建标签
":-tabnext<CR>      "打开左边标签
":+tabnext<CR>      "打开右边标签
map tu :tabe<CR>
map sk :-tabnext<CR> "标签左移
map sl :+tabnext<CR> "标签右移

" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '"往左分屏' and edit it
" "/"表搜索，往右改4个，按两下空格到括号里，实现快速查找并替换
" apple("在分屏中往右移动)
" banana("在分屏中往左移动)
" :normal A ("在分屏中往右移动)	#占位，按两下空格到括号里
map <Space><Space> <Esc>/"在分屏中往左移动<CR>:nohlsearch<CR>c4l

" Call figlet
map fl :r !figlet 

