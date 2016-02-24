require "google/apis/vision_v1"
%w[annotate_image batch feature image vision].each do |serv|
  require "services/builders/#{serv}"
end

module Services
  module Builders
    class Request
      def initialize(image_path, safe_search, face_detection)
        @image_path = image_path
        @safe_search = safe_search
        @face_detection = face_detection
        @features = []
      end

      def call
        vision = Services::Builders::Vision.new.call
        @features << Services::Builders::Feature.new("SAFE_SEARCH_DETECTION").call if @safe_search
        @features << Services::Builders::Feature.new("FACE_DETECTION").call if @face_detection
        image = Services::Builders::Image.new(@image_path).call
        annotate_image = Services::Builders::AnnotateImage.new(image, @features).call
        batch_annotate = Services::Builders::BatchAnnotateImages.new([annotate_image]).call
        vision.annotate_image(batch_annotate).to_h[:responses].first
      end
    end
  end
end
