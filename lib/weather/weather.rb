require 'json'
require 'GeolocationApi'
require 'WeatherApi'

class Weather


  def get_weather_data(query_string)
    geolocation_raw_data = GeolocationApi.get_city_by_address(query_string)
    geolocation_json = JSON.parse geolocation_raw_data.body
    city_name = geolocation_json['data'].first['name']
    weather_raw_data = WeatherApi.get_weather_by_city city_name
    weather_json = JSON.parse weather_raw_data.body
    weather_json
  end
  

end
