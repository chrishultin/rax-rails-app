####
# fix up attributes that were passed as Heat parameters

# When passed as a parameter from Heat, node['railsstack']['rails']['rake_tasks']
# comes in as a string of space-separated words, but needs to be a list.
node.set['railsstack']['rails']['rake_tasks'] = node['railsstack']['rails']['rake_tasks'].split(' ')

# Heat parameters can't be nil, only an empty string, so convert an
# empty string to nil so logic works in a more Ruby-like fashion
if node['railsstack']['rails']['db_adapter'].empty?
  node.set['railsstack']['rails']['db_adapter'] = nil
end

####

if platform_family?('debian')
  # required for Ruby >= v2.0.0
  package 'libssl-dev' do
    action :install
  end
end

include_recipe "rax-rails-app::app_host_user"

include_recipe "rax-rails-app::ruby_#{node['railsstack']['ruby_manager']}"

include_recipe "rax-rails-app::deploy_app"

include_recipe "rax-rails-app::app_server_#{node['railsstack']['app_server']}"
