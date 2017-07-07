# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weather-emoji/version'

Gem::Specification.new do |s|
  s.name        = 'weather-emoji'
  s.executables << 'weather'
  s.version     = WeatherEmoji::VERSION
  s.date        = '2017-07-07'
  s.summary     = "Show weather in emoji"
  s.description = "Display current, today, and tomorrow's weather forecast in minimalistic manner, using emojis"
  s.authors     = ["Hun Jae Lee"]
  s.email       = 'admin@hunj.me'
  s.files       = `git ls-files`.split("\n")
  s.homepage    =
    'http://rubygems.org/gems/weather-emoji'
  s.license       = 'Beerware'
end
