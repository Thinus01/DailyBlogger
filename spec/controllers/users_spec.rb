require_relative '../rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET users_controller#index' do
    before(:example) { get '/users' }

    it 'gives the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'is rendering the correct template' do
      expect(response).to render_template(:index)
    end

    it 'is having the correct body' do
      expect(response.body).to include('Hello from Users page')
    end
  end

  describe 'GET users_controller#show' do
    before(:example) { get '/users/:user_id' }

    it 'gives the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'is rendering the correct template' do
      expect(response).to render_template(:show)
    end

    it 'is having the correct body' do
      expect(response.body).to include('Hello from Users page')
    end
  end
end
