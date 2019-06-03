class Weather
    include HTTParty

    format :json

    attr_accessor :temp, :description, :humidity
    
  def initialize(response)
    @temp = response['main']['temp']
    @description = response['weather'][0]['description']
    @humidity = response['main']['humidity']
  end
  

  

    def self.get_data(city)
        response = get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=metric&APPID=#{ENV['open_weather_map_api']}")
        if response.success?
            new(response)
        else
            raise response.body
        end
    end
end 