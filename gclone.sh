#!/bin/bash

# Show help
if [[ "$1" == "--help" || -z "$1" ]]; then
  echo "Usage: $(basename "$0") [proto@][user/]repo"
  echo
  echo "Clones a GitHub repo using SSH or HTTPS."
  echo
  echo "Examples:"
  echo "  gclone my-repo"
  echo "  gclone zippy/my-repo"
  echo "  gclone https@my-repo"
  echo "  gclone https@zippy/my-repo"
  exit 0
fi

input="$1"

# Defaults
proto="ssh"
user=""
repo=""

# Extract protocol
if [[ "$input" == *@* ]]; then
  proto="${input%%@*}"
  input="${input#*@}"
fi

# Extract user and repo
if [[ "$input" == */* ]]; then
  user="${input%%/*}"
  repo="${input#*/}"
else
  repo="$input"
fi

# Get user from git config if not specified
if [[ -z "$user" ]]; then
  user="$(git config --global user.name 2>/dev/null)"
  if [[ -z "$user" ]]; then
    echo "Error: No user specified and 'user.name' is not set in global git config." >&2
    exit 1
  fi
fi

# Build clone URL
if [[ "$proto" == "ssh" ]]; then
  echo "git@github.com:$user/$repo.git"
elif [[ "$proto" == "https" ]]; then
  echo "https://$user@github.com/$repo.git"
else
  echo "Error: Unsupported protocol '$proto'. Use 'ssh' or 'https'." >&2
  exit 1
fi
