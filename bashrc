# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#{{{ GENERAL
    PATH=$PATH:/sbin:/usr/local/bin:~/bin

    export EDITOR='vim'
    export PAGER='less -I -R'
    export DIFF_COLOR_DO_HORIZONTAL=1

    # default options to less
    export LESS='-RI'

    # Change the window title of X terminals 
    case $TERM in
        xterm*|rxvt|Eterm|eterm)
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
            ;;
        screen)
            PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
            ;;
    esac


    # color stuff

    # define some colors for use in lscolors
    DIR=Ex
    SYM_LINK=Gx
    SOCKET=Fx
    PIPE=dx
    EXE=Cx
    BLOCK_SP=Dx
    CHAR_SP=Dx
    EXE_SUID=hb
    EXE_GUID=ad
    DIR_STICKY=Ex
    DIR_WO_STICKY=Ex

    # set the colors that are displayed when ls uses color
    export LSCOLORS="$DIR$SYM_LINK$SOCKET$PIPE$EXE$BLOCK_SP$CHAR_SP$EXE_SUID$EXE_GUID$DIR_STICKY$DIR_WO_STICKY"

    # use these later to colorize the prompt
    BLACK="\[\033[0;30m\]"
    BLUE="\[\033[0;34m\]"
    BROWN="\[\033[0;33m\]"
    CYAN="\[\033[0;36m\]"
    GREEN="\[\033[0;32m\]"
    PURPLE="\[\033[0;35m\]"
    RED="\[\033[0;31m\]"
    YELLOW="\[\033[1;33m\]"
    WHITE="\[\033[1;37m\]"
    DARK_GRAY="\[\033[1;30m\]"
    LIGHT_GRAY="\[\033[0;37m\]"
    LIGHT_BLUE="\[\033[1;34m\]"
    LIGHT_GREEN="\[\033[1;32m\]"
    LIGHT_CYAN="\[\033[1;36m\]"
    LIGHT_RED="\[\033[1;31m\]"
    LIGHT_PURPLE="\[\033[1;35m\]"

    # prompt was originally
    # export PS1=\s-\v\$
    
    # prompt will no be
    #export PS1="\u@\h \T \w $ "
    
    # making the prompt have some color and have some interesting information in it
    export PS1="$RED\T $CYAN\j $YELLOW\h:$GREEN\w $BLUE\$(__git_ps1 '%s') $LIGHT_GRAY$ "

    # making good tools better
    alias less='less -I -R'
    alias history='history | less'
    alias psa='ps auwx | ack -i'
    alias ack='ack --color --group -a'


    # ls
    alias lsf='ls -Gp | grep -v /'
    alias lsd='ls -Gp | grep /'
    alias lsl='ls -GF | grep @'
    alias llf='ls -Glp | grep -v "/$"'
    alias lld='ls -Glp | grep "/$"'
    alias la=' ls -Glah'
    alias ll=' ls -Glh'
    alias l='  ls -Glh'
    alias ls=' ls -G'

    # ssh
    alias jhdc='ssh josh@joshheumann.com'
    alias cpdo='ssh -p 6622 josh@codepirates.org'
    alias cpod='ssh -p 6622 josh@codepirates.org'

    alias fu=' cd ~/dev/josh_svn/dev/perlfu'
    alias jfu='cd ~/dev/josh_svn/dev/jqueryfu'

    alias vrc='vim ~/.vimrc'
    alias svrc='source ~/.vimrc'
    alias brc='vim ~/.bashrc'
    alias sbrc='source ~/.bashrc'

    alias pg='ping google.com'

    alias vims='vim -S session.vim'
#}}}

# {{{ PERL

    alias pd='perldoc'
    alias pf='perldoc -f'
    alias short='ack -a --nocolor "^sub"'
    alias uses="ack -aih --output='\$1' '^use\s(.*);' | sort -u"
# }}}

#test -r /sw/bin/init.sh && . /sw/bin/init.sh

#{{{ SVN
    alias svs='echo "";svn status | grep -v swp'
    alias svsl='clear;svn status | grep -v swp'
    alias svu='svn up'
    alias svi='svn info'
    alias ehd0='export DIFF_COLOR_DO_HORIZONTAL=0'
    alias ehd1='export DIFF_COLOR_DO_HORIZONTAL=1'

    alias sdl='svn_diff_less.pl'
    alias sd='svn di | diff_painter.pl'
#}}}

#{{{ GIT
    alias gdl='git_diff_less.pl'
    # TODO write a differ that does svn or git, and just use 'dl' as the alias
    alias dl='git_diff_less.pl'

    # shamelessly stolen from Ingy Dot Net 
    alias gst='git status'
    alias gbr='git branch'
    alias gd='git diff | diff_painter.pl | less'
    alias gdp='gd | vim -'
    alias gdc='git diff --cached'
    alias gdcp='gdc | vim -'
    alias ga='git add'
    alias gau='git add -u'
    alias gco='git checkout'
    alias gci='git commit -v'
    alias gcim='git commit -v -m'
    alias gcia='git commit -v -a'
    alias gciam='git commit -v -a -m'
    alias gl='git log'
    alias glol='git log --pretty=oneline'
    alias glop='git log -p -1'
    alias guppy='gup && gpu'
    alias sup='git stash && gup && git stash pop'
    alias suppy='git stash && gup && gpu && git stash pop'
    alias gls='git ls-files --exclude-standard'
    alias gcp='git cherry-pick -x'
    alias grh='git reset --hard HEAD'
    alias gundo='git reset HEAD^'
#}}}

if [ `hostname` = 'zoot' ]; then
	source ~/dev/josh_svn/rc_files/bashrc_bunsen
fi
if [ `hostname` = 'codepirates.org' ]; then
	source ~/dev/josh_svn/rc_files/bashrc_cpdo
fi
if [ `hostname` = 'Link-Hogthrob' ]; then
	source ~/dev/josh_svn/rc_files/bashrc_link
fi
if [ `hostname` = 'Link-Hogthrob.mel.strategicdata.com.au' ]; then
	source ~/dev/josh_svn/rc_files/bashrc_link
fi
if [ `hostname` = 'Link-Hogthrob.local' ]; then
	source ~/dev/josh_svn/rc_files/bashrc_link
fi

alias ..='cd ..'

alias vimi='vim -c ":set paste" -c ":star"'

alias link='ssh joshh@link-hogthrob'

alias fmv='find_module_version.pl'

alias jqt='cp ~/dev/josh_svn/dev/jqueryfu/_template.html'

alias run_tempest='cd ~/work/tempest; source shell_vars; clear; SD_PLATFORM_CONFIG=websurvey-platform_local plackup -r -Ilib -Isubmodules/websurvey-tools/lib -Isubmodules/websurvey-tools/submodules/websurvey/lib -I../SD-RandomToken/lib -I../SD-Platform/lib websurvey-tempest.psgi'

alias work='cd ~/work/surveys/deecd/census-2012/default;svn up;vims'

alias flashup='/Applications/Utilities/Adobe\ Flash\ Player\ Install\ Manager.app/Contents/MacOS/Adobe\ Flash\ Player\ Install\ Manager -update plugin'

alias vup='cd ~/work/websurvey; echo "sudo su, and rews"; vagrant up; vagrant ssh'
alias vha='cd ~/work/websurvey; vagrant halt'
alias wso='~/work/websurvey/local-development/scripts/generate_url.pl'
