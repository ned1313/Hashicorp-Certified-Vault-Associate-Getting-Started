# First of all we are going to start Vault in development mode
vault server -dev

# Now set your Vault address environment variable
$env:VAULT_ADDR="http://127.0.0.1:8200"

# And log into Vault using the root token
vault login 

# First let's see what auth methods are avilable now
vault auth list

# Cool, now let's enable our first auth method using userpass
vault auth enable userpass

# And we'll also enable AppRole, but we'll do it using the UI
# Open your browser to http://127.0.0.1:8200
# We are going to mount it at the path GloboAppRole

# Now let's check the list of auth methods again
vault auth list

# Oh no! We forgot to add descriptions! Better take care of that
vault auth tune -description="Globomantics Userpass" userpass/

vault auth tune -description="Globomantics AppRole" GloboAppRole/

vault auth list

# Much better! Now we can configure our two auth methods in step 2