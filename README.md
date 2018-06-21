# Reattach HEAD Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) for
reattaching HEAD to the branch being built.

## Usage

```yaml
steps:
  - label:   "Some command that analyses the current git branch"
    command: git rev-parse --abbrev-ref HEAD
    plugins:
      vital-software/reattach-head#0.0.1: {}
```

## Configuration

None yet.

## License

MIT (see [LICENSE](LICENSE))
