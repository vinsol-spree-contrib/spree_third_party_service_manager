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

      def get_page_options(third_party_service, pages, selected_pages_ids)
        first_option = pages_first_option(third_party_service, pages, selected_pages_ids)
        pages.pluck(:name, :id).unshift(first_option)
      end

      def pages_first_option(third_party_service, pages, selected_pages_ids)
        if(selected_pages_ids.try(:size) == pages.size)
          ['Remove All', 'select']
        else
          ['Select All', 'select']
        end
      end

    end
  end
end
