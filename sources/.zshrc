# Path exports as necessary
export PATH=$PATH:/usr/local/opt/gettext/bin
export PATH=$PATH:/Users/seluj78/.local/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=${PATH}:/usr/local/mysql/bin/

# Path to your oh-my-zsh installation.
export ZSH="/Users/seluj78/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=7


# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

plugins=(
  git
  colored-man-pages
  zsh-256color
  notify
  careful_rm
  autoupdate
  alias-tips
  zsh-iterm-touchbar
)

# notify plugin settings
zstyle ':notify:*' error-icon "https://cdn0.iconfinder.com/data/icons/coding-and-programming-1/32/fail_error_problem_crash_round_shape-512.png"
zstyle ':notify:*' success-icon "https://cdn.iconscout.com/icon/free/png-256/check-verified-successful-accept-tick-yes-success-2516.png"
zstyle ':notify:*' error-title "Command failed (in #{time_elapsed} seconds)"
zstyle ':notify:*' success-title "Command finished (in #{time_elapsed} seconds)"
zstyle ':notify:*' error-sound "Glass"
zstyle ':notify:*' success-sound "default"

# z plugin activation
. /Users/seluj78/.z.sh

# thefuck plugin activation
eval $(thefuck --alias)
alias f='fuck'

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export SSH_KEY_PATH="~/.ssh/rsa_id"


alias vim=/usr/local/bin/vim

# Mistakes were made
alias mak="make"
alias mke="make"
alias makw="make"
alias mkw="make"
alias male="make"
alias exiut="exit"
alias exiy="exit"
alias exiyt="exit"

# Git aliases
alias gcm="git commit -m"
alias gpb='git fetch -p && for branch in  $(git branch -vv | grep ": gone]" | awk "{print $1}"); do git branch -D $branch; done'

# Command for venv.sh
alias venv="source venv.sh"
alias mvim=vim

# Color for man pages
# http://nion.modprobe.de/blog/archives/572-less-colors-for-man-pages.html
export LESS_TERMCAP_mb=$'\E[01;31m'    # debut de blink
export LESS_TERMCAP_md=$'\E[01;31m'    # debut de gras
export LESS_TERMCAP_me=$'\E[0m'        # fin
export LESS_TERMCAP_so=$'\E[01;44;33m' # début de la ligne d'état
export LESS_TERMCAP_se=$'\E[0m'        # fin
export LESS_TERMCAP_us=$'\E[01;32m'    # début de souligné
export LESS_TERMCAP_ue=$'\E[0m'        # fin


# Custom commands

wyz()
{
    curl https://wyz.fr/ -F"${1##*.}=@$1"
}

compile_python()
{
    # Inspired from the great https://gitlab.com/python-devs/ci-images/
    # Thanks Barry Warsaw.
    local PY_VERSION="$1"
    local FLAGS=""
    local URL="https://www.python.org/ftp/python"
    (
        cd /tmp
        wget -qO- $URL/$PY_VERSION/Python-$PY_VERSION.tgz | tar -xzf - || (
            echo "Version not found, check on $URL."
        )
        [ -d Python-$PY_VERSION ] && (cd Python-$PY_VERSION; ./configure $FLAGS --prefix=$HOME/.local/ && make -j 16 && make altinstall) &&
            rm -r Python-$PY_VERSION
    )
}

compile_all_pythons()
{
    compile_python 2.7.18 &
    compile_python 3.4.10 &
    compile_python 3.5.10 &
    compile_python 3.6.12 &
    compile_python 3.7.9 &
    compile_python 3.8.6 &
    compile_python 3.9.0 &
    compile_python 3.10.0 &
	wait
}

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# added by travis gem
[ -f /Users/seluj78/.travis/travis.sh ] && source /Users/seluj78/.travis/travis.sh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
export OPENFAAS_URL=http://46.101.125.164:8080

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/seluj78/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/seluj78/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/seluj78/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/seluj78/bin/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(gh completion -s zsh)"
