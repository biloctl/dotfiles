eval "$(starship init zsh)"
export PATH="/opt/homebrew/bin:$PATH"
export CLICOLOR=1
export EZA_COLORS="da=37"
alias ls='ls -G'
alias ls='eza --git --group-directories-first'
alias ll='eza -l --git --group-directories-first'
alias la='eza -la --git --group-directories-first'
alias lt='eza --tree --level=2 --icons'
