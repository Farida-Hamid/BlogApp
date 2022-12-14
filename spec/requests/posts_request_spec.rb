require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/index/posts'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index' do
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/index/posts/index'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'render template works' do
      expect(response).to render_template(:show)
    end

    it 'response body has the right placeholder' do
      expect(response.body).to include('Post')
    end
  end
end
