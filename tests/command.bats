#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "post-checkout does branch checkout" {
  stub git \
    "fetch origin foo : echo Fetched foo" \
    "checkout -B foo : echo Checked out foo" \
    "branch -u origin/foo : echo Set upstream"

  export BUILDKITE_BRANCH="foo"

  run "$PWD/hooks/post-checkout"

  assert_output --partial "Fetched foo"
  assert_output --partial "Checked out foo"
  assert_output --partial "Set upstream"

#  unstub git
}
