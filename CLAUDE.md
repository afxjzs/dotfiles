# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository containing shell and git configuration for macOS. There is no build system, test suite, or package manager — changes are applied by symlinking or copying files to `$HOME`.

## Files

- `.zshrc` — Zsh configuration using oh-my-zsh (`avit` theme). Contains aliases, shell functions, and PATH/env setup.
- `.gitconfig` — Git configuration with git-lfs enabled.

## Key Patterns in .zshrc

**Package manager helper (`p()`)**: Detects the right package manager by checking for lock files in order: `bun.lockb` → `pnpm-lock.yaml` → `yarn.lock` → `package-lock.json`, defaulting to `pnpm`.

**Runtime managers configured**: nvm (Node), pyenv (Python), chruby (Ruby, defaulting to 3.0.3), conda (miniconda3), pnpm, bun.

**oh-my-zsh plugins**: `git macos ruby golang gem history history-substring-search zsh-syntax-highlighting brew nanoc`

**Editor**: `$EDITOR` is set to `code` (VS Code).

## Applying Changes

Copy or symlink files to `$HOME`:
```sh
cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
# or
ln -sf $(pwd)/.zshrc ~/.zshrc
```

Reload the shell after editing `.zshrc`:
```sh
source ~/.zshrc
```
