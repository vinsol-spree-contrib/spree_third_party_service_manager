module Spree
  class Page < Spree::Base

    ## ASSOCIATIONS
    has_many :page_third_party_services
    has_many :third_party_services, through: :page_third_party_services
    
    ## VALIDATIONS
    validates :name, presence: true, uniqueness: true
    validates :name, format: { with: /\A[a-zA-Z]+\/[a-zA-Z]+\z/ }, allow_blank: true

    ## CALLBACKS
    before_validation :set_name_to_lowercase

    private
      def set_name_to_lowercase
        self.name.downcase!
      end
  end
end
