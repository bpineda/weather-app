class WeatherController < ApplicationController
  def index
    @address = params['address']
    @cached_result = false
    unless @address.nil?

      search_result = Search.find_or_create_by(query: @address)

      if search_result.geo_response.nil?
        # Fetch fresh results
        weather = Weather.new
        weather_data = weather.get_weather_data @address
        search_result.geo_response = weather_data['geo_response']
        search_result.weather_response = weather_data['weather_response']
        search_result.zip_code = weather_data['zip_code']
        search_result.save

      else

        @cached_result = true
        elapsed_time = Time.now - search_result.updated_at
        if elapsed_time > 1800
          # Fetch results again
          @cached_result = false
          weather = Weather.new
          weather_data = weather.get_weather_data @address
          search_result.geo_response = weather_data['geo_response']
          search_result.weather_response = weather_data['weather_response']
          search_result.zip_code = weather_data['zip_code']
          search_result.save
          search_result.touch

        end
      end

      weather_data = JSON.parse search_result['weather_response']
      @temperature = weather_data['main']['temp']
      @max = weather_data['main']['temp_max']
      @low = weather_data['main']['temp_min']
      @pressure = weather_data['main']['pressure']
      @humidity = weather_data['main']['humidity']
      @city = weather_data['name']
      @zip_code = search_result.zip_code
    end
  end

end
