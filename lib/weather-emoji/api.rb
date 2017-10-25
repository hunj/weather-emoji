module WeatherEmoji
  GEOIP_URI = "http://freegeoip.net/json/"
  API_KEY = "17928230b610439be8e3f005b7245c8a"

  # get coordinates and corresponding country code for given IP address
  # * +ip_addr+ - the IP address, or the hostname to get coordinates and country code of.
  def self.get_coordinates ip_addr
    uri = GEOIP_URI
    uri += ip_addr if ip_addr

    begin
      response = JSON.parse(Net::HTTP.get(URI(uri)))

      # latitude, longitude
      lat = response["latitude"]
      lon = response["longitude"]

      # fetch country_code to determine which unit to default to
      country_code = response["country_code"]
      return [lat, lon, country_code]
    rescue
      puts "no internet connection or invalid hostname!"
      exit
    end
  end

  # get weather for given coordinates
  def self.get_weather_for_coordinates coordinates, options
    raise ArgumentError.new('latitude or longtitude not Numeric.') unless coordinates[0].is_a? Numeric or coordinates[1].is_a? Numeric

    raw_weather_data = {}

    # set up unit depending on the coordinate's country, if not given
    raw_weather_data[:unit] = options[:unit]
    if options[:unit].nil?
      if coordinates[2] == "US"
        raw_weather_data[:unit] = "imperial"
      else
        raw_weather_data[:unit] = "metric"
      end
    end

    current_weather_response = JSON.parse(Net::HTTP.get(URI(endpoint_for_current_weather(coordinates, raw_weather_data[:unit]))))
    if current_weather_response["cod"] == 200
      raw_weather_data[:current] = current_weather_response
    else
      puts "Error getting current weather information (#{current_weather_response["cod"]})"
      exit
    end

    forecast_weather_response = JSON.parse(Net::HTTP.get(URI(endpoint_for_weather_forecast(coordinates, raw_weather_data[:unit]))))
    if forecast_weather_response["cod"] == "200"
      raw_weather_data[:today]    = forecast_weather_response["list"][0]
      raw_weather_data[:tomorrow] = forecast_weather_response["list"][1]
    else
      puts "error getting forecast information (#{forecast_weather_response["cod"]})"
      exit
    end

    raw_weather_data
  end

  # Returns the API endpoint for current weather.
  # * +coordinates+ - the coordinates to check weather of.
  # * +unit+ - the unit to use. nil defaults to Kelvin; need to provide either "metric" or "imperial" for common uses.
  def self.endpoint_for_current_weather coordinates, unit
    "http://api.openweathermap.org/data/2.5/weather?units=#{unit}&lat=#{coordinates[0]}&lon=#{coordinates[1]}&APPID=#{API_KEY}"
  end

  # Returns the API endpoint for weather forecast.
  # * +coordinates+ - the coordinates to check weather of.
  # * +unit+ - the unit to use. nil defaults to Kelvin; need to provide either "metric" or "imperial" for common uses.
  def self.endpoint_for_weather_forecast coordinates, unit
    "http://api.openweathermap.org/data/2.5/forecast/daily?units=#{unit}&lat=#{coordinates[0]}&lon=#{coordinates[1]}&APPID=#{API_KEY}"
  end

  # Consumes given raw weather data from the API call.
  # * +raw_weather_data+ - the raw data from the API call.
  def self.consume_weather_data raw_weather_data
    weather_data = {}
    weather_data[:unit] = raw_weather_data[:unit]

    weather_data[:current] = {
      :code =>     raw_weather_data[:current]["weather"][0]["id"],
      :temp =>     raw_weather_data[:current]["main"]["temp"],
      :humidity => raw_weather_data[:current]["main"]["humidity"]
    }

    weather_data[:today] = {
      :code => raw_weather_data[:today]["weather"][0]["id"],
      :min => raw_weather_data[:today]["temp"]["min"],
      :max => raw_weather_data[:today]["temp"]["max"],
      :temps => [
        raw_weather_data[:today]["temp"]["morn"],
        raw_weather_data[:today]["temp"]["day"],
        raw_weather_data[:today]["temp"]["eve"],
        raw_weather_data[:today]["temp"]["night"],
      ]
    }

    weather_data[:tomorrow] = {
      :code => raw_weather_data[:tomorrow]["weather"][0]["id"],
      :min => raw_weather_data[:tomorrow]["temp"]["min"],
      :max => raw_weather_data[:tomorrow]["temp"]["max"],
      :temps => [
        raw_weather_data[:tomorrow]["temp"]["morn"],
        raw_weather_data[:tomorrow]["temp"]["day"],
        raw_weather_data[:tomorrow]["temp"]["eve"],
        raw_weather_data[:tomorrow]["temp"]["night"],
      ]
    }

    weather_data
  end

  def self.unit_code_for weather_data
    if weather_data[:unit] == "metric"
      "C"
    elsif weather_data[:unit] == "imperial"
      "F"
    end
  end

  def self.stringify weather_data
    unit = unit_code_for weather_data
    "Now:      #{weather_data[:current][:code].to_emoji} (#{weather_data[:current][:temp].to_i}º#{unit}/#{weather_data[:current][:humidity]}%)
Today:    #{weather_data[:today][:code].to_emoji} (#{weather_data[:today][:min].to_i}-#{weather_data[:today][:max].to_i}º#{unit})
Tomorrow: #{weather_data[:tomorrow][:code].to_emoji} (#{weather_data[:tomorrow][:min].to_i}-#{weather_data[:tomorrow][:max].to_i}º#{unit})"
  end

end