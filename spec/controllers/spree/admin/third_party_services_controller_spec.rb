require 'spec_helper'

describe Spree::Admin::ThirdPartyServicesController, type: :controller do
  stub_authorization!

  it { is_expected.to use_before_action(:load_pages) }
  let!(:third_party_service) { create(:third_party_service) }

  describe 'GET #index' do
    before { get :index }
    it { expect(assigns(:third_party_services).count).to eq 1 }
    it { expect(assigns(:third_party_services)).to include(third_party_service) }
    it { is_expected.to render_template :index  }
  end

  describe 'GET #show' do
    before { get :show, params: { id: third_party_service.id } }
    it { is_expected.to redirect_to action: :edit }
  end

  describe 'PATCH #enable' do
    let!(:disabled_third_party_service) { create(:third_party_service, name: 'disabled service', script: 'test') }    
    
    context 'success' do
      before { patch :enable, params: {id: disabled_third_party_service.id } }
      it { expect(JSON.parse(response.body)['enabled']).to eq('Yes') }
      it { expect(response).to have_http_status(200) }
    end

    context 'fail' do
      before { allow_any_instance_of(Spree::ThirdPartyService).to receive(:enable).and_return(false) }
      before { allow_any_instance_of(Spree::ThirdPartyService).to receive_message_chain("errors.full_messages").and_return(['test error']) }
      before { patch :enable, params: {id: disabled_third_party_service.id } }
      it { expect(JSON.parse(response.body)['error']).to eq('test error') }
      it { expect(response).to have_http_status(422) }
    end
  end

  describe 'PATCH #disable' do
    let!(:enabled_third_party_service) { create(:third_party_service, name: 'disabled service', script: 'test', enabled: true) }    
    
    context 'success' do
      before { patch :disable, params: {id: enabled_third_party_service.id } }
      it { expect(JSON.parse(response.body)['enabled']).to eq('No') }
      it { expect(response).to have_http_status(200) }
    end

    context 'fail' do
      before { allow_any_instance_of(Spree::ThirdPartyService).to receive(:disable).and_return(false) }
      before { allow_any_instance_of(Spree::ThirdPartyService).to receive_message_chain("errors.full_messages").and_return(['test error']) }
      before { patch :disable, params: {id: enabled_third_party_service.id } }
      it { expect(JSON.parse(response.body)['error']).to eq('test error') }
      it { expect(response).to have_http_status(422) }
    end
  end


end
