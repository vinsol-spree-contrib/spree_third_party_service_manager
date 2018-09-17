module Spree
  class ThirdPartyService < Spree::Base

    with_options presence: true do
      validates :name, uniqueness: true
      validates :script
    end
    validates :enabled, inclusion: { in: [true, false] }

    scope :enabled, -> { where(enabled: true) }

  end
end
