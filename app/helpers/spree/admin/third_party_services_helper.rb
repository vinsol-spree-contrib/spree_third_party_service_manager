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

      def link_to_toggle_enabled(service)
        if service.enabled?
          link_to 'Disable', disable_admin_third_party_service_path(service), method: :post, class: 'btn btn-sm btn-warning'
        else
          link_to 'Enable', enable_admin_third_party_service_path(service), method: :post, class: 'btn btn-sm btn-success'
        end
      end

    end
  end
end
