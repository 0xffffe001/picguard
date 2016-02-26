require "google/apis/vision_v1"

module Services
  module Builders
    class AnnotateImage
      def initialize(image, features)
        @image = image
        @features = features
      end

      def call
        Google::Apis::VisionV1::AnnotateImageRequest.new(image: @image, features: @features)
      end
    end
  end
end
