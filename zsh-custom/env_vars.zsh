#   ------------------------------
#   Platform-Specific Environment Variables
#   ------------------------------
# This file conditionally loads platform-specific configs

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
