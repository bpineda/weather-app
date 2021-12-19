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
      expect(response.body).to match /City: Cupertino/
      expect(response.body).to match /Current temperature: 43.39/
      expect(response.body).to match /Max temperature: 47.8/
      expect(response.body).to match /Low temperature: 39.16/
      expect(response.body).to match /Humidity: 84/
      expect(response.body).to match /Zip Code: 95014/
      expect(response.body).to match /Date/
      
    end

    it "returns displays cached result" do

      VCR.use_cassette("geolocalization_call") do
        get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
        get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
      end

      expect(response).to have_http_status(:success)
      expect(response.body).to match /Cached Result/
      
    end

    it "returns displays non-cached result" do

      VCR.use_cassette("geolocalization_call") do
        get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
        get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
      end

      expect(response).to have_http_status(:success)
      expect(response.body).to match /Cached Result/

      new_time = Time.now + 1801
      Timecop.travel(new_time)

      VCR.use_cassette("geolocalization_call") do
        get "/search?address=1+Apple+Park+Way+Cupertino%2C+California%2C+95014+United+States&commit=SEARCH"
      end

      expect(response.body).to_not match /Cached Result/      
      
    end

  end

end
