# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-docker)

export FZF_COMPLETION_TRIGGER='**'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# TERRAFORM
alias tf=terraform

# GIT
alias g='git'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gd='git diff'
alias gjira='open https://naturalcycles.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD)'

# DRO
alias d='dro'
alias da='dro add' 
alias dls='dro list -f index' 
alias dd='dro md -i' 
alias ddi='dro md -i' 

# NATURAL CYCLES >>>>>>

#Kubernetes
alias k='kubectl'
alias k-ns='kubectl config set-context $(kubectl config current-context) --namespace ' # <namespace>
alias k-ns-ids='k get ns -o jsonpath="{ range .items[*]}{@.metadata.name}: {@.metadata.uid}{\"\n\"}{end}"'
alias k-np='echo "kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName="' #<nodename>
alias mk='sudo microk8s kubectl'
alias mk-ns='sudo microk8s kubectl config set-context $(sudo microk8s kubectl config current-context) --namespace ' # <namespace>

#GCloud
alias c=gcloud
alias c-cfg-ls='gcloud config list'
alias c-cfgs-ls='gcloud config configurations list'
alias c-nctest='sudo gcloud config configurations activate ncbackend-test'
alias c-ncprod='gcloud config configurations activate ncbackend-prod'
alias c-vpntest='gcloud config configurations activate vpn-test'
alias c-ncinfra='gcloud config configurations activate nc-infra'
alias gcloud-k-prod-backup-activate='gcloud container clusters get-credentials prod-cluster-1 --region=europe-west2-b' 

#nc_random
alias k-all='sh ~/Documents/repos/nc_random/scripts/k-all.sh'

#github
alias nc_ci_subj='echo account fertilty algo algo-runner data oura auth deps messages payments subs pipelines privacy signup healthkit bluetooth nfc achivements cycle-status reminders analytics analysis ci content crm optimove device docs logistics sentry test app-shop ui samsung chatbot'
#<<<<<<<<<NATURAL CYCLES 

# My paths
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/anthon/.local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/anthon/.local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/anthon/.local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/anthon/.local/bin/google-cloud-sdk/completion.zsh.inc'; fi

# fzf
source <(fzf --zsh)


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
