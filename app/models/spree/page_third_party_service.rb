module Spree
  class PageThirdPartyService < Spree::Base

    ## ASSOCIATIONS
    belongs_to :page_id
    belongs_to :third_party_service_id
  end
end
