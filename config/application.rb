require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Solution
  class Application < Rails::Application
    config.load_defaults 7.0
    config.eager_load_paths += Dir[Rails.root.join('app/contexts/**/**.rb')].each { |rb| require rb }
    config.eager_load_paths += Dir[Rails.root.join('app/contexts/**/**/**.rb')].each { |rb| require rb }
    config.eager_load_paths += Dir[Rails.root.join('lib/**/**.rb')].each { |rb| require rb }

    config.eager_load_paths += Dir[Rails.root.join('lib/**/**/**.rb')].each { |rb| require rb }
    config.cache_store = :redis_cache_store
    Mapkick.options[:access_token] = Rails.application.credentials.config[:access_token]
    config.action_controller.perform_caching = true
  end
end
