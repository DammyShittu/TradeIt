require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET /home' do
    before(:example) { get unauthenticated_root_path }

    it 'checks if action returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if action rendered a correct template' do
      expect(response).to render_template('home')
    end

    it 'checks if correct title is shown' do
      expect(response.body).to include('TradeIt')
      expect(response.body).to include('SIGN UP')
      expect(response.body).to include('SIGN IN')
    end
  end
end
