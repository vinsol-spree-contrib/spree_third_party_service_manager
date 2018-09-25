module Spree
  module Admin
    module ThirdPartyServicesHelper
      def enabled(third_party_service)
        if third_party_service.enabled?
          'Yes'
        else
          'No'
        end
      end

      def url_to_toggle_enabled(third_party_service)
        if third_party_service.enabled?
          disable_admin_third_party_service_path(third_party_service)
        else
          enable_admin_third_party_service_path(third_party_service)
        end
      end

      def options_for_page_selector(third_party_service, all_page_options)
        if(third_party_service.pages.count == Spree::Page.count)
          first_option = ['Remove All', 'select']
        else
          first_option = ['Select All', 'select']
        end
        all_page_options.unshift(first_option)
      end

    end
  end
end
