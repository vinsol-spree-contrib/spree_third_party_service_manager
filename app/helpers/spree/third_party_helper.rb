module Spree::ThirdPartyHelper
  def current_page(controller, action)
    page_name = controller + '/' + action
    @current_page ||= Spree::Page.find_by_name(page_name)
  end

  module_function :current_page
end