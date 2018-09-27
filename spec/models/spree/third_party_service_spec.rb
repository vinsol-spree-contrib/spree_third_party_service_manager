require 'spec_helper'

RSpec.describe Spree::ThirdPartyService, type: :model do

  let!(:enabled_third_party_service) { create(:third_party_service,  name: 'enabled service', enabled: true) }
  let!(:disabled_third_party_service) { create(:third_party_service, name: 'disabled service') }
  
  describe 'Associations' do
    it { is_expected.to have_many(:page_third_party_services) }
    it { is_expected.to have_many(:pages).through(:page_third_party_services) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_presence_of(:script) }
    it { is_expected.to validate_length_of(:script).is_at_most(Spree::ThirdPartyService::SCRIPT_MAX_LENGTH) }
  end

  describe 'Scopes' do
    context '.enabled' do
      it { expect(Spree::ThirdPartyService).to respond_to(:enabled) }
      
      
      subject { Spree::ThirdPartyService.enabled }
      
      it { is_expected.to include(enabled_third_party_service) }
      it { is_expected.to_not include(disabled_third_party_service) }
    end
  end

  describe '#enable' do
    it { is_expected.to respond_to(:enable) }

    it 'is expected to enable disabled third_party_service' do
      disabled_third_party_service.enable
      expect(disabled_third_party_service.enabled).to be(true)
    end
  end

  describe '#disable' do
    it { is_expected.to respond_to(:disable) }

    it 'is expected to disable enabled third_party_service' do
      enabled_third_party_service.disable
      expect(enabled_third_party_service.enabled).to be(false)
    end
  end

end
