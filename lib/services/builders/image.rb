require "google/apis/vision_v1"

module Services
  module Builders
    class Image
      def initialize(image_path)
        @image_path = image_path
      end

      def call
        Google::Apis::VisionV1::Image.new(content: open(@image_path).to_a.join)
      end
    end
  end
end
