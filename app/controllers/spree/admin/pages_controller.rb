module Spree
  module Admin
    class PagesController < ResourceController

      def show
        redirect_to action: :edit
      end
      

      protected

        def collection
          params[:q] ||= {}
          params[:q][:s] ||= 'name asc'
          @search = Spree::Page.ransack(params[:q])
          @pages = @search.result
        end
    end
  end
end
