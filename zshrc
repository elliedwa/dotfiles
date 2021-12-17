# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit istaller code

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# everforest theme
zinit snippet \
    https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme-everforest-dark

# using the colors
#zinit snippet https://raw.githubusercontent.com/zuxfoucault/colored-man-pages_mod/master/colored-man-pages_mod.plugin.zsh
#zinit wait lucid for \
#atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#zdharma-continuum/fast-syntax-highlighting \
#blockf \
#zsh-users/zsh-completions \
#atload"!_zsh_autosuggest_start" \
#zsh-users/zsh-autosuggestions

zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
    zsh-users/zsh-completions \
    zsh-users/zsh-autosuggestions \
    ael-code/zsh-colored-man-pages \
    zdharma-continuum/fast-syntax-highlighting \
    as"completion" \
    davidde/git

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

unsetopt beep
# The following lines were added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/elliotedwards/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
