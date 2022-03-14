#   ------------------------------
#   GET SECRETES FROM MAC KEYCHAIN
#   ------------------------------
get_pw () {
  security find-generic-password -ga "$1" -w
}
export NPM_TOKEN="$(get_pw packagecloud.io)"
export TF_VAR_staging_db_username="$(get_pw gastro_staging_db_username)"
export TF_VAR_staging_db_password="$(get_pw gastro_staging_db_password)"
export TF_VAR_production_db_username="$(get_pw gastro_production_db_username)"
export TF_VAR_production_db_password="$(get_pw gastro_production_db_password)"

#   ---------------------------
#   FZF config for use with vim
#   ---------------------------
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
