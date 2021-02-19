# First of all we are going to start Vault in development mode
vault server -dev

# Now set your Vault address environment variable
export VAULT_ADDR=http://127.0.0.1:8200

# And log into Vault using the root token
vault login 

# Now we can check and see what policies exist right now
vault policy list 

# Pretty much what we expected

# Before we create the policies, let's get a few things set up
# You can skip this if you still have it running from last time

# Enable userpass auth method
vault auth enable userpass

# Add a user
vault write auth/userpass/users/ned password=tacos

# Now we'll create a policy for secrets management
vault policy write secrets-mgmt secrets-mgmt.hcl

vault policy list

vault policy read secrets-mgmt

# Next we'll create a policy for the accounting secrets engine

# First we'll enable the secrets engine
vault secrets enable -path=accounting -version=2 kv

# And we'll add some secrets to the engine
vault kv put accounting/apitokens/d101 token=1234567890
vault kv put accounting/apitokens/d102 token=1234567890
vault kv put accounting/apitokens/d103 token=1234567890
vault kv put accounting/apitokens/privileged/p101 token=1234567890

# Now we can craft a policy allowing access to the regular tokens
# And denying access to the priveleged tokens
# We will add the policy through the UI
