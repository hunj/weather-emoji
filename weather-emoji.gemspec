# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weather-emoji/version'
require 'date'

Gem::Specification.new do |s|
  s.name        = 'weather-emoji'
  s.executables << 'weather'
  s.version     = WeatherEmoji::VERSION
  s.date        = Date.today.to_s
  s.summary     = "Show weather in emoji"
  s.description = "Display current, today, and tomorrow's weather forecast in minimalistic manner, using emojis"
  s.authors     = ["Hun Jae Lee"]
  s.email       = 'admin@hunj.me'
  s.files       = `git ls-files`.split("\n")
  s.homepage    =
    'https://github.com/hunj/weather-emoji'
  s.license       = 'Beerware'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
