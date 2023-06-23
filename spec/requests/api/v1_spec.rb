require 'rails_helper'

RSpec.describe 'Api::V1s', type: :request do
  describe 'GET /controller_name' do
    it 'returns http success' do
      get '/api/v1/controller_name'
      expect(response).to have_http_status(:success)
    end
  end
end
