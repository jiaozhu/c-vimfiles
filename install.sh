#!/bin/bash
# ====================================================
#   Copyright (C)2019 All rights reserved.
#
#   Author        : Wythe Chao
#   Email         : hi@chinacode.io
#   File Name     : install.sh
#   Last Modified : 2019-10-22 10:12
#   Describe      :
#
# ====================================================

# 安装启用的环境变量
BASEDIR=$(pwd)
# 基本配置目录
VIM_CONFIG_PATH="$BASEDIR/config"
VIM_TMP_PATH="$ROOT_PATH/.vim"

echo "Set up Vundle"
git clone --dept=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 保留旧的配置文件
if [ -e $HOME/.vimrc ]; then mv $HOME/.vimrc $HOME/.vimrc_other; fi

echo " Step 1: add config to $BASHRC_FILE"
TMP_ENV_FILE="vim-tmp-env-file"
echo "export VIM_CONFIG_PATH=$VIM_CONFIG_PATH" >$TMP_ENV_FILE
echo "export VIM_TMP_PATH=$VIM_TMP_PATH" >>$TMP_ENV_FILE
[[ -f $HOME/.bashrc ]] && cat $TMP_ENV_FILE >> $HOME/.bashrc
[[ -f $HOME/.zshrc ]] && cat $TMP_ENV_FILE >> $HOME/.zshrc
rm $TMP_ENV_FILE

echo " Step 2: setting up symlinks"
ln -s $VIM_CONFIG_PATH/vimrc $HOME/.vimrc

echo " Step 3: vim bk and undo dir and swp and view"
mkdir -p \
	$VIM_TMP_PATH/bundle \
	$VIM_TMP_PATH/vimbackup \
	$VIM_TMP_PATH/vimundo \
	$VIM_TMP_PATH/vimview \
	$VIM_TMP_PATH/vimswap

vim +BundleInstall! +BundleClean +qall