require 'rails_helper'

RSpec.describe 'Splashes', type: :request do
  describe 'GET /home' do
    it 'returns http success' do
      get '/splash/home'
      expect(response).to have_http_status(:success)
    end
  end
end
