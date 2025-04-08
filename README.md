# 📦 gclone

`gclone` is a lightweight Bash utility that generates a GitHub clone URL based on a concise custom input format. It's designed to save time and reduce typing when cloning repositories.

## ⚙️ Installation

1. Save the script as `gclone` in your `$PATH`, for example:

    ```bash
    mkdir -p ~/.local/bin
    cp gclone ~/.local/bin/
    chmod +x ~/.local/bin/gclone
    ```

2. Make sure `~/.local/bin` is in your `PATH` (add to `.bashrc` or `.zshrc` if needed):

    ```bash
    export PATH="$HOME/.local/bin:$PATH"
    ```

## 🚀 Usage

```bash
gclone [proto@][user/]repo

### Parameters:
- `proto`: (Optional) `ssh` or `https`. Defaults to `ssh`.
- `user`: (Optional) GitHub username. If omitted, uses the global `git config user.name`.
- `repo`: Repository name (required).

### Examples:

```bash
git clone "$(gclone my-repo)"
git clone "$(gclone zippy/my-repo)"
git clone "$(gclone https@my-repo)"
git clone "$(gclone https@zippy/my-repo)"
```

### Help:

```bash
gclone --help
```

## 📘 How it works

- If you omit the protocol, `ssh` is used by default.
- If you omit the username, `gclone` reads `user.name` from your Git config:

    ```bash
    git config --global user.name "your-github-username"
    ```

- The script returns a valid GitHub clone URL for use with `git clone`.

## 🔐 Example Outputs

| Input                  | Output URL                                  |
|-----------------------|---------------------------------------------|
| `my-repo`             | `git@github.com:<git-user>/my-repo.git`     |
| `zippy/my-repo`       | `git@github.com:zippy/my-repo.git`          |
| `https@my-repo`       | `https://<git-user>@github.com/my-repo.git` |
| `https@zippy/my-repo` | `https://zippy@github.com/my-repo.git`      |
```
