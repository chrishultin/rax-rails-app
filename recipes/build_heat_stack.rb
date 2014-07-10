


include_recipe "rax-rails-app::app_host_user"

include_recipe "rax-rails-app::#{node['railsstack']['db']['type']}_db_user_setup"

include_recipe "rax-rails-app::ruby_#{node['railsstack']['ruby_manager']}"

include_recipe "rax-rails-app::deploy_app"

include_recipe "rax-rails-app::app_server_#{node['railsstack']['app_server']}"
