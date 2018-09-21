Spree::FrontendHelper.module_eval do
  def current_pages_third_party_scripts(controller, action)
    scripts = Spree::Page.find_by_name(controller.gsub('spree/', '') + '/' + action).try(:third_party_services).try(:enabled).try(:pluck, :script)
    if scripts.present?
      scripts
    else
      []
    end
  end
end
