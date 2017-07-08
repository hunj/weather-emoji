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
  # TODO verify each weather code to emoji conversion is accurate
  def to_emoji
    case self
    when (200...300)
      "\u{26A1}" # thunderstorm
    when (300...400)
      "\u{1F326}" # light rain (drizzle)
    when (500...600)
      "\u{2614}" # rain
    when 800
      "\u{1F31E}" # clear sky
    when 801
      "\u{26C5}" # few clouds
    when 802
      "\u{1F324}" # scattered clouds
    when 803
      "\u{1F325}" # broken clouds
    when 804
      "\u{2601}" # overcast clouds
    end
  end
end