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
