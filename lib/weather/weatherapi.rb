require 'faraday'
require 'json'
require 'active_support' 

class WeatherApi
  BASE = "https://api.openweathermap.org/data/2.5/weather"
  API_KEY = Rails.application.credentials.weather_api_key


  def self.get_weather_by_city
    puts "Getting weather by city"
    conn = Faraday.new(:url => BASE, :ssl => {:verify => false}) do |faraday|
      faraday.response :logger                  # log requests to $stdout
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
      req.url "?APPID=e1d8cffa57dce4a2f62da5c0ae1ca519&units=imperial&q=San Jose,us"
    end

    response
  end

  

end
