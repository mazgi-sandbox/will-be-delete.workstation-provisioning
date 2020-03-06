export ZDOTDIR=${ZDOTDIR:-$HOME}

source ${ZDOTDIR}/.zinit/bin/zinit.zsh

autoload -Uz compinit
for dump in ${ZDOTDIR}/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

zinit ice silent wait:0; zinit light zsh-users/zsh-completions
zinit ice silent wait:0 atload:_zsh_autosuggest_start
zinit light zsh-users/zsh-autosuggestions
zinit ice silent wait:0; zinit light zsh-users/zsh-syntax-highlighting
zinit ice silent wait:0; zinit light zsh-users/zsh-history-substring-search

zinit ice from"gh-r" as"program" mv"hub-*/bin/hub -> hub" atclone'./hub alias -s > zhook.zsh' atpull'%atclone'
zinit light github/hub
zinit ice silent as"completion" mv'hub.zsh_completion -> _hub' 
zinit snippet https://github.com/github/hub/raw/master/etc/hub.zsh_completion

# zinit ice from"gh-r" as"program" atclone'./starship init zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
# zinit light starship/starship
eval "$(starship init zsh)"
