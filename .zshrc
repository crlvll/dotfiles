# ~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~~~
#
# Using GPG + Yubikey for ssh. 
# See tutorial by mischavandenburg
#
# export GPT_TTY="$(tty)"
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#
# gpgconf --launch gpg-agent
# gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
#
# ~~~~~~~~~~~~~~ Environment variables ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set vim mode on CLI
set -o vi

export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

export BROWSER="safari"

# Directories

export REPOS="$HOME/Documents/Repos"
export GITUSER="crlvll"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export SECOND_BRAIN="$HOME/Documents/Zettelkasten"

# ~~~~~~~~~~~~~ PATH configuration ~~~~~~~~~~~~~~~~~

setopt extended_glob null_glob

path=(
    $path               # keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $SCRIPTS
)

# We remove duplicates and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH

# ~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

#~~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PURE_GIT_PULL=0


if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi

autoload -U promptinit; promptinit
prompt pure

# ~~~~~~~~~~~~~~~Aliases~~~~~~~~~~~~~~~~~~~

alias v=nvim
alias c="clear"
alias t='tmux'
alias e='exit'
alias j='~/Documents/Repos/github.com/crlvll/dotfiles/scripts/obtf.sh'
# cd
alias ww='cd ~/Documents/Websites/'
alias dot='cd  $GHREPOS/dotfiles'
alias scripts='cd $SCRIPTS'
alias sb='cd $SECOND_BRAIN'
alias home='cd ~/'

# ls

alias ls='ls --color=auto'
alias la='ls -lathr'

# ~~~~~~~~~~~~~~~~~~~~~~ More config ~~~~~~~~~~~~~~~~~~~~

# get rid of mail notifications on MacOS
unset MAILCHECK

source <(fzf --zsh)

fpath+=~/.zfunc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select




# ~~~~~~~~~~~~~~~~~~~~~~ Let's have some fun~~~~~~~~~~~~~~
fortune | lolcat

