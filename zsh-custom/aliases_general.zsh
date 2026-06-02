alias d='cd /Users/adam.trimble/Documents/dotfiles; nvim'
alias gb='git checkout $(git branch --sort=-committerdate | fzf)'
alias gcm='git checkout main'
alias gpr='gh pr checkout'
alias v='nvim'

alias gastro='cd /Users/adam.trimble/Documents/gastro; nvim'
alias kitchen='cd /Users/adam.trimble/Documents/kitchen; nvim'
alias dotfiles='cd /Users/adam.trimble/Documents/dotfiles; nvim'
alias notes='cd /Users/adam.trimble/Documents/notes; nvim'

alias python=python3
alias pip=pip3

alias urclaude='claude --dangerously-skip-permissions'

transcribe() {
  local input="$1"
  local wav="$(mktemp -t transcribe).wav"
  ffmpeg -nostdin -loglevel error -y -i "$input" -ar 16000 -ac 1 -c:a pcm_s16le "$wav" || { rm -f "$wav"; return 1; }
  whisper-cli -m "$HOME/.cache/whisper-cpp/ggml-medium.en.bin" -l en -otxt -of "${input%.*}" -f "$wav"
  rm -f "$wav"
}
