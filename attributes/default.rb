unless node['newrelic'].nil? or node['newrelic']['license'].nil?
  default['apache_newrelic_plugin']['license'] = node['newrelic']['license']
end
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
