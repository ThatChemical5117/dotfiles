#   ________          __  ________                        _       __
#  /_  __/ /_  ____ _/ /_/ ____/ /_  ___  ____ ___  _____(_)___ _/ /
#   / / / __ \/ __ `/ __/ /   / __ \/ _ \/ __ `__ \/ ___/ / __ `/ /
#  / / / / / / /_/ / /_/ /___/ / / /  __/ / / / / / /__/ / /_/ / /
# /_/ /_/ /_/\__,_/\__/\____/_/ /_/\___/_/ /_/ /_/\___/_/\__,_/_/  
#      __               __                           _____ __
#     / /_  ____ ______/ /_        ____  _________  / __(_) /__
#    / __ \/ __ `/ ___/ __ \      / __ \/ ___/ __ \/ /_/ / / _ \
# _ / /_/ / /_/ (__  ) / / /     / /_/ / /  / /_/ / __/ / /  __/
#(_)_.___/\__,_/____/_/ /_/_____/ .___/_/   \____/_/ /_/_/\___/
#                        /_____/_/

# ~/.bash_profile

# fcitx exports
export GTK_IM_MODULE='fcitx5'
export QT_IM_MODULE='fcitx5'
export SDL_IM_MODULE='fcitx5'
export XMODIFIERS='@im=fcitx5'

# CARGO EXORTS
export PATH=$PATH:/home/michaelkik/.local/share/cargo/bin

#EXPORTS for LF
export EDITOR="nvim"
export BROWSER="firefox"
export NVM_DIR="$HOME/.nvm"
export GTK_THEEME="Adwaita-dark"

# $HOME config relocation
export ELINKS_CONFDIR="$XDG_DATA_HOME"/elinks
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export HISTFILE="$XDG_STATE_HOME"/bash/history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export NO_AT_BRIDGE=1
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export XAUTHORITY="XDG_RUNTIME_DIR"/Xauthority


export HYPRSHOT_DIR="$HOME"/Pictures/ScreenShots

alias keychain=keychain --dir="$XDG_RUNTIME_DIR/keychain"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

[[ -f ~/.config/LF_ICONS ]] && {
	LF_ICONS="$(tr '\n' ':' <~/.config/LF_ICONS)" && export LF_ICONS
}

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec Hyprland
fi

. "/home/michaelkik/.local/share/cargo/env"
