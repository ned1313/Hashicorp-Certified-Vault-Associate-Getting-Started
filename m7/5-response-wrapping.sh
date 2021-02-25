# Let's say we want to retrieve a secret and response wrap it

# First we'll do it using a secret in the GloboKV store
vault kv get -wrap-ttl=30m GloboKV/apitokens/d102

# Now we can use the wrapping token value to read the value
vault unwrap WRAPPING_TOKEN_ID

# If we lookup the token after using it, it's gone!

vault token lookup WRAPPING_TOKEN_ID

# What if we wanted to generate credentials for Consul and pass
# those securely to someone else? Let's try that now

vault read -wrap-ttl=30m consul/creds/web

# Let's check on the token this time

vault token lookup WRAPPING_TOKEN_ID

# And now let's retrieve the Consul token created for us

vault unwrap WRAPPING_TOKEN_ID