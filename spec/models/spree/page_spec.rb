require 'spec_helper'

RSpec.describe Spree::Page, type: :model do

  describe 'Associations' do
    it { is_expected.to have_many(:page_third_party_services) }
    it { is_expected.to have_many(:third_party_services).through(:page_third_party_services) }
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

  describe '.get_enabled_scripts' do
    it { expect(Spree::Page).to respond_to(:get_enabled_scripts) }

    let!(:page_with_third_party_services) { create(:page_with_third_party_services, name: 'tests/index') }
    
    it 'return enabled scripts'do
      enabled_scripts = page_with_third_party_services.third_party_services.enabled.pluck(:script)
      expect(Spree::Page.get_enabled_scripts('spree/tests', 'index')).to eq(enabled_scripts)
    end
  end

end
