# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
#plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases
    # -i (prompt before deleting etc.) option
    alias mv='mv -i'
    alias ln='ln -i'
    alias rm='rm -i'

    # Write a slash (`/') after each filename if that file is a directory.
    alias ls='ls -p'

    # Alias 'vi' to the Vim installed by Homebrew and NOT the preinstalled
    # version
    alias vi='vim'

    # Color matches in grep output
    alias grep='grep --color'

    # Color differences in diff output
    alias diff='colordiff'

    # Do not print the introductory and copyright messages
    alias gdb='gdb -q'

    # Use vi-like and less-like key-bindings for navigating info documents
    alias info='info --vi-keys'

    # Add colors to 'tree'
    alias tree='tree -C'

    # Prevent octave from printing a message at startup
    # Also prevent it from opening the gui
    alias octave='octave -q --no-gui -W'

# Keyboard shortcuts
    # Alias CTRL + ARROWKEY to word navigation
    bindkey "^[[C" forward-word
    bindkey "^[[D" backward-word

# Environment variables
    # Add my shell scripts to the PATH
    export PATH=$HOME/scripts:$PATH

    # Add /usr/local/bin/git to the path
    PATH=/usr/local/bin/git:$PATH

    # Enable and set colors for the 'ls' command
    export CLICOLOR=1
    export LSCOLORS=gxfxcxdxbxegedabagacad

    # Set the Linux LS_COLORS variable for use with the 'tree' command
    export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;"
    LS_COLORS+="46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

    # Use $LS_COLORS for completion
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Programming variables and configuration
    # Settings for Go programming
        # Set the GOPATH environment variable
        # (specifies the location of your workspace for developing Go code)
        export GOPATH=$HOME/go_workspace

        # add the workspace's bin subdirectory to the PATH
        PATH=$PATH:$GOPATH/bin

    # OPAM configuration
    . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
