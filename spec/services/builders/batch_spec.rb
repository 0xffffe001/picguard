require 'spec_helper'

describe Services::Builders::BatchAnnotateImages do
  subject { described_class.new([image_request]) }
  let(:image) do
    Google::Apis::VisionV1::Image.new(content: open('spec/support/img/face-example.jpg').to_a.join)
  end
  let(:feature) { Google::Apis::VisionV1::Feature.new(type: 'FACE_DETECTION') }
  let(:image_request) do
    Google::Apis::VisionV1::AnnotateImageRequest.new(image: [image], features: [feature])
  end

  describe '#call' do
    it 'creates valid Google::Apis::VisionV1::BatchAnnotateImagesRequest object' do
      expect(subject.call).to be_an_instance_of Google::Apis::VisionV1::BatchAnnotateImagesRequest
    end
  end
end
