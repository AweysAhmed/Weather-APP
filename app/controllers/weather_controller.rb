# frozen_string_literal: true

class WeatherController < ApplicationController
  require 'weather.rb'

  def index
    @weather = Weather.get_data(params[:city])
  end
end
