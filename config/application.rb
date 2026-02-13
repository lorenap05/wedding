require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Wedding
  class Application < Rails::Application
    config.load_defaults 7.1
    config.time_zone = "America/Sao_Paulo"
    config.i18n.default_locale = :'pt-BR'
  
 # Needed for tunneled dev hosts (e.g. github.dev) where browser Origin can be localhost
  # while base_url is the forwarded public domain.
  config.action_controller.forgery_protection_origin_check = false
  end
end
