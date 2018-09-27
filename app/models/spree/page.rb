module Spree
  class Page < Spree::Base

    ## CONSTANTS
    NAME_REGEXP = /\A[a-zA-Z]+\/[a-zA-Z]+/

    ## ASSOCIATIONS
    has_many :page_third_party_services
    has_many :third_party_services, through: :page_third_party_services
    
    ## VALIDATIONS
    validates :name, presence: true, 
                     uniqueness: { case_sensitive: false }, 
                     format: { with: NAME_REGEXP,
                               allow_blank: true }

    ## CALLBACKS
    before_save :set_name_to_lowercase, if: :name_changed?

    self.whitelisted_ransackable_attributes = %w[name]

    def self.get_enabled_scripts(controller, action)
      page_name = self.get_page_name(controller, action)
      scripts = Spree::ThirdPartyService.enabled.joins(:pages).where(spree_pages: { name: page_name }).pluck(:script)
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
