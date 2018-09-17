module Spree
  module Admin
    class ThirdPartyServicesController < ResourceController
      helper 'spree/admin/third_party_services'

      def index
        @third_party_services = Spree::ThirdPartyService.all
      end

      def show
        redirect_to action: :edit
      end

      def enable
        if @object.update(enabled: true)
          flash[:success] = flash_message_for(@object, :successfully_enabled)
        else
          flash[:error] = @object.errors.full_messages.join(', ')
        end
        redirect_to action: :index
      end

      def disable
        if @object.update(enabled: false)
          flash[:success] = flash_message_for(@object, :successfully_disabled)
        else
          flash[:error] = @object.errors.full_messages.join(', ')
        end
        redirect_to action: :index
      end
    end
  end
end
