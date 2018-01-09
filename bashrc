# packages
if [ ! -f /usr/local/bin/gdate ]; then
    brew install coreutils
fi

#delete docker images without pointers to them or with containers
alias drmi='docker rmi $(docker images -q -f "dangling=true")'

#docker alias
alias drm='docker rm $(docker ps -a -q -f "status=exited")'

# get current milliseconds
function getms {
  echo $(($(gdate +%s%N)/1000000))
}

start=$(getms)

# set up ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initializing new SSH agent..."
    touch $SSH_ENV
    chmod 600 "${SSH_ENV}"
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >> "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

# source ssh settings if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    kill -0 $SSH_AGENT_PID 2>/dev/null || {
        start_agent
    }
else
    start_agent
fi

duration=$(($(getms) - start ))
if [ "$SHOW_TIMERS" = true ]; then
    echo "Starting SSH Agent: ${duration}ms"
fi

# history
start=$(getms)
HISTIGNORE="hnote*"

# used to put notes in a history file
function hnote {
    echo "## NOTE [`date`]: $*" >> $HOME/.history/bash_history-`date +%Y%m%d`
}

# used to keep history forever
PROMPT_COMMAND="[ -d $HOME/.history ] || mkdir -p $HOME/.history; echo : [\$(date)] $$ $USER \$OLDPWD\; \$(history 1 | sed -E 's/^[[:space:]]+[0-9]*[[:space:]]+//g') >> $HOME/.history/bash_history-\`date +%Y%m%d\`"

export NVM_DIR="/Users/natalievillasana/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
