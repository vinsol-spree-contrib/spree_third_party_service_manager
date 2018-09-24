module Spree
  module Admin
    class ThirdPartyServicesController < ResourceController

      def index
        @third_party_services = Spree::ThirdPartyService.all
      end

      def show
        redirect_to action: :edit
      end

      def enable
        if @object.update(enabled: true)
          render json: { message: flash_message_for(@object, :successfully_enabled), 
                         id: @object.id, 
                         toggle_url: disable_admin_third_party_service_path(@object), 
                         enabled: 'Yes' }, status: 200
        else
          render json: { error: @object.errors.full_messages.join(', ') }, status: 422
        end
      end

      def disable
        if @object.update(enabled: false)
          render json: { message: flash_message_for(@object, :successfully_disabled), 
                         id: @object.id, 
                         toggle_url: enable_admin_third_party_service_path(@object), 
                         enabled: 'No' }, status: 200
        else
          render json: { error: @object.errors.full_messages.join(', ') }, status: 422
        end
      end
    end
  end
end
