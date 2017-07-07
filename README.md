# Weather-emoji
​:gem:​ Display current, today, and tomorrow's forecast in command line.

## Example Usage

```shell
$ weather
Now:  	  ☀️ (25ºC)
Today:    ☁️ (20-30ºC)
Tomorrow: ⚡️ (15-25ºC)
```

## Implementation Progress

- [x] Geolocate current IP
- [x] Get weather information
- [x] Consume weather information
- [ ] Prettify weather information
- [ ] Add emoji for each weather code
- [ ] Turn this into a gem

## Spec

- Current
- Weather: ☀️🌦☁️🌧⛈🌩🌨🌪🌫🌊
- If weather is clear (no rain/snow):
  - Daytime: sun + cloudiness ☀️🌤⛅️🌥
  - Nighttime: show moon phase 🌕🌖🌗🌘🌑🌒🌓🌔
- Today
- Today's weather forecast, min-max temps
- Tomorrow
- Tomorrow's weather forecast, min-max temps

## Notes

### Weather Condition Codes

Check [OpenWeatherMap's doc](https://openweathermap.org/weather-conditions)
- 2xx: Thunderstorm :thunder:
- 3xx: Drizzle :droplet:
- 5xx: Rain ​:umbrella:​
- 8xx: Clear
- 800: clear sky :sunny:
- 801: few clouds :partly_sunny:
- 802: scattered clouds :partly_sunny:
- 803: broken clouds :cloud:
- 804: overcast clouds: :cloud:

## References

