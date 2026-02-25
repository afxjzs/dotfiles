# Dotfiles

Personal shell and Git configuration for macOS. Use as-is or cherry-pick what you need.

## What's included

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config: [oh-my-zsh](https://oh-my-zsh.sh/) (avit theme), aliases, functions, PATH/runtime setup |
| `.zshrc.local.example` | Template for machine-specific and private config (see below) |
| `.gitconfig` | Git settings: color UI, LFS filter, large postBuffer |
| `install.sh` | Backs up existing files and copies dotfiles into `$HOME` |

## Prerequisites

- **macOS**
- **Zsh** (default on macOS)
- **[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)** — required for `.zshrc`:
  ```sh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

Optional (`.zshrc` will work without them; relevant blocks are no-ops if missing):

- **Node**: [nvm](https://github.com/nvm-sh/nvm)
- **Python**: [pyenv](https://github.com/pyenv/pyenv)
- **Ruby**: [chruby](https://github.com/postmodern/chruby) (Homebrew: `brew install chruby ruby-install`)
- **Conda**: [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- **pnpm** / **bun** (for the `p()` package-manager helper)
- **VS Code** in PATH (for `EDITOR=code`)

## Installation

### Option A: Install script (recommended)

From the repo directory:

```sh
./install.sh
source ~/.zshrc
```

The script backs up existing `~/.zshrc` (and `~/.zshrc.local` if present) with a timestamp, then copies the repo files into `$HOME`. It does **not** install `.gitconfig` so you can keep or set your own identity.

### Option B: Manual symlinks

```sh
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig
source ~/.zshrc
```

### Git config

If you use the included `.gitconfig`, set your name and email (the file in the repo has placeholder values):

```sh
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Or edit `~/.gitconfig` after copying/symlinking.

## `.zshrc.local` — machine-specific and private config

`.zshrc` sources `~/.zshrc.local` at the end if it exists. Use it for:

- **Secrets** — API keys, tokens, env vars you don’t want in the repo  
- **Machine-specific paths** — extra `PATH`, `JAVA_HOME`, Android SDK, etc.  
- **Local aliases** — e.g. app paths, project shortcuts  

`.zshrc.local` is **gitignored** and never committed.

### Setting up `.zshrc.local`

1. Copy the example into your home directory:
   ```sh
   cp .zshrc.local.example ~/.zshrc.local
   ```
2. Edit `~/.zshrc.local` and add your secrets, paths, and aliases. Remove or comment out anything you don’t use.

The example includes commented sections for things like Postgres, Java, Android SDK, Flutter, and Google Cloud; uncomment and adjust as needed.

After changes, either open a new terminal or run:

```sh
source ~/.zshrc
```

## Highlights from `.zshrc`

- **Theme**: oh-my-zsh **avit**
- **Editor**: `EDITOR=code` (VS Code)
- **Package manager helper** `p()`: runs `bun` / `pnpm` / `yarn` / `npm` based on lockfiles in the current directory (default `pnpm`)
- **nvm + `.nvmrc`**: auto-switches Node version when entering a directory with `.nvmrc`
- **Plugins**: git, macos, ruby, golang, gem, history, history-substring-search, zsh-syntax-highlighting, brew, nanoc
- **Aliases**: `ll`, `gs`, `gac`, `gpr`, `cdf` (cd to Finder front window), `extract`, `trash`, `mcd`, and many file/network/process helpers

## Updating

Pull the repo, then re-run the install script or re-copy/symlink the files you use. Your `~/.zshrc.local` is never overwritten by the repo.
