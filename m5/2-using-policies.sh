# First let's try out our accounting policy be associating a policy
# directly with a token
vault token create -policy=accounting

# Now log in with that token
vault login

# We'll try listing out info in the accounting secrets engine
vault kv list accounting/

vault kv list accounting/apitokens/

vault kv list accounting/apitokens/privileged

# Seems to work for listing, let's try reading some secrets
vault kv get accounting/apitokens/d101

vault kv get accounting/apitokens/privileged/p101

# Uh, oh. Looks like we messed something up. Better update that policy to fix it.
# We can do that through the UI or with this command (You'll need to log back in as root)
vault policy write accounting accounting-fixed.hcl

vault kv get accounting/apitokens/privileged/p101

# Excellent! Next we're going to test out out secrets-mgmt policy
# We are going to assign it to Ned in the userpass auth method


