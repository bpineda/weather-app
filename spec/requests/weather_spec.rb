require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/weather/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /get_by_city" do
    it "returns http success" do
      get "/weather/get_by_city"
      expect(response).to have_http_status(:success)
    end
  end

end
