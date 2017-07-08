# Weather-emoji
​:gem:​ Display current, today, and tomorrow's forecast in command line.

It displays a brief summary of:
- Current weather, temperature, and humidity
- Today's forecast (could rain later today no?)
- Tomorrow's forecast (so you don't forget your umbrella)

The forecasts also contain min-max temperatures as well.

## Example Usage

```shell
$ weather
Now:      🌤 (23ºC/57%)
Today:    🌞 (16-23ºC)
Tomorrow: 🌞 (17-24ºC)
```

You can also hit up an IP address or a hostname:

```shell
$ weather github.com
Now:      ⚡ (31ºC/55%)
Today:    🌞 (14-31ºC)
Tomorrow: 🌞 (12-19ºC)
```

## Implementation Progress

The following briefly explains the logic of how the weather is fetched and displayed; also, this serves as a to-do list.

- [x] Geolocate current IP
- [x] Get weather information
- [x] Consume weather information
- [x] Prettify weather information
- [x] Add emoji for each weather code
- [x] Turn this into a gem
- [ ] Add fahrenheit support
- [ ] Add moon phase
- [ ] Add

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

