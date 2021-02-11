# Let's try out the Vault help command
vault -help

vault server -help

# Now we are going to start Vault in development mode
vault server -dev

# You will see Vault server launch and wait log actions to
# the current console window. Scroll up to find the unseal
# key and the root token. You're going to need the token

# Open a second console and save the token in a variable
# DO NOT USE VAULT_TOKEN for the variable name
$root_token="ROOT_TOKEN_VALUE"

# Let's log into the Vault server using our root token
# and the Vault server address. The default launch
# of the development server is listening on the loopback
# address and port 8200
vault login -address="http://127.0.0.1:8200" $root_token