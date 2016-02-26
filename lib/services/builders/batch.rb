require "google/apis/vision_v1"

module Services
  module Builders
    class BatchAnnotateImages
      def initialize(image_requests)
        @image_requests = image_requests
      end

      def call
        Google::Apis::VisionV1::BatchAnnotateImagesRequest.new(requests: @image_requests)
      end
    end
  end
end
