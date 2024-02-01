require 'rails_helper'

RSpec.describe "BasketballTeams", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/basketball_teams/index"
      expect(response).to have_http_status(:success)
    end
  end

end
