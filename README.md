# preferedev/goal Homebrew tap

Install Goal:

```sh
brew tap preferedev/goal
brew install --cask goal
```

Or:

```sh
brew install --cask preferedev/goal/goal
```

## Releases

The cask downloads the macOS DMG from [preferedev/Goal releases](https://github.com/preferedev/Goal/releases):

`https://github.com/preferedev/Goal/releases/download/v<version>/Goal-<version>-mac-arm64.dmg`

On each release, bump `version` and `sha256` in [`Casks/goal.rb`](./Casks/goal.rb).

Builds are currently unsigned — the cask clears quarantine and ad-hoc re-signs after install. macOS Gatekeeper may still warn until Apple signing is configured.
