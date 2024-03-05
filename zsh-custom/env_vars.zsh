#   ------------------------------
#   GET SECRETES FROM MAC KEYCHAIN
#   ------------------------------
get_pw () {
  security find-generic-password -ga "$1" -w
}
export NPM_TOKEN="$(get_pw packagecloud.io)"
export GH_PACKAGES_TOKEN="$(get_pw GOAT_github)"

#   ---------------------------
#   FZF config for use with vim
#   ---------------------------
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

export TF_VAR_staging_db_password="$(get_pw gastro_staging_db_password)"

export OPENAI_API_KEY=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
