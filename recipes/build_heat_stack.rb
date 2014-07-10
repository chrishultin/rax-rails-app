####
# fix up attributes that were passed as Heat parameters

# node['railsstack']['rails']['rake_tasks'] comes in as a string,
# but needs to be a list

node.set['railsstack']['rails']['rake_tasks'] = node['railsstack']['rails']['rake_tasks'].split(' ')

####

if platform_family?('debian')
  # required for Ruby >= v2
  package 'libssl-dev' do
    action :install
  end
end

include_recipe "rax-rails-app::app_host_user"

include_recipe "rax-rails-app::#{node['railsstack']['db']['type']}_db_user_setup"

include_recipe "rax-rails-app::ruby_#{node['railsstack']['ruby_manager']}"

include_recipe "rax-rails-app::deploy_app"

include_recipe "rax-rails-app::app_server_#{node['railsstack']['app_server']}"
