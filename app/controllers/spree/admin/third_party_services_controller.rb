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
          render json: { enabled: 'Yes' }, status: 200
        else
          render json: { error: @object.errors.full_messages.join(', ') }, status: 422
        end
      end

      def disable
        if @object.update(enabled: false)
          render json: { enabled: 'No' }, status: 200
        else
          render json: { error: @object.errors.full_messages.join(', ') }, status: 422
        end
      end
    end
  end
end
