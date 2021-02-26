# Let's try adding some values to our kv engine
vault kv put GloboKV/apitokens/d101 token=version1
vault kv put GloboKV/apitokens/d102 token=version1
vault kv put GloboKV/apitokens/d103 token=version1

# Now let's try and list the keys
vault kv list GloboKV/apitokens

# Nice, let's read one of the values
vault kv get GloboKV/apitokens/d101

# What if we update the value?
vault kv put GloboKV/apitokens/d101 token=version2
vault kv put GloboKV/apitokens/d102 token=version2
vault kv put GloboKV/apitokens/d103 token=version2

# Can we still get version 1? Sure can.
vault kv get -version=1 GloboKV/apitokens/d101

# How do we go about deleting an older version?
vault kv delete -versions=1 GloboKV/apitokens/d101

# Don't worry it's not really gone
vault kv metadata get GloboKV/apitokens/d101

# We can recover it by doing the following
vault kv undelete -versions=1 GloboKV/apitokens/d101

vault kv get -version=1 GloboKV/apitokens/d101

# Destroy is what actually removes it
vault kv destroy -versions=1 GloboKV/apitokens/d101

vault kv metadata get GloboKV/apitokens/d101

# The reference is still there, but the value is gone!
# We can delete everything by deleting the metadate too

vault kv metadata delete GloboKV/apitokens/d101

vault kv list GloboKV/apitokens

# What about using the API?

# Make sure you have the root token stored in $root_token
curl --header "X-Vault-Token: $root_token" \
  $VAULT_ADDR/v1/GloboKV/data/apitokens/d102 | jq

# If we want a specific version, we can add a query string
curl --header "X-Vault-Token: $root_token" \
  $VAULT_ADDR/v1/GloboKV/data/apitokens/d102?version=1 | jq

# We can also get at these secrets using the UI