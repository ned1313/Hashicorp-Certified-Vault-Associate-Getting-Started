# First we will install the Vault binary using Chocolatey.
# You'll need to run this from an elevated PowerShell prompt
choco install vault -y

# Now let's verify it installed successfully and is in the PATH 
# environment variable
vault version 