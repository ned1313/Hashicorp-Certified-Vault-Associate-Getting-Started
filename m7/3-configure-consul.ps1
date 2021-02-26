# You are going to need the consul binary to follow along here.
# You can get it by going to https://www.consul.io/downloads

# We are going to start up a basic instance of Consul and 
# get a token with permissions to generate new token.
# You don't need to know much about Consul aside from the 
# fact it uses tokens for authentication and authorization
# just like Vault.

# Create a data subdirectory in m7
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
vault path-help consul/

vault path-help consul/config/access

vault write consul/config/access address="http://127.0.0.1:8500" token=$env:CONSUL_HTTP_TOKEN



# And add a role to provision tokens with a ttl of 1 hour and a max of 2 hours

vault path-help consul/roles/web

vault write consul/roles/web name=web policies=web ttl=3600 max_ttl=7200

# Now how do we use this role to get a token? By using the creds path

vault path-help consul/creds/web

vault read consul/creds/web

# Check on the consul side and we can see the token created

consul acl token list -format=json | ConvertFrom-Json | select AccessorID
