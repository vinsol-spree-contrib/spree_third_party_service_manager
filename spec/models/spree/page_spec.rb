require 'spec_helper'

RSpec.describe Spree::Page, type: :model do

  describe 'Associations' do
    it { is_expected.to have_many(:page_third_party_services) }
    it { is_expected.to have_many(:third_party_services).through(:page_third_party_services).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it 'format' do
      expect(Spree::Page.validators_on(:name).any? { |validator| validator.is_a?(ActiveModel::Validations::FormatValidator) && 
          validator.options == {:with=>Spree::Page::NAME_REGEXP, allow_blank: true} }).to be true
    end
  end

  describe 'Callbacks' do
    it { is_expected.to callback(:set_name_to_lowercase).before(:save) }
  end

  describe '.whitelisted_ransackable_attributes' do
    it { expect(Spree::Page).to respond_to(:whitelisted_ransackable_attributes=) }
    it { expect(Spree::Page.whitelisted_ransackable_attributes).to include('name') }
  end

  describe '#enabled_scripts' do
    it { is_expected.to respond_to(:enabled_scripts) }

    let!(:page_with_third_party_services) { create(:page_with_third_party_services, name: 'tests/index') }
    
    it 'returns array of enabled scripts'do
      enabled_scripts = page_with_third_party_services.enabled_scripts
      expect(enabled_scripts.size).to eq(1)
      expect(enabled_scripts.first).to eq('console.log("enabled testService2")')
    end
  end

end
