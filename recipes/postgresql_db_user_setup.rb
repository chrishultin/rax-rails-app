
case node['platform_family']
when 'debian'
  postgres_dev_pkgs = ['libpq-dev']
when 'rhel'
  postgres_dev_pkgs = ['postgresql-devel']
end

postgres_dev_pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

# database::postgresql needs to build the pg gem at compile time
# so make sure build essentials are installed then.
node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential::default'

include_recipe 'postgresql::server'
include_recipe 'database::postgresql'

connection_info = {
  host: 'localhost',
  username: 'postgres',
  password: node['postgresql']['password']['postgres']
}

postgresql_database node['railsstack']['db']['name'] do
  connection connection_info
  action :create
end

postgresql_database_user node['railsstack']['db']['user_id'] do
  connection connection_info
  password node['railsstack']['db']['user_password']
  action :create
end

postgresql_database_user node['railsstack']['db']['user_id'] do
  connection connection_info
  database_name node['railsstack']['db']['name']
  privileges [:all]
  action :grant
end
