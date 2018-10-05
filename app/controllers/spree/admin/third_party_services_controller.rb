module Spree
  module Admin
    class ThirdPartyServicesController < ResourceController

      before_action :load_pages, only: [:new, :edit]
      before_action :load_selected_pages_ids, only: [:edit]

      def index
        params[:q] ||= {}
        params[:q][:s] ||= 'name asc'
        @search = Spree::ThirdPartyService.ransack(params[:q])
        @third_party_services = @search.result
      end

      def create
        @third_party_service = ThirdPartyService.new(third_party_service_params)
        if @third_party_service.save
          flash[:success] = flash_message_for(@third_party_service, :successfully_created)
          redirect_to location_after_save
        else
          load_pages
          get_selected_pages_ids
          render action: :new
        end
      end

      def update
        if @third_party_service.update(third_party_service_params)
          flash[:success] = flash_message_for(@third_party_service, :successfully_updated)
          redirect_to location_after_save
        else
          load_pages
          get_selected_pages_ids
          render action: :edit
        end
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
          @pages = Spree::Page.order(:name)
        end

        def load_selected_pages_ids
          @selected_pages_ids = @third_party_service.pages.pluck(:id)
        end

        def third_party_service_params
          params.require(:third_party_service).permit(:name, :enabled, :script, page_ids: [])
        end

        def get_selected_pages_ids
          @selected_pages_ids = third_party_service_params[:page_ids]
          @selected_pages_ids.delete('')
        end
    end
  end
end
