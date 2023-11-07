# app/controllers/weather_controller.rb
class WeatherController < ApplicationController
  require 'httparty'

  def index
    @weather_data = nil
  end

  def fetch_weather
    api_key = 'd77aa7885eda4fba70a99a454fd0028f'
    city = params[:city]

    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}")

    if response.code == 200
      @weather_data = JSON.parse(response.body)
    else
      flash[:error] = 'Error al obtener datos del clima'
    end

    render 'index'
  end

  def create
    @weather_data = WeatherData.new(weather_data_params)

    if @weather_data.save
      flash[:success] = 'Datos del clima guardados exitosamente'
    else
      flash[:error] = 'Error al guardar los datos del clima en la base de datos'
    end

    redirect_to weather_index_path
  end

  private

  def weather_data_params
    params.require(:weather_data).permit(:city, :temperature, :description)
  end
end
