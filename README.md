# apache-newrelic-plugin

This plugin allows you to monitor 1 or more Apache instances (2.2 or 2.4, as long as they support mod-status).

Requires Java and a valid New Relic license

## Atributes


`node['newrelic']['license']` - Your New Relic license (defaults to `node['newrelic']['license']`)

`node['apache_newrelic_plugin']['agents']` - A list of Apache instances you want to monitor. Format below

## Agent node format

```ruby
[
 {
  :name => 'my-hostname',
  :protocol => 'http',
  :host => 'localhost',
  :port => 8080,
  :mod_status_url => '/server-status?auto',
  :connection_timeout => 15000,
  :read_timeout => 15000
 },
:name => 'my-hostname-2',
  :protocol => 'https',
  :host => 'localhost',
  :port => 8080,
  :mod_status_url => '/server-status?auto',
  :connection_timeout => 15000,
  :read_timeout => 15000
 }
]
```

Default values for Agents:
protocol: http
port: 80
mod_status_url: /server-status?auto
connection_timeout: 15000 (15 seconds)
read_timeout: 15000 (15 seconds)

The only requirement is to set a hostname for a valid agent:
```ruby
[
 {
  :host => 'localhost',
 }
]```
