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

    end
  end
end
