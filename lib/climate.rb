class Climate
    include HTTParty

    format :json

    attr_accessor :temp, :description, :rh
    
  def initialize(response)
    @temp = response['data'][0]['temp']
    @description = response['data'][0]['weather']['description']
    @rh = response['data'][0]['rh']
  end
  

 
    
    def self.get_wahoo(city)
        response = get("https://api.weatherbit.io/v2.0/current?city=#{city}&key=#{ENV['weatherbit_api']}")
        if response.success?
            new(response)
        else
            raise response.body
        end
    end
end 