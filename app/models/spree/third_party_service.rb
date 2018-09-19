module Spree
  class ThirdPartyService < Spree::Base
    self.table_name = 'third_party_services'

    with_options presence: true do
      validates :name, uniqueness: true
      validates :script
    end
    validates :enabled, inclusion: { in: [true, false] }

    scope :enabled, -> { where(enabled: true) }

  end
end
