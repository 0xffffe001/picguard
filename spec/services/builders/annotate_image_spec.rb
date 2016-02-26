require 'spec_helper'

describe Services::Builders::AnnotateImage do
  subject { described_class.new(image, [feature]) }
  let(:image) do
    Google::Apis::VisionV1::Image.new(content: open('spec/support/img/face-example.jpg').to_a.join)
  end
  let(:feature) { Google::Apis::VisionV1::Feature.new(type: 'FACE_DETECTION') }

  describe '#call' do
    it 'creates valid Google::Apis::VisionV1::AnnotateImageRequest object' do
      expect(subject.call).to be_an_instance_of Google::Apis::VisionV1::AnnotateImageRequest
    end
  end
end
