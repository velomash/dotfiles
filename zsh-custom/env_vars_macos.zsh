#   ------------------------------
#   GET SECRETS FROM MAC KEYCHAIN
#   ------------------------------
get_pw () {
  security find-generic-password -ga "$1" -w
}

#   ------------------------------
#   API Keys from Keychain
#   ------------------------------
# Uncomment these when needed:
# export NPM_TOKEN="$(get_pw packagecloud.io)"
# export ANTHROPIC_API_KEY="$(get_pw anthropic_api_key)"
# export ALIAS_API_TOKEN="$(get_pw alias_api_key)"
# export ALIAS_API_TOKEN_STAGING="$(get_pw alias_api_key_staging)"
# export TF_VAR_staging_db_password="$(get_pw gastro_staging_db_password)"

#   ------------------------------
#   GOAT ENV VARS (macOS)
#   ------------------------------
# Uncomment these when needed:
# export GH_PACKAGES_TOKEN="$(get_pw GOAT_github)"
# export GOPRIVATE="github.com/goatapp/*"
