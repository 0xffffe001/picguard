require "picguard/version"
require "google/apis/vision_v1"

class Picguard
  def self.process_picture(path)
    vision = Google::Apis::VisionV1::VisionService.new
    vision.key = ''

    image = Google::Apis::VisionV1::Image.new(content: open(path).to_a.join)
    feature = Google::Apis::VisionV1::Feature.new(max_results: "1", type: "LABEL_DETECTION")
    image_request =  Google::Apis::VisionV1::AnnotateImageRequest.new(image: image, features:[feature])
    image_batch = Google::Apis::VisionV1::BatchAnnotateImagesRequest.new(requests: [image_request])

    result = vision.annotate_image(image_batch)
    puts result.to_h
  end
end
