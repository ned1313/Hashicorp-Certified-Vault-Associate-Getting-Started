# Let's make sure we're logged in as the root token
vault login $root_token

# Now we'll create a batch token with a ttl of 30m
vault token create -type=batch -policy=default -ttl=30m

# Wow, look at that id, it's LOOOOOOOOOOOOOOOOOOOOOOOOOOONG
# Let's try to lookup the properties of a batch token

batch_id=BATCH_TOKEN_ID

vault token lookup $batch_id

# It's not an orphan and it cannot be renewed

vault token renew $batch_id

# What about a periodic token? Let's create one of those

vault token create -policy=default -period=2h

# And take a look at its properties

vault token lookup PERIODIC_TOKEN_ID

# Now let's try to renew

vault token renew -increment=180m PERIODIC_TOKEN_ID

# Looking at the properties again, the ttl is back to 2h
# If you supply an increment, Vault ignores it