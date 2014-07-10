default['railsstack']['unicorn']['workers'] = (node['cpu']['total'].to_i * 2)
default['railsstack']['unicorn']['backlog'] = 1024

