module Spree
  class PageThirdPartyService < Spree::Base

    ## ASSOCIATIONS
    belongs_to :page
    belongs_to :third_party_service

    ## VALIDATIONS
    validates :page_id, uniqueness: { scope: :third_party_service_id } 
  end
end
