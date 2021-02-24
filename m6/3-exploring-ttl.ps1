# We are going to try setting max ttl from the mount and user
# Start by enabling the max ttl for userpass to 33 days (776h)

# Enable userpass auth method
vault auth enable -max-lease-ttl=776h userpass

# Now we are going to try and configure a user with a great max ttl of 784h
# Note: Vault will let you do this, but it won't honor it.
vault write auth/userpass/users/ned token_max_ttl=2822400 password=tacos

# Let's try logging in as Ned and renewing our token for 34 days (784h)
vault login -method=userpass username=ned

vault token renew -increment=784h

# If we changed the max TTL on the mount to 784h, then Vault would honor 
# the value set at the user level. I leave this as an exercise for you.

# Now we can revoke our own token if we're done with our work

vault token revoke -self

vault token lookup