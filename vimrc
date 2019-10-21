let mapleader = ","

" ##### 基本配置
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.config_base"))
  source $VIM_CONFIG_PATH/vimrc.config_base
endif

" vim plugin bundles
if filereadable(expand("$VIM_CONFIG_PATH/vimrc.bundles_base"))
	source $VIM_CONFIG_PATH/vimrc.bundles_base
endif
