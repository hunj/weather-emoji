require 'net/http'
require 'json'

require_relative 'weather-emoji/api'
require_relative 'weather-emoji/emoji'

module WeatherEmoji
  # the "wrapper" for everything.
  def self.weather options
    coord = get_coordinates options[:host]
    result = get_weather_for_coordinates coord, options
    data = consume_weather_data result
    puts WeatherEmoji::stringify data
    exit
  end
end