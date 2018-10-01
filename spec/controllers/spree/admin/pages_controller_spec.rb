require 'spec_helper'

describe Spree::Admin::PagesController, type: :controller do
  stub_authorization!

  let!(:page) { create(:page) }
  describe 'GET #index' do
    before { get :index }
    it { expect(assigns(:pages).count).to eq 1 }
    it { expect(assigns(:pages)).to include(page) }
    it { is_expected.to render_template :index  }
  end

  describe 'GET #show' do
    before { get :show, params: { id: page.id } }
    it { is_expected.to redirect_to action: :edit }
  end
end
