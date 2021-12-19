require 'rails_helper'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.filter_sensitive_data('<G_API_KEY>') { Rails.application.credentials.geolocation_api_key }
  config.filter_sensitive_data('<WEATHER_API_KEY>') { Rails.application.credentials.weather_api_key }
  config.hook_into :faraday
end

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

      VCR.use_cassette("geolocalization_call") do
        get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
      end

      # get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
      expect(response).to have_http_status(:success)
    end
  end

end
