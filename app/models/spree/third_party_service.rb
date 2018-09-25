module Spree
  class ThirdPartyService < Spree::Base

    SCRIPT_MAX_LENGTH = 65535

    with_options presence: true do
      validates :name, uniqueness: { case_sensitive: false }
      validates :script, length: { maximum: SCRIPT_MAX_LENGTH }
    end

    scope :enabled, -> { where(enabled: true) }
    
  end
end
