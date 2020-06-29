module Spree
  module FrontendHelperDecorator
    def current_page(controller, action)
      page_name = controller + '/' + action
      @current_page ||= Spree::Page.find_by_name(page_name)
    end
  end
end

Spree::FrontendHelper.prepend Spree::FrontendHelperDecorator