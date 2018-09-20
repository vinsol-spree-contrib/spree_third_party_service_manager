module Spree
  module Admin
    class PagesController < ResourceController

      def index
        @pages = Spree::Page.all
      end

      def show
        redirect_to action: :edit
      end
      
    end
  end
end
