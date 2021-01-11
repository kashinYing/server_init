#!/bin/bash

blue() {
  echo -e "\033[34m\033[01m$1\033[0m"
}

green() {
  echo -e "\033[32m\033[01m$1\033[0m"
}

red() {
  echo -e "\033[31m\033[01m$1\033[0m"
}

yellow() {
  echo -e "\033[33m\033[01m$1\033[0m"
}

# check linux release
if [ -f /etc/redhat-release ]; then
  release='centos'
  syspkg='yum'
  syspwd='/usr/lib/systemd/system'
elif cat /etc/issue | grep -Eqi 'debian'; then
  release='debian'
  syspkg='apt-get'
  syspwd='/lib/systemd/system'
elif cat /etc/issue | grep -Eqi 'ubuntu'; then
  release='ubuntu'
  syspkg='apt-get'
  syspwd='/lib/systemd/system'
elif cat /etc/issue | grep -Eqi 'centos|red hat|redhat'; then
  release='centos'
  syspkg='yum'
  syspwd='/usr/lib/systemd/system'
elif cat /proc/version | grep -Eqi 'debian'; then
  release='debian'
  syspkg='apt-get'
  syspwd='/lib/systemd/system'
elif cat /proc/version | grep -Eqi 'ubuntu'; then
  release='ubuntu'
  syspkg='apt-get'
  syspwd='/lib/systemd/system'
elif cat /proc/version | grep -Eqi 'centos|red hat|redhat'; then
  release='centos'
  syspkg='yum'
  syspwd='/usr/lib/systemd/system'
fi

tools_to_install=(
  'git'
  # 'vim'
  'tmux'
)

# current directory
dir=`dirname $0`

# install tools
for t in "${tools_to_install[@]}"; do
  blue "\nInstalling $t"
  $syspkg -y install $t
done

# install latest vim to support latest ycm
# see https://phoenixnap.com/kb/how-to-install-vim-centos-7
# and 
# http://blog.dreamlikes.cn/archives/940
yellow "\nRemoving old vim"
$syspkg -y remove vim

blue "\nInstalling latest vim"
$syspkg -y install gcc make ncurses-devel python-devel
git clone https://github.com/vim/vim.git
cd vim/src
./configure \
  --with-features=huge \
  --enable-pythoninterp=yes \
  --enable-cscope \
  --enable-fontset \
  --with-python-config-dir=/usr/lib64/python2.7/config
make
make install

# cd back
cd $dir 

# git
blue '\nCustomizing git'

git_config_file="$dir/git/.gitconfig"
green "Copying $git_config_file to $HOME/.gitconfig"
cp $git_config_file $HOME

# bash
blue '\nCustomizing bash'

bashrc_file="$dir/bash/.bashrc"
green "Copying $bashrc_file to $HOME/.bashrc"
cp $bashrc_file $HOME

bash_profile="$dir/bash/.bash_profile"
green "Copying $bash_profile to $HOME/.bash_profile"
cp $bash_profile $HOME

# vim
blue '\nCustomizing vim'

vundle_git_link='https://github.com/VundleVim/Vundle.vim.git'
vundle_local_path_to_install="$HOME/.vim/bundle/Vundle.vim"
green "Installing vundle to $vundle_local_path_to_install"
if [ -d $vundle_local_path_to_install ]; then
  yellow "$vundle_local_path_to_install already exists"
else
  git clone $vundle_git_link $vundle_local_path_to_install
fi

vimrc_file="$dir/vim/.vimrc"
green "Copying $vimrc_file to $HOME/.vimrc"
cp $vimrc_file $HOME

green "Installing vim plugins"
vim -E -s -c "source ~/.vimrc" -c PluginInstall -c qa
