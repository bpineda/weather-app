require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/weather/index"
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET /search" do
    it "returns http success" do
      get "/search"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
      expect(response).to have_http_status(:success)
    end
  end

end
