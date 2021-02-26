# What types of things can we set on the K/V engine?
vault path-help GloboKV/

vault path-help GloboKV/config

# Why don't we check the current settings?
vault read GloboKV/config

# Let's set the max_versions to 5
vault write GloboKV/config max_versions=5
