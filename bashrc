# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

# History settings
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=99999
export HISTFILESIZE=99999
shopt -s histappend
export HISTCONTROL=ignoreboth
export HISTIGNORE="ll:ls:history:awx*password*:sshag"

# e ls aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -alF'
alias lart='ls -alFrt'
alias la='ls -A'
alias l='ls -CF'
alias tmux='TERM=xterm-256color tmux'
alias vi='TERM=xterm-256color vi'
alias vim='TERM=xterm-256color vim'
alias ccat="highlight -O ansi"
alias anpb="ansible-playbook"
alias tmx="TERM=xterm-256color tmux attach -t default || tmux new -s default"
alias sshans="ssh -i .ssh/ans.priv -l ansible"
alias cdanpb="cd ~/prj/ansiblepb"
alias cdtask="cd ~/task"
alias snotes='sncli -c ~/task/simplenote/sncli.cfg'

#aliases for pathes
shopt -s cdable_vars
export Danpb=~/prj/ansiblepb
# Find ssh agent
# https://github.com/wwalker/ssh-find-agent
# curl https://raw.githubusercontent.com/wwalker/ssh-find-agent/refs/heads/master/ssh-find-agent.sh > ~/.bashexts/ssh-find-agent.sh
source ~/.bashexts/ssh-find-agent.sh

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# export PROMPT_HOST_NAME='unixdev02'

## VI MODE ##
#set -o vi


lineyka() {
for i in {0..9} {0..4};do echo -n $i;for y in {0..9};do echo -n "-";done;done;echo
}
sshag() {
eval `ssh-agent`
/usr/bin/ssh-add ~/.ssh/id_rsa
}

#mnttask() {
#echo 't24'
#encfs /home/achern/.raw-task /home/achern/task
#}

# LS COLORS
## export LS_COLORS="$(vivid generate snazzy)"

## Prompt
# $ cd $WHERE_YOU_KEEP_GITHUB_REPOS
# $ git clone https://github.com/skeswa/prompt
# $ cd prompt
# $ make install

# Use 'skeswa/prompt' which is symlinked to '~/.prompt'.
. ~/.prompt/prompt.bash


# Add git completion to the prompt (comes from 'skeswa/prompt').
# . ~/.prompt/git-completion.bash
#
#
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/achern/miniforge3/bin/conda' 'shell.bash' 'hook' 'commands' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/achern/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/achern/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/achern/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# Conda autocomplete
eval "$(register-python-argcomplete conda)"
#Keep zoxide bottom
eval "$(zoxide init bash)"
