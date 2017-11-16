server 'dev_boc_support', roles: %w(web app db)
set :rails_env, 'development'
set :branch, ENV['BRANCH'] || 'master'
set :bundle_without, %w{test}.join(' ')
