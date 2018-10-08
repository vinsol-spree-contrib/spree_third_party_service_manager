require 'spec_helper'

RSpec.describe Spree::PageThirdPartyService, type: :model do

  describe 'Associations' do
    it { is_expected.to belong_to(:third_party_service) }
    it { is_expected.to belong_to(:page) }
  end

  describe 'Validations' do
    it { is_expected.to validate_uniqueness_of(:page_id).scoped_to(:third_party_service_id) }
  end

end
