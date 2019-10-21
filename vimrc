let mapleader = ","

" ##### 基本配置
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.config_base"))
	source $VIM_CONFIG_PATH/vimrc.config_base
endif

" ##### 插件安装
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.bundles_base"))
	source $VIM_CONFIG_PATH/vimrc.bundles_base
endif

" ##### 插件安装
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.bundles_config"))
	source $VIM_CONFIG_PATH/vimrc.bundles_config
endif
