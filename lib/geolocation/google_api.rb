require 'faraday'
require 'json'
require 'active_support' 

class GoogleApi
  BASE = "https://maps.googleapis.com/maps/api/geocode/json"
  API_KEY = Rails.application.credentials.geolocation_api_key


  def self.get_city_by_address(address_string)
    puts "Getting city by address"
    conn = Faraday.new(:url => BASE, :ssl => {:verify => false}) do |faraday|
      faraday.response :logger                  # log requests to $stdout
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
      req.url "?key=#{API_KEY}&address=#{address_string}"
    end

    response
  end

  

end
