require 'spec_helper'

describe Admin::SecretsController do
  setup :activate_authlogic

  describe 'GET index as an admin' do
    before do
      @account = Account.create! username: 'testaccount', password: '123456', password_confirmation: '123456'
      @account.update_attribute(:is_admin, true)
      @account_session = AccountSession.create! @account
      @secret = Secret.create! secret_text: 'pssssst'
      get :index
    end
    subject { response }

    it 'should load secrets' do
      expect(assigns(:secrets)).to eq([@secret])
    end
    it { is_expected.to be_success }
    it { is_expected.to render_template('index') }
  end

  describe 'GET index as an regular user' do
    before do
      @account = Account.create! username: 'testaccount', password: '123456', password_confirmation: '123456'
      @account_session = AccountSession.create! @account
      get :index
    end
    subject { response }

    it { is_expected.to be_redirect }
  end

  describe 'GET index when not logged in' do
    before do
      @account_session = nil
      get :index
    end
    subject { response }

    it { is_expected.to be_redirect }
  end

end
