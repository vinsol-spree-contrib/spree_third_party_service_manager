module Spree
  class Page < Spree::Base

    ## CONSTANTS
    NAME_REGEXP = /\A[a-zA-Z]+(\/[a-zA-Z]+)+/

    ## ASSOCIATIONS
    has_many :page_third_party_services
    has_many :third_party_services, through: :page_third_party_services, dependent: :destroy
    
    ## VALIDATIONS
    validates :name, presence: true, 
                     uniqueness: { case_sensitive: false }, 
                     format: { with: NAME_REGEXP,
                               allow_blank: true }

    ## CALLBACKS
    before_save :set_name_to_lowercase, if: :name_changed?

    self.whitelisted_ransackable_attributes = %w[name]


    def self.current_page(controller, action)
      page_name = controller + '/' + action
      Spree::Page.find_by_name(page_name)
    end

    def enabled_scripts
      third_party_services.enabled.pluck(:script)
    end

    private
      def set_name_to_lowercase
        name.downcase!
      end
  end
end
