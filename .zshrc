#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# ビープ音を消す
setopt no_beep

# ~/.dircolorからlsの色を設定
eval $(dircolors -b ~/.dircolor)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ohyama4z/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ohyama4z/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ohyama4z/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ohyama4z/google-cloud-sdk/completion.zsh.inc'; fi

# gcloudのパス通す
export PATH="$PATH:$HOME/google-cloud-sdk/bin/gcloud"