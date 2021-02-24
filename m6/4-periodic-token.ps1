# What about a periodic token? Let's create one of those

# Login as the root token

vault login $root_token

# Now create a periodic token

vault token create -policy=default -period=2h

# And take a look at its properties

vault token lookup PERIODIC_TOKEN_ID

# Now let's try to renew

vault token renew -increment=180m PERIODIC_TOKEN_ID

# Looking at the properties again, the ttl is back to 2h
# If you supply an increment, Vault ignores it