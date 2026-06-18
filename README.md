# Homebrew tap for Agix AOS

Install the Agix AOS — the `agix` CLI and agent fleet:

```sh
brew tap blewis-maker/agix
brew install agix-aos
```

Then:

```sh
agix --version
agix agent list
```

## What gets installed

The Agix AOS runtime (the `agix` CLI + the agent fleet + libraries + vendored
production dependencies) installed under Homebrew's `libexec`, run by `node`, with
`agix` exposed on your `PATH`. State and config live in `~/.config/agix` and
`~/.cache/agix`.

## License

Apache-2.0.
