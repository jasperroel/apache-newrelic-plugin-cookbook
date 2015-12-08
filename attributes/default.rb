## Setting the java environment
default['java']['install_flavor'] = 'openjdk'  # this is the default, but let's be EXPLICIT!
default['java']['jdk_version'] = '7'

default['apache_newrelic_plugin']['license'] = '<your license>'
## Setting the plugin default (mostly commented out because the plugin also assumes the same defaults)
default['apache_newrelic_plugin']['agents'] = [{
 :name => 'my-hostname',
 :protocol => 'http',
 :host => 'localhost',
 :port => 8080,
 :mod_status_url => '/server-status?auto',
 :connection_timeout => 15000,
 :read_timeout => 15000
},
{
 :name => 'my-hostname2',
 :protocol => 'https',
 :host => 'localhost',
 :port => 8080,
 :mod_status_url => '/server-status?auto',
 :connection_timeout => 15000,
 :read_timeout => 15000
}
]
