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

green "release: $release"
green "syspkg: $syspkg"
green "syspwd: $syspwd"


tools_to_install=(
  'git'
  'vim'
  'tmux'
)

# install tools
for t in "${tools_to_install[@]}"; do
  yellow "Installing $t"
  $syspkg -y install $t
done

# bash
bashrc_file='./bash/.bashrc'
green "Copying $bashrc_file to $HOME/.bashrc"
cp $bashrc_file $HOME

profile='./bash/.profile'
green "Copying $profile to $HOME/.profile"
cp $profile $HOME

# vim
yellow 'Customizing vim'

vundle_git_link='https://github.com/VundleVim/Vundle.vim.git'
vundle_local_path_to_install="$HOME/.vim/bundle/Vundle.vim"
green "Installing vundle to $vundle_local_path_to_install"
git clone $vundle_git_link $vundle_local_path_to_install

vimrc_file='./vim/.vimrc'
green "Copying $vimrc_file to $HOME/.vimrc"
cp $vimrc_file $HOME

green "Installing vim plugins"
vim -E -s -c "source ~/.vimrc" -c PluginInstall -c qa

gruvbox_path="$HOME/.vim/bundle/gruvbox/colors/*.vim"
vim_colors="$HOME/.vim/colors"
green "Copy color theme gruvbox $gruvbox_path to $vim_colors"
mkdir -p $vim_colors
cp $gruvbox_path $vim_colors
