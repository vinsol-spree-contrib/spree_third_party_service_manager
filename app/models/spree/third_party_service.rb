module Spree
  class ThirdPartyService < Spree::Base

    with_options presence: true do
      validates :name, uniqueness: { case_sensitive: false }
      validates :script, length: { maximum: 65535 }
    end

  end
end
