require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    let!(:user) { create(:user) }

    it 'contains the users' do
      get '/users'
      expect(response).to be_successful
      expect(response.body).to include(user.username)
    end
  end
end
