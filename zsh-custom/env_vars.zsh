#   ------------------------------
#   GET SECRETES FROM MAC KEYCHAIN
#   ------------------------------
get_pw () {
  security find-generic-password -ga "$1" -w
}
export NPM_TOKEN="$(get_pw packagecloud.io)"
export ANTHROPIC_API_KEY="$(get_pw anthropic_api_key)"
export ALIAS_API_TOKEN="$(get_pw alias_api_key)"
export ALIAS_API_TOKEN_STAGING="$(get_pw alias_api_key_staging)"

#   ------------------------------
#   GOAT ENV VARS
#   ------------------------------
export GH_PACKAGES_TOKEN="$(get_pw GOAT_github)"
export GOPRIVATE="github.com/goatapp/*"

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

export LOCALSTACK_AUTH_TOKEN="ls-lONI8713-Ruqi-6716-JaMO-CeJAQidI357b"
