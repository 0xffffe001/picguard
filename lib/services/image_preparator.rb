require "mini_magick"

module Services
  class ImagePreparator
    def initialize(image_path, face_detection, safe_search)
      @image_path = image_path
      @face_detection = face_detection
      @safe_search = safe_search
    end

    RECOMMENDED_SIZES = {
      face_detection: %w(1600x1200 1200x1600),
      safe_search: %w(640x480 480x640)
    }.freeze

    private_constant :RECOMMENDED_SIZES

    def call
      image = MiniMagick::Image.open(@image_path)
      return @image_path unless oversized?(image)
      resize_image(image)
    end

    private

    def oversized?(image)
      dimensions = image.dimensions
      dimensions.any? { |dimension| dimension > 1600 }
    end

    def resize_image(image)
      image.resize(resize_dimensions(image)).path
    end

    def resize_resolution(filter, order)
      RECOMMENDED_SIZES.fetch(filter.to_sym)[order]
    end

    def resize_dimensions(image)
      width, height = image.dimensions
      resize_to = @face_detection ? "face_detection" : "safe_search"
      order = width > height ? 0 : 1
      resize_resolution(resize_to, order)
    end
  end
end
