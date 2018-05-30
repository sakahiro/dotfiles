# シンプルな zshrc
# License : MIT
# http://mollifier.mit-license.org/

#brewのpathを優先させる
PATH=/usr/local/bin:/usr/bin:/bin:$PATH
export PATH

# 環境変数
export LANG=ja_JP.UTF-8

#色を使用できるようにする
autoload -Uz colors
colors

# 補完機能を有効にする
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

autoload -U compinit
compinit -u

# 一般ユーザ時
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~ %# "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

if [ -f /usr/local/Cellar/zsh-syntax-highlighting/0.4.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/Cellar/zsh-syntax-highlighting/0.4.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups


# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

#エイリアス
alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias vi='nvim'

# lsの色
export CLICOLOR=1
alias ls='ls -G -F'

# sudoしたあとにaliasを有効にする
alias sudo='sudo '

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# emacs 風キーバインドにする
bindkey -e


# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ブランチ表示
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export PATH="/usr/local/sbin:$PATH"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
