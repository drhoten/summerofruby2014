require 'sinatra'
require_relative 'weather'

get "/" do
  "Hello Weather"
end

get "/weather/:zipcode" do
  zipcode = params[:zipcode]
  # "#{zipcode}"
  weather = Weather.new(zipcode)
  if weather.fetch
    "The temp in #{weather.city} is #{weather.temperature} degrees"
  elsif
    weather.error_message
  end

end
