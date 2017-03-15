# Aliases
    # -i (prompt before deleting etc.) option
    alias mv='mv -i'
    alias rm='rm -i'
    alias ln='ln -i'

    # Colorize ls output
    # Write a slash (`/') after each filename if that file is a directory.
    alias ls='ls --color -p'

    # Alias 'vi' to the Vim installed by Homebrew and NOT the preinstalled
    # version
    alias vi='vim'

    # Color matches in grep output
    alias grep='grep --color'

    # Do not print the introductory and copyright messages
    alias gdb='gdb -q'

    # Use vi-like and less-like key-bindings for navigating info documents
    alias info='info --vi-keys'

    # Add colors to 'tree'
    alias tree='tree -C'

    # Prevent octave from printing a message at startup
    # Also prevent it from opening the gui
    alias octave='octave -q --no-gui -W'

# Use vim keybindings
#set -o vi

# Add my shell scripts to the PATH
export PATH=$HOME/scripts:$PATH

# Settings for Go programming
    # Set the GOPATH environment variable
    # (specifies the location of your workspace for developing Go code)
    export GOPATH=$HOME/go_workspace

    # add the workspace's bin subdirectory to the PATH
    PATH=$PATH:$GOPATH/bin

# Add /usr/local/bin/git to the path
PATH=/usr/local/bin/git:$PATH

# Update your path to resolve to Python (and LaTeX for TAs)
PATH=/usr/local/bin:$PATH:/usr/texbin

# Work around for Mavericks
export PYTHONPATH=/Library/Python/2.7/site-packages:$PYTHONPATH

# Kivy settings for preferences and logging
export KIVY_HOME="/Users/sethfurman/.kivy"

# OPAM configuration
. /Users/sethfurman/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Enable and set colors for the 'ls' command
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Set the Linux LS_COLORS variable for use with the 'tree' command
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;"
LS_COLORS+="46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
