module Spree
  class Page < Spree::Base

    ## ASSOCIATIONS
    has_many :page_third_party_services
    has_many :third_party_services, through: :page_third_party_services
    
    ## VALIDATIONS
    validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\/[a-zA-Z]+/,
                                                                 allow_blank: true }

    ## CALLBACKS
    before_validation :set_name_to_lowercase


    def self.get_enabled_scripts(controller, action)
      page_name = self.get_page_name(controller, action)
      scripts = Spree::Page.find_by_name(page_name).try(:third_party_services).try(:enabled).try(:pluck, :script)
      if scripts.present?
        scripts
      else
        []
      end
    end

    private
      def set_name_to_lowercase
        self.name.downcase!
      end

      def self.get_page_name(controller, action)
        controller.gsub('spree/', '') + '/' + action
      end
  end
end
