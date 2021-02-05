# Adding the `--address` flag everytime is a drag. Let's
# use environment variable so the vault CLI knows where
# to contact the Vault server.

$env:VAULT_ADDR="http://127.0.0.1:8200"

# Cool, now let's run a command without the Vault server 
# `--address` flag

vault status
