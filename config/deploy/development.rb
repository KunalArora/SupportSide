server 'dev_boc_mgt', roles: %w(web app db)
set :rails_env, 'development'
set :branch, ENV['BRANCH'] || 'master'
set :bundle_without, %w{test}.join(' ')
