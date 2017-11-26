# Weather-emoji
​
:gem:​ Display current, today, and tomorrow's forecast in command line.

Displays a brief summary of:
- Current weather, temperature, and humidity
- Today's forecast (could rain later today no?)
- Tomorrow's forecast (so you don't forget your umbrella)

The forecasts also contain min-max temperatures as well.

## Example

```shell
$ weather
Now:      ☁ (49ºF/61%)
Today:    ☔ (42-49ºF)
Tomorrow: ⛅ (35-51ºF)
```

You can also specify which unit to use (`-f` for Fahrenheit, `-c` for Celsius):

```shell
$ weather -c
Now:      ☁ (9ºC/61%)
Today:    ☔ (5-9ºC)
Tomorrow: ⛅ (1-11ºC)
```

If the unit is not specified, the localized unit will be used (i.e. if the location is in US, use imperial, else metric).

You can also hit up an IP address or a hostname:

```shell
$ weather github.com
Now:      🌊 (80ºF/49%)
Today:    🌞 (62-82ºF)
Tomorrow: 🌞 (56-74ºF)

$ weather 8.8.8.8
Now:      ⛅ (77ºF/22%)
Today:    🌞 (57-82ºF)
Tomorrow: 🌞 (46-70ºF)
```

## Implementation Progress

The following briefly explains the logic of how the weather is fetched and displayed; also, this serves as a to-do list.

- [x] Geolocate given IP (or current host's IP, if not given)
- [x] Get weather information for that coordinate
- [x] Consume weather information
- [x] Prettify weather information
- [x] Add emoji for each weather code
- [x] Add fahrenheit support
- [ ] Add moon phase => version 1.0!

## Notes

### Weather Condition Codes

Check [OpenWeatherMap's doc](https://openweathermap.org/weather-conditions)

## References

- OpenWeatherMap API
