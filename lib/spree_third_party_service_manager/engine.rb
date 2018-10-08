module SpreeThirdPartyServiceManager
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_third_party_service_manager'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree_third_party_service_manager.assets.precompile' do |app|
      app.config.assets.precompile += %w[
        spree/backend/toggle_switch.css
        spree/backend/third_party_service_toggler.js
        spree/backend/third_party_service_select2.js
        spree/backend/select_all_option_manager.js
      ]
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
