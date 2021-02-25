# First of all we are going to start Vault in development mode
vault server -dev

# Now set your Vault address environment variable
export VAULT_ADDR=http://127.0.0.1:8200

# Set the root token variable
root_token=ROOT_TOKEN_VALUE

# And log into Vault using the root token
vault login $root_token

# Let's first see which secrets engines are enabled

vault secrets list

# Now let's get our secrets engines enabled
# We'll start with the enabling the K/V engine

vault secrets enable -path=GloboKV -version=2 kv

# Maybe we want to configure some settings for GloboKV

vault path-help /sys/mounts/GloboKV

vault secrets tune -description="Globomantics K/V version 2" GloboKV

# Awesome, now let's go enable Consul through the UI

