module Spree
  module Admin
    class ThirdPartyServicesController < ResourceController

      before_action :load_pages, only: [:new, :edit]

      def index
        params[:q] ||= {}
        params[:q][:s] ||= 'name asc'
        @search = Spree::ThirdPartyService.ransack(params[:q])
        @third_party_services = @search.result
      end

      def show
        redirect_to action: :edit
      end

      def enable
        if @third_party_service.enable
          render json: { enabled: 'Yes' }, status: 200
        else
          render json: { error: @third_party_service.errors.full_messages.join(', ') }, status: 422
        end
      end

      def disable
        if @third_party_service.disable
          render json: { enabled: 'No' }, status: 200
        else
          render json: { error: @third_party_service.errors.full_messages.join(', ') }, status: 422
        end
      end

      private
        def load_pages
          @pages = Spree::Page.order(:name).pluck(:name, :id)
        end
    end
  end
end
