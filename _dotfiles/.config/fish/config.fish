# ----------
# bobthefish config
# ----------
set -g fish_prompt_pwd_dir_length 0  # ディレクトリ省略しない
set -g theme_newline_cursor no  # プロンプトを改行した先に設ける
set -g theme_display_git_master_branch yes  # git の branch 名を表示
# set -g theme_color_scheme dark
set -g theme_display_date no  # 時刻を表示しないように設定
set -g theme_display_cmd_duration no # コマンド実行時間の非表示


# ----------
# alias
# ----------
alias gbr='git branch'
alias gco='git checkout'
alias gad='git add'
alias gcm='git commit -m'
alias gcl='git clone'
alias gpl='git pull'
alias gft='git fetch'
alias gmg='git merge'
alias gps='git push'
alias gst='git status'
alias gsw='git switch'
alias grs='git restore'
alias gmv='git mv'

# alias rm='rm -i'
# alias mv='mv -i'
# alias cp='cp -i'
alias ..='cd ..'
alias ...='cd ../..'
alias linuxupdate='sudo apt update && sudo apt upgrade -y'
alias brewupdate='brew update && brew upgrade && brew cleanup'
