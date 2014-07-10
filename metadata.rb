# Encoding: utf-8
name             'rax-rails-app'
maintainer       'Rackspace'
maintainer_email 'jason.boyles@rackspace.com'
license          'Apache 2.0'
description      'Installs/Configures railsstack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 'apt', '~> 2.4.0'
depends 'yum'
depends 'yum-epel'
depends 'mysql', '~> 5.3.6'
depends 'database', '~> 2.2.0'
depends 'sudo', '~> 2.6.0'
depends 'chruby', '~> 0.2.2'
depends 'rvm'
depends 'unicorn-ng', '~> 0.3.0'
depends 'application', '~> 4.1.4'
depends 'nginx', '~> 2.7.2'
depends 'cron', '~> 1.4.0'
depends 'chef-sugar'
depends 'application_ruby'
depends 'postgresql'
depends 'passenger_apache2'