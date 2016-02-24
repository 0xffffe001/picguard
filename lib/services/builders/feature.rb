require "google/apis/vision_v1"

module Services
  module Builders
    class Feature
      def initialize(type, max_results = "1")
        @type = type
        @max_results = max_results
      end

      def call
        Google::Apis::VisionV1::Feature.new(max_results: @max_results, type: @type)
      end
    end
  end
end
