require 'json'
require 'Google_Api'
require 'WeatherApi'

class Weather


  def get_weather_data(query_string)
    geolocation_raw_data = GoogleApi.get_city_by_address(query_string)
    geolocation_json = JSON.parse geolocation_raw_data.body

    city_data = geolocation_json['results'].first['address_components'].select{|address| address['types'].include?("locality")}
    city_name = city_data.first

    weather_raw_data = WeatherApi.get_weather_by_city city_name['long_name']
    weather_json = JSON.parse weather_raw_data.body
    weather_json
  end
  

end
