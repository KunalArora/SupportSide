require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BocSupportSite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # HTTP headers that are set by default in each response
    config.action_dispatch.default_headers.merge!({
      'X-UA-Compatible' => 'IE=edge',
      'Cache-Control' => 'no-cache, no-store, max-age=0, must-revalidate',
      'Pragma' => 'no-cache',
      'Expires' => 'Fri, 01 Jan 1990 00:00:00 GMT'
    })

    config.autoload_paths += Dir["#{config.root}/app/models/**/"]
  end
end
