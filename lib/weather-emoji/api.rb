module WeatherEmoji
  GEOIP_URI = "http://freegeoip.net/json/"
  API_KEY = "17928230b610439be8e3f005b7245c8a"


  # get coordinates for given IP address
  def self.get_coordinates ip_addr=nil
    raise ArgumentError.new('ip_addr not String') unless !ip_addr or ip_addr.is_a? String

    uri = GEOIP_URI
    uri += ip_addr if ip_addr

    begin
      response = JSON.parse(Net::HTTP.get(URI(uri)))
      lat = response["latitude"]
      lon = response["longitude"]
      [lat, lon]
    rescue => e
      p "no internet connection?"
      exit
    end
  end

  # get weather for given coordinates
  def self.get_weather_for_coordinates coordinates, unit="metric"
    raise ArgumentError.new('latitude or longtitude not Numeric.') unless coordinates[0].is_a? Numeric or coordinates[1].is_a? Numeric

    raw_weather_data = {}

    current_weather_response = JSON.parse(Net::HTTP.get(URI(endpoint_for_current_weather(coordinates))))
    if current_weather_response["cod"] == 200
      raw_weather_data[:current] = current_weather_response
    else
      p "Error getting current weather information (#{current_weather_response["cod"]})"
      exit
    end

    forecast_weather_response = JSON.parse(Net::HTTP.get(URI(endpoint_for_weather_forecast(coordinates))))
    if forecast_weather_response["cod"] == "200"
      raw_weather_data[:today]    = forecast_weather_response["list"][0]
      raw_weather_data[:tomorrow] = forecast_weather_response["list"][1]
    else
      p "error getting forecast information (#{forecast_weather_response["cod"]})"
      exit
    end

    raw_weather_data
  end

  def self.endpoint_for_current_weather coordinates, unit="metric"
    "http://api.openweathermap.org/data/2.5/weather?units=#{unit}&lat=#{coordinates[0]}&lon=#{coordinates[1]}&APPID=#{API_KEY}"
  end

  def self.endpoint_for_weather_forecast coordinates, unit="metric"
    "http://api.openweathermap.org/data/2.5/forecast/daily?units=#{unit}&lat=#{coordinates[0]}&lon=#{coordinates[1]}&APPID=#{API_KEY}"
  end

  def self.consume_weather_data raw_weather_data
    weather_data = {}

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

  def self.print weather_data
    puts "Now:      #{weather_data[:current][:code]} (#{weather_data[:current][:temp]}ºC / #{weather_data[:current][:humidity]}%)"
    puts "Today:    #{weather_data[:today][:code]} (#{weather_data[:today][:min]} - #{weather_data[:today][:max]}ºC)"
    puts "Tomorrow: #{weather_data[:tomorrow][:code]} (#{weather_data[:tomorrow][:min]} - #{weather_data[:tomorrow][:max]}ºC)"
  end

end