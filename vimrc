let mapleader = ","

" ########### 没设置 环境变量时使用 默认的 $HOME 下的
let g:cust_vim_config_path = 1
if !isdirectory(expand("$VIM_CONFIG_PATH"))
    let g:cust_vim_config_path = 0
endif
let g:cust_vim_tmp_path = 1
let g:cust_vim_tmp_path_dir = $VIM_TMP_PATH
if !isdirectory(expand("$VIM_TMP_PATH"))
    let g:cust_vim_tmp_path_dir = $HOME/.vim
    let g:cust_vim_tmp_path = 0
endif

" ##### 基本配置
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.config_base"))
	source $VIM_CONFIG_PATH/vimrc.config_base
endif

" ##### 插件安装
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.bundles_base"))
	source $VIM_CONFIG_PATH/vimrc.bundles_base
endif

" ##### 插件配置
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.bundles_config"))
	source $VIM_CONFIG_PATH/vimrc.bundles_config
endif

" ##### 各种 vim 文件设置
" 配置了 VIM_TMP_PATH 时才启用下面的
    " 备份
set backup
" 交换文件
set swapfile

" undo
if has('persistent_undo')
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
    set undofile                " So is persistent undo ...
endif

if g:cust_vim_tmp_path is 1
    set backupdir=$VIM_TMP_PATH/vimbackup
    set viewdir=$VIM_TMP_PATH/vimview
    set dir=$VIM_TMP_PATH/vimswap
    set undodir=$VIM_TMP_PATH/vimundo
else
    set backupdir=$HOME/.vim/vimbackup
    set viewdir=$HOME/.vim/vimview
    set dir=$HOME/.vim/vimswap
    set undodir=$HOME/.vim/vimundo
endif
" 备份防相同文件名：
autocmd BufWritePre *
    \ let s:cmd = 'echo '. '"' . expand("%:p") . '"|base64' |
    \ let s:cmd = substitute(system(s:cmd),"\n","","") |
    \ let &bex = '_' . strftime("%Y%m%d") . '_' . s:cmd |
    \ exe ":mkview"
" 查找备份的解码, 放在 bash_alias.sh 中
" alias lsvimbak="ls*|rev|cut -d_  -f1 |rev|base64 -D"

" 创建对应目录
if !isdirectory(expand("g:cust_vim_tmp_path_dir")) && &viewdir == g:cust_vim_tmp_path_dir."/vimview"
    echo system("mkdir -p ".g:cust_vim_tmp_path_dir."/vimview")
    echo system("mkdir -p ".g:cust_vim_tmp_path_dir."/vimbackup")
    echo system("mkdir -p ".g:cust_vim_tmp_path_dir."/vimswap")
    echo system("mkdir -p ".g:cust_vim_tmp_path_dir."/vimundo")
endif