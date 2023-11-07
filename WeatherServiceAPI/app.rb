# WeatherServiceAPI/app.rb
require 'sinatra'

get '/weather' do
  content_type :json
  { temperature: 25.0, description: 'Sunny', city: 'New York' }.to_json
end
