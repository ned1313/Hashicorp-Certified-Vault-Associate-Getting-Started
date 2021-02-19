# We are going to assign a policy to Ned in the userpass auth method
# How do we do that? Path-help to the rescue!
vault path-help auth/userpass/users/ned

# Looks like token_policies should do it
vault write auth/userpass/users/ned token_policies="secrets-mgmt"

# Now we can log in as Ned and try to mount a new secrets engine
vault login -method=userpass username=ned

vault secrets enable -path=testing -version=1 kv

vault secrets list

vault secrets disable testing

vault secrets disable accounting

# Lastly, let's get rid of the accounting policy
vault policy delete accounting

# Wait, Ned can't do that! Let's log in as root again
vault login