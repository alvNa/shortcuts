# Replace this path if the aliases are stored elsewhere.
alias_dir="$HOME/alias"

if [ ! -d "$alias_dir" ]; then
    printf 'shortcuts: alias directory not found: %s\n' "$alias_dir" >&2
else
    source "$alias_dir/compress_alias.sh"
    source "$alias_dir/git_alias.sh"
    source "$alias_dir/maven_alias.sh"
    source "$alias_dir/docker_alias.sh"
    source "$alias_dir/utils_alias.sh"
fi
