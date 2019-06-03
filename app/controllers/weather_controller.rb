class WeatherController < ApplicationController
  require 'weather.rb'
  require 'climate.rb'
  def index
    @weather = Weather.get_data(params[:city])
    @wahoo = Climate.get_wahoo(params[:city])
  end
  
end
