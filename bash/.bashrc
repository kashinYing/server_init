# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User definitions
if [ "$TERM" == "xterm" ]; then
  # No it isn't, it's gnome-terminal
  export TERM=xterm-256color
fi

# export latest vim
export PATH=$PATH:/usr/local/bin/vim

# enable gcc g++ with higher version
# once time command
# scl enable devtoolset-8 -- bash
source scl_source enable devtoolset-8
