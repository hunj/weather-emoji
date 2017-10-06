class Integer
  # corresponding emoji for moon phase
  def to_moonphase
    case self
    when 1
      "\u{1F311}" # new moon
    when 2
      "\u{1F312}" # waxing crescent moon
    when 3
      "\u{1F313}" # first quarter moon
    when 4
      "\u{1F314}" # waxing gibbous moon
    when 5
      "\u{1F315}" # full moon
    when 6
      "\u{1F316}" # waning gibbous moon
    when 7
      "\u{1F317}" # last quarter moon
    when 8
      "\u{1F318}" # waning crescent moon
    end
  end

  # corresponding emoji for one single weather code.
  def to_emoji
    case self
    when (200..299), 960, 961
      "\u{26A1}"  # thunderstorm
    when (300..399)
      "\u{1F326}" # light rain (drizzle)
    when (500..599)
      "\u{2614}"  # rain
    when (600..699)
    when 800
      "\u{1F31E}" # clear sky
    when 801
      "\u{26C5}"  # few clouds
    when 802
      "\u{1F324}" # scattered clouds
    when 803
      "\u{1F325}" # broken clouds
    when 804
      "\u{2601}"  # overcast clouds
    when 900, 962
      "\u{1F32A}" # tornado
    when 903
      "\u{2744}"  # cold
    when 904
      "\u{1F525}" # hot
    when 905, 957
      "\u{1F32C}" # windy
    when 906, 958, 959
      "\u{1F30A}" # hail
    else
      "\u{1F30A}" # error
    end
  end
end