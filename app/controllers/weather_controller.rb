class WeatherController < ApplicationController
  def index
    @address = params['address']
    unless @address.nil?
      weather = Weather.new
      weather_data = weather.get_weather_data @address
      puts weather_data.inspect
      @temperature = weather_data['main']['temp']
      @city = weather_data['name']
    end
  end

  def get_by_city
  end
end
