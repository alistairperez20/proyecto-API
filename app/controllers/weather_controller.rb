require 'httparty'

class WeatherController < ApplicationController
  def index
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=YourCity&appid=YourAPIKey")
    data = JSON.parse(response.body)

    if response.code == 200
      temperature = data['main']['temp']
      description = data['weather'][0]['description']
      city = data['name']

      WeatherData.create(temperature: temperature, description: description, city: city)
    else
      flash[:error] = 'Error al obtener datos del clima'
    end
  end
end
