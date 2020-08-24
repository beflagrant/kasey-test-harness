require 'rails_helper'

RSpec.describe Kasey::ApplicationController, type: :controller do
  controller do
    rescue_from Kasey::ConfigurationError, with: :render_exception
    before_action :authenticate!

    def index
      if has_access?(authenticated_user, :kase_doesnt_matter)
        head :ok
      else
        head :not_found
      end
    end

    private

    def authenticate_me
      return :user
    end

    def authorize_me(u,k)
      u == :user
    end

    def authenticated_user
      return :user
    end

    def render_exception
      head :not_implemented
    end
  end

  describe 'when Kasey is configured' do
    before(:all) do
      initialize_kasey
    end

    after(:all) do
      initialize_kasey
    end

    context 'with a Symbol as the authenticate_function' do
      it 'works' do
        Kasey.configuration.authenticate_function = :authenticate_me

        get :index
        expect(response).to be_successful
      end
    end

    context 'with a Proc as the authenticate_function' do
      it 'works' do
        Kasey.configuration.authenticate_function = ->() { :user }

        get :index
        expect(response).to be_successful
      end
    end

    context 'with a Symbol as the authenticated_user_function' do
      it 'works' do
        Kasey.configuration.authenticated_user_function = :authenticated_user

        get :index
        expect(response).to be_successful
      end
    end

    context 'with a Proc as the authenticated_user_function' do
      it 'works' do
        Kasey.configuration.authenticated_user_function = ->() { :user }

        get :index
        expect(response).to be_successful
      end
    end

    context 'with a Symbol as the authorize_function' do
      it 'works' do
        Kasey.configuration.authorize_function = :authorize_me

        get :index
        expect(response).to be_successful
      end
    end

    context 'with a Proc as the authorize_function' do
      it 'works' do
        Kasey.configuration.authorize_function = ->(u,k) { u == :user }

        get :index
        expect(response).to be_successful
      end
    end
  end

  describe 'when Kasey is misconfigured' do
    context 'when .authenticate_function is busted' do
      it 'raises an exception' do
        Kasey.configuration.authenticate_function = nil

        get :index
        expect(response).to have_http_status(:not_implemented)
       end
    end

    context 'when #authorize_function is busted' do
      it 'raises an exception' do
        Kasey.configuration.authorize_function = 1234567

        get :index
        expect(response).to have_http_status(:not_implemented)
      end
    end

    context 'when .authenticated_user_function is busted' do
      it 'raises an exception' do
        Kasey.configuration.authenticated_user_function = 'UNDEFINED THING'

        get :index
        expect(response).to have_http_status(:not_implemented)
      end
    end
  end
end
