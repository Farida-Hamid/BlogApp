require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it "Render index" do
      get users_url
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/index'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'render template works' do
      expect(response).to render_template(:show)
    end

    it 'response body has the right placeholder' do
      expect(response.body).to include('User')
    end
  end
end
