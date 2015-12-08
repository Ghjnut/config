log_level :info
log_location STDOUT
cache_type 'BasicFile'

home_dir = ENV['HOME'] || ENV['HOMEDRIVE']

node_name ENV['CHEF_NODE_NAME']

chef_server_url ENV['CHEF_SERVER_URL']
client_key ENV['CHEF_CLIENT_KEY']
validation_client_name 'chef-validator'
validation_key ENV['CHEF_VALIDATION_KEY']

syntax_check_cache_path "#{home_dir}/.chef/syntax_check_cache"

cache_options(:path => "#{home_dir}/.chef/checksums")

cookbook_copyright ENV['CHEF_COOKBOOK_COPYRIGHT']
cookbook_email ENV['CHEF_COOKBOOK_EMAIL']
cookbook_license ENV['CHEF_COOKBOOK_LICENSE']

cookbook_path ENV['CHEF_COOKBOOK_PATH']

editor ENV['CHEF_EDITOR']
