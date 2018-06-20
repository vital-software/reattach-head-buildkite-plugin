#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment to enable stub debug output:
export BUILDKITE_AGENT_REATTACH_HEAD_DEBUG=/dev/tty

@test "Environment runs a checkout" {
  stub git \
    "checkout -B ${BUILDKITE_BRANCH} : echo foo-123"

  run "$PWD/hooks/environment"

  assert_output --partial "foo-123"

  unstub git
}
