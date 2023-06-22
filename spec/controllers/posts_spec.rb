require_relative '../rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET posts_controller#index' do
    before(:example) { get '/users/:user_id/posts' }

    it 'gives the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'is rendering the correct template' do
      expect(response).to render_template(:index)
    end

    it 'is having the correct body' do
      expect(response.body).to include('Hello from Post page')
    end
  end

  describe 'GET posts_controller#show' do
    before(:example) { get '/users/:user_id/posts/:post_id' }

    it 'gives the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'is rendering the correct template' do
      expect(response).to render_template(:show)
    end

    it 'is having the correct body' do
      expect(response.body).to include('Hello from Post page')
    end
  end
end
