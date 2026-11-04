# Whalu Homebrew tap

```sh
brew install --cask danileph/whalu/whalu
```

Whalu supports Apple silicon and Intel Macs on macOS 15 or later. Open Whalu from Applications and follow its permission setup. Whalu releases use ad-hoc signing. If macOS blocks the app, follow [Apple’s instructions for opening an unnotarized app](https://support.apple.com/102445).

Quit Whalu before upgrading.

```sh
brew upgrade --cask danileph/whalu/whalu
```

## Publish a cask update

After the latest stable [Whalu release](https://github.com/danileph/whalu/releases/latest) is published, run this from the tap checkout with an authenticated GitHub CLI.

```sh
./scripts/update-cask.sh
git diff -- Casks/whalu.rb
```

The script verifies the published universal ZIP against its SHA-256 checksum and updates the cask. Review, commit, and push the cask change to make the new version available.
