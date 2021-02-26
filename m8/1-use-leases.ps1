# First of all we are going to start Vault in development mode
vault server -dev

# Now set your Vault address environment variable
$env:VAULT_ADDR="http://127.0.0.1:8200"

# Set the root token variable
$root_token="ROOT_TOKEN_VALUE"

# And log into Vault using the root token
vault login $root_token

# Re-enable consul secrets engine
vault secrets enable consul

# Get consul up and running

# Create a data subdirectory in m8
mkdir data

# Launch consul server instance
consul agent -bootstrap -config-file="consul-config.hcl" -bind="127.0.0.1"

# From a separate terminal window run the following
consul acl bootstrap

# Set CONSUL_HTTP_TOKEN to SecretID

# Windows
$env:CONSUL_HTTP_TOKEN="SECRETID_VALUE"

# Next we have to create a policy and role for new tokens
# that Vault will generate on Consul

consul acl policy create -name=web -rules @web-policy.hcl

# Now we'll configure out Consul secrets engine
vault write consul/config/access address="http://127.0.0.1:8500" token=$env:CONSUL_HTTP_TOKEN

vault write consul/roles/web name=web policies=web ttl=3600 max_ttl=7200

# And finally generate a bunch of leases to work with

vault read consul/creds/web

# Let's renew one of the leases for 30 minutes

vault lease renew -increment=30m LEASE_ID

# Now get the properties of the lease

vault write sys/leases/lookup lease_id=LEASE_ID

# What if we exceed the lease max ttl?

vault lease renew -increment=120m LEASE_ID

# Now we can try and revoke one of the leases
# First we'll get a list of active leases

vault list sys/leases/lookup/consul/creds/web/

# Now revoke the lease

vault lease revoke LEASE_ID

# Confirm our lease is gone

# What if we want to revoke all of them? Prefix time

vault lease revoke -prefix consul/creds/web/

# Confirm that all the leases are gone