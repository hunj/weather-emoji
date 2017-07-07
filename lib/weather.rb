require 'net/http'
require 'json'

require_relative 'weather-emoji/api'
# require_relative 'weather-emoji/emoji'

module WeatherEmoji
  # wat do here?
end

coord = WeatherEmoji::get_coordinates
result = WeatherEmoji::get_weather_for_coordinates coord, 'c'
data = WeatherEmoji::consume_weather_data result
WeatherEmoji::print data