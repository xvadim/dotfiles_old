source /etc/profile

fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
# Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
ZLS_COLORS="$LS_COLORS"
export ZLS_COLORS
zmodload zsh/complist
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true

# For git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "!"
zstyle ':vcs_info:*' formats '[%b%F{red}%c%u%F{green}]'
setopt PROMPT_SUBST

# History
HISTFILE=~/.zhistory
SAVEHIST=5000
HISTSIZE=5000
setopt APPEND_HISTORY

# For sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Disable mail checking
MAILCHECK=0

autoload -U colors zsh/terminfo

colors

# Aliases
alias -s {avi,mpeg,mpg,mov,m2v,flv}=mplayer
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s pdf=okular

# Recode aliases
alias w2k="iconv -c -f cp1251 -t koi8-r"
alias k2w="iconv -c -f koi8-r -t cp1251"
alias u2k="iconv -c -f utf-8 -t koi8-r"
alias k2u="iconv -c -f koi8-r -t utf-8"
alias U2k="iconv -c -f utf-16 -t koi8-r"
alias k2U="iconv -c -f koi8-r -t utf-16"
alias w2u="iconv -c -f cp1251 -t utf-8"

alias ds="du -s ."

alias mvimdiff="mvim -d"

# Hashes
hash -d wmL=~/work/mobile/LifelikeClassifieds
hash -d wmLL=~/work/mobile/LLAgentsClient
hash -d wmd=~/work/mobile/dd-html-push-parser
hash -d we=~/work/eclipse
hash -d wm=~/work/mobile
hash -d wa=~/work/android
hash -d wmS=~/work/mobile/search-agents

case $TERM in
 xterm* | rxvt*)
     preexec() {print -Pn "\e]0;$0\a"}
     precmd()  {print -Pn "\e]0;%~\a"}
     bindkey "^[[2~" yank
     bindkey "^[[3~" delete-char
     bindkey "^[[5~" up-line-or-history
     bindkey "^[[6~" down-line-or-history
     bindkey "^[[7~" beginning-of-line
     bindkey "^[[8~" end-of-line
     bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
     bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
     bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
     bindkey " " magic-space ## do history expansion on space
 ;;
esac

# Errors autocorrection
setopt CORRECT_ALL
SPROMPT="Ошибка! Вы хотели ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "

# Moving by dirs without cd
setopt autocd

# F1 for opening help
autoload zsh/terminfo
bindkey $terminfo[kf1] run-help

# Prompt: red color for root and yellow for non-root
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE;
do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

if (( EUID == 0))
then
    eval PR_COLOR=$PR_RED
else
    eval PR_COLOR=$PR_YELLOW
fi

precmd () {
    vcs_info
}

PROMPT='%B[$PR_COLOR%n$PR_NO_COLOUR] $PR_WHITE%~%F{green}${vcs_info_msg_0_}$PR_WHITE%#$PR_NO_COLOUR '

CDPATH=.:~:~/work

PATH=$PATH:~/work/android/android-sdk-macosx/tools/:~/bin

GIT_SSL_NO_VERIFY=1

