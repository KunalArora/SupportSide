# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'boc_support_site'
set :repo_url, 'git@github.ap.brothergroup.net:boc/boc_support_site.git'
set :rsync_with_submodules, false
set :bundle_env_variables, {nokogiri_use_system_libraries: 1}
set :bundle_bin_stubs, nil
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/opt/boc/apps/#{fetch(:application)}"
#set :deploy_via, :rsync_with_remote_cache

# Default value for :scm is :git
#set :scm, :rsync
set :branch, 'master'
set :stages, %w(development staging production)
#set :rsync_options, %w[--recursive --delete --delete-excluded --exclude .git*]
# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'db/db_support_site')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
#set :default_env, { path: "/opt/ruby/bin:$PATH" }
#set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH"}
# Default value for keep_releases is 5
set :keep_releases, 5

set :puma_conf, "#{shared_path}/config/puma.rb"

set :default_env, {
  'RAILS_RELATIVE_URL_ROOT' => '/boc/support'
}
namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

after 'deploy', 'deploy:restart'
after 'deploy', 'deploy:cleanup'
