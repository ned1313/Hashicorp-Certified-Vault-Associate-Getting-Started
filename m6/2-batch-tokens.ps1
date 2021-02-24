# Let's make sure we're logged in as the root token
vault login $root_token

# Now we'll create a batch token with a ttl of 30m
vault token create -type=batch -policy=default -ttl=30m

# Wow, look at that id, it's LOOOOOOOOOOOOOOOOOOOOOOOOOOONG
# Let's try to lookup the properties of a batch token

$batch_id="BATCH_TOKEN_ID"

vault token lookup $batch_id

# It's not an orphan and it cannot be renewed

vault token renew $batch_id