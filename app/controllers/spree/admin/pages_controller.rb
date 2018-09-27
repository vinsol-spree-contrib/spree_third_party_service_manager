module Spree
  module Admin
    class PagesController < ResourceController

      def index
        params[:q] ||= {}
        params[:q][:s] ||= 'name asc'
        @search = Spree::Page.ransack(params[:q])
        @pages = @search.result
      end

      def show
        redirect_to action: :edit
      end
    end
  end
end
