require 'net/http'
require 'json'

require_relative 'weather-emoji/api'
require_relative 'weather-emoji/emoji'

module WeatherEmoji
  def self.weather host=nil
    coord = get_coordinates host
    result = get_weather_for_coordinates coord, 'c'
    data = consume_weather_data result
    WeatherEmoji::stringify data
  end
end
