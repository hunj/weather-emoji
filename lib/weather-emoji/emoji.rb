
module WeatherEmoji
  # corresponding emoji for one single weather code.
  # TODO separate this into a "dictionary"
  def self.emoji_for weather_code
    case weather_code
    when (312..314), 321, (502..504), 511, (520..522), 531, 906
      # heavy_rain
    when (300..311), 500, 501
      # light_rain.sample
    when (600..602), 611, 612, 615, 616, (620..622), 903
      # snow
    when 701, 711, 721, 731, 741, 751, 761, 905, (952..958)
      # fog_wind
    when 762, 771, 781, (900..902), 962
      # extreme.sample
    when 800, 801, 904, 951
      # sunny.sample
    when 802, 803, 950
      # partly_cloudy.sample
    when 804
      # cloudy.sample
    when (200..202), (210..212), 221, (230..232), (959..961)
      # thunder.sample
    end
  end
end

