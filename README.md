# Kshan Homebrew tap

[Kshan](https://kshan.io) is a background time tracker with a focus quality score. This tap
installs the macOS app:

```bash
brew install --no-quarantine psycodex/tap/kshan
```

`--no-quarantine` lets the app open on first launch: Kshan is not yet notarized by Apple, so
macOS otherwise blocks it until you allow it under System Settings → Privacy & Security →
Open Anyway.

Kshan updates itself in-app afterwards. `brew uninstall --zap kshan` removes it together with
its local data.

The cask is generated and pushed by Kshan's release pipeline, so it is not edited by hand here.
