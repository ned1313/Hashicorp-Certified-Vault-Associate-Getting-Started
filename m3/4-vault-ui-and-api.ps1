# Let's start by opening the Vault UI and checking things out
# Grab that root token, b/c you'll need it
$root_token

# Now open a browser on http://127.0.0.1:8200/ui

# Fun! Now let's use Invoke-WebRequest to interact with the API using
# the root token.

$headers = @{
    "X-Vault-Token" = $root_token
}

$resp = Invoke-WebRequest -Uri "$env:VAULT_ADDR/v1/sys/host-info" `
  -UseBasicParsing -Headers $headers