require 'faraday'
require 'json'
require 'active_support' 

class WeatherApi
  BASE = "https://api.openweathermap.org/data/2.5/weather"
  API_KEY = Rails.application.credentials.weather_api_key


  def self.get_weather_by_city(city_name)
    puts "Getting weather by city"
    conn = Faraday.new(:url => BASE, :ssl => {:verify => false}) do |faraday|
      faraday.response :logger                  # log requests to $stdout
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
      req.url "?APPID=#{API_KEY}&units=imperial&q=#{city_name}"
    end

    response
  end

  

end
