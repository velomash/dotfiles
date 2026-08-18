#   ------------------------------
#   Platform-Specific Environment Variables
#   ------------------------------
get_pw () {
  security find-generic-password -ga "$1" -w
}
export NPM_TOKEN="$(get_pw packagecloud.io)"
export GH_PACKAGES_TOKEN="$(get_pw gh_packages_token)"
export ALIAS_OPENAPI_TOKEN="$(get_pw alias_openapi_token)"
export ALIAS_ALGOLIA_TOKEN="$(get_pw alias_algolia_token)"

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
