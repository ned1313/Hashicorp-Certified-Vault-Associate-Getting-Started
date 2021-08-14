# Allow access to all accounting data
path "accounting/data/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow access to metadata for kv2
path "accounting/metadata/*" {
    capabilities = ["list"]
}

# Deny access to privileged accounting data
path "accounting/data/apitokens/privileged*" {
    capabilities = ["deny"]
}

path "accounting/metadata/apitokens/privileged*" {
    capabilities = ["deny"]
}