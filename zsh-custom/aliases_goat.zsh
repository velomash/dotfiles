# Editing
alias cms='cd /Users/adam.trimble/Documents/goat-web-cms; nvim'
alias f='cd /Users/adam.trimble/Documents/flightclub.com; nvim'
alias g='cd /Users/adam.trimble/Documents/web-main; nvim'
alias s='cd /Users/adam.trimble/Documents/sneakers; nvim'

# Testing
alias eted='npm run test:integration:desktop:local'
alias etem='npm run test:integration:mobile:local'

# Local Servers
alias scms='cd /Users/adam.trimble/Documents/goat-web-cms/; npm start'
alias sc='cd /Users/adam.trimble/Documents/goat-services/bin; ./sidecar sell-alias-org staging'
alias scg='cd /Users/adam.trimble/Documents/goat-services/bin; ./sidecar goat-web staging'
alias sf='cd /Users/adam.trimble/Documents/flightclub.com; npm run dev:inspect'
alias sg='cd /Users/adam.trimble/Documents/web-main; GOATENV_ENVOY_EGRESS=https://staging.goat.com npm start'
alias sgl='cd /Users/adam.trimble/Documents/web-main; GOATENV_ENVOY_EGRESS=http://localhost:3000 npm start'
alias sgr='cd /Users/adam.trimble/Documents/web-main; GOATENV_ENVOY_EGRESS=https://reserve.goat.com npm start'
alias sgqa='cd /Users/adam.trimble/Documents/web-main; GOATENV_ENVOY_EGRESS=https://qa.goat.com npm start'
alias spg='pg_ctl start -D ~/.asdf/installs/postgres/9.6.8/data'
alias ss='cd /Users/adam.trimble/Documents/sneakers/; bin/rails server'
