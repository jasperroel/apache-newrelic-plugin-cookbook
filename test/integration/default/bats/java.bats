#!/usr/bin/env bats

@test "java is found in PATH" {
  run which java
  [ "$status" -eq 0 ]
}
