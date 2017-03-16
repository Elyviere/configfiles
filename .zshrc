# Created by newuser for 5.0.7

#export http_proxy=http://wwwproxy.se.axis.com:3128
#export https_proxy=$http_proxy
#export ftp_proxy=$http_proxy

export http_proxy=http://wwwproxy.se.axis.com:3128
export https_proxy=http://wwwproxy.se.axis.com:3128
export ftp_proxy=wwwproxy.se.axis.com:3128
export CVSROOT=:ext:dev-cvs:/usr/local/cvs/linux
export AXIS_DEVELOPER=y
export AXIS_TESTER=y
export AXIS_TARGET_ADDR=y
export AXIS_TARGET_IP=192.168.0.128
export AXIS_RESUME=y

## Show hidden files ##
alias l.='ls -d .* --color=auto'

source ~/.grml_zshrc
# source ~/bin/oe-setup/oe-setup.sh

function _accept-line() {
    if [[ $BUFFER == "." ]]; then
        BUFFER="source ~/.zshrc"
    fi
    zle .accept-line
} 

zle -N accept-line _accept-line

