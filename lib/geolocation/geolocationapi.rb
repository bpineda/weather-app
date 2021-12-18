require 'faraday'
require 'json'
require 'active_support' 

class GeolocationApi
  BASE = "http://api.positionstack.com/v1/forward"
  API_KEY = Rails.application.credentials.geolocation_api_key


  def self.get_city_by_address
    puts "Getting city by address"
    conn = Faraday.new(:url => BASE, :ssl => {:verify => false}) do |faraday|
      faraday.response :logger                  # log requests to $stdout
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
      req.url "?access_key=9b3c1f513f78117e37b87a09410bf766&query=Tulsa"
    end

    response
  end

  

end
