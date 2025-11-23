#   ------------------------------
#   Linux-specific environment variables
#   ------------------------------
# Add Linux-specific variables here

#   ------------------------------
#   Secret Management on Linux
#   ------------------------------
# Consider using one of these for secret management:
# - pass (password-store): https://www.passwordstore.org/
# - 1Password CLI: https://developer.1password.com/docs/cli
# - age: https://github.com/FiloSottile/age

# Example using pass:
# get_pw () {
#   pass show "$1"
# }

#   ------------------------------
#   API Keys (Linux)
#   ------------------------------
# Uncomment and configure with your secret management solution:
# export NPM_TOKEN="$(get_pw packagecloud.io)"
# export ANTHROPIC_API_KEY="$(get_pw anthropic_api_key)"
# export ALIAS_API_TOKEN="$(get_pw alias_api_key)"
# export ALIAS_API_TOKEN_STAGING="$(get_pw alias_api_key_staging)"
# export TF_VAR_staging_db_password="$(get_pw gastro_staging_db_password)"

#   ------------------------------
#   GOAT ENV VARS (Linux)
#   ------------------------------
# Uncomment these when needed:
# export GH_PACKAGES_TOKEN="$(get_pw GOAT_github)"
# export GOPRIVATE="github.com/goatapp/*"
