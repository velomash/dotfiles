#   ------------------------------
#   Platform-Specific Environment Variables
#   ------------------------------
get_pw () {
  security find-generic-password -ga "$1" -w
}
export ALIAS_API_TOKEN="$(get_pw alias_api_key)"
export ALIAS_API_TOKEN_STAGING="$(get_pw alias_api_key_staging)"
export CLOUDFLARE_API_TOKEN="$(get_pw cloudflare_api_key)"
export GITHUB_GIST_TOKEN="$(get_pw github_gist_token)"
export HACKERONE_API_TOKEN="$(get_pw hackerone_api_token)"
export JIRA_API_KEY="$(get_pw jira_api_key)"
export NPM_TOKEN="$(get_pw packagecloud.io)"
export TF_VAR_staging_db_password="$(get_pw gastro_staging_db_password)"

# Get the directory where this script is located
ZSHCUSTOM_DIR="${0:a:h}"

# Always load common variables
source "$ZSHCUSTOM_DIR/env_vars_common.zsh"

# Load platform-specific variables
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  source "$ZSHCUSTOM_DIR/env_vars_macos.zsh"
else
  # Linux and others
  source "$ZSHCUSTOM_DIR/env_vars_linux.zsh"
fi
