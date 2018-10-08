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

      def get_page_options(third_party_service, all_pages, selected_pages)
        first_option = pages_first_option(third_party_service, all_pages, selected_pages)
        all_pages.pluck(:name, :id).unshift(first_option)
      end

      def pages_first_option(third_party_service, all_pages, selected_pages)
        if(are_all_pages_selected?(all_pages, selected_pages))
          ['Remove All', 'select']
        else
          ['Select All', 'select']
        end
      end

      def are_all_pages_selected?(all_pages, selected_pages)
        all_pages.size == selected_pages.size
      end

      def get_selected_pages_ids(third_party_service)
        third_party_service.pages.map{ |page| page.id }
      end

    end
  end
end
