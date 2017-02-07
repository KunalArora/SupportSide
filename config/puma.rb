#!/usr/bin/env puma

threads 1, 6

app_path = '/opt/boc/apps/boc_support_site/current'
shared_dir = '/opt/boc/apps/boc_support_site/shared'

rails_env = 'development'
environment rails_env
daemonize true

bind "tcp://0.0.0.0:8081"
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state"

on_worker_boot do
	require 'active_record'
	ActiveRecord::Base.connection.disconnect!
end
