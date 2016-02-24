require "google/apis/vision_v1"

module Services
  module Builders
    class Vision
      def initialize
        @key = Picguard.configuration.google_api_key
      end

      def call
        vision = Google::Apis::VisionV1::VisionService.new
        vision.key = @key
        vision
      end
    end
  end
end
