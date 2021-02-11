# First we will install Vault, pick the steps for your OS
# If you're using a different flavor of Linux, check out
# the directions available here: https://learn.hashicorp.com/tutorials/vault/getting-started-install?in=vault/getting-started#install-vault

# MacOS

brew tap hashicorp/tap
brew install hashicorp/tap/vault

# Ubuntu

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add –
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install vault


# Now let's verify it installed successfully and is in the PATH 
# environment variable
vault version 