require "mini_magick"

module Services
  class ImagePreparator
    def initialize(image_path)
      @image_path = image_path
    end

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
      resize_to = resize_dimensions(image)
      image.resize(resize_to).path
    end

    def resize_dimensions(image)
      width, height = image.dimensions
      width > height ? "1600x1200" : "1200x1600"
    end
  end
end
