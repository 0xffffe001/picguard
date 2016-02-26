module Picguard
  class Configuration
    attr_accessor :google_api_key, :threshold_adult, :threshold_violence, :threshold_face

    def initialize
      @threshold_adult = "POSSIBLE"
      @threshold_violence = "POSSIBLE"
      @threshold_face = 0.7
    end
  end
end
