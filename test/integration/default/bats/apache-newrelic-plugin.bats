@test "New Relic config file is rolled out" {
  run [ -f /opt/apache-newrelic-plugin/config/newrelic.json ]
  [ "$status" -eq 0 ]
}


@test "New Relic plugin config file is rolled out" {
  run [ -f /opt/apache-newrelic-plugin/config/plugin.json ]
  [ "$status" -eq 0 ]
}
