# Find line like "==> Upgrading 8 outdated packages:"
# Replace "Upgrading" with "Upgraded"
/Upgrading [[:digit:]]+ outdated/s/Upgrading/Upgraded/p

# Find line like "==> Upgrading cmake"
# Leave only package name, print in bold text
/Upgrading/s/^.*Upgrading (.*)/\x1b[1m\1\x1b[0m/p

# Find and print line like "  3.22.1 -> 3.22.2"
/^[[:space:]]+[[:digit:].]+/p
