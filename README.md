# homebrew-gitbar

Homebrew tap for [GitBar](https://github.com/patel-rushi/Gitbar) — a macOS menu bar app that surfaces the GitHub notifications that matter.

## Install

```bash
brew install --cask patel-rushi/gitbar/gitbar
```

Or tap first, then install:

```bash
brew tap patel-rushi/gitbar
brew install --cask gitbar
```

## Update

```bash
brew upgrade --cask gitbar
```

GitBar also updates itself in-app, so you'll usually be prompted inside the app when a new version is available.

## Uninstall

```bash
brew uninstall --cask gitbar
```

To also remove local data:

```bash
brew uninstall --zap --cask gitbar
```

## Notes

- Apple Silicon (arm64) only.
- The cask is updated automatically when a new GitBar release is published.
