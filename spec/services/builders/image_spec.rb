require 'spec_helper'

describe Services::Builders::Image do
  subject { described_class.new(image_path) }
  let(:image_path) { 'spec/support/img/face-example.jpg' }

  describe '#call' do
    it 'creates valid Google::Apis::VisionV1::Image object' do
      expect(subject.call).to be_an_instance_of Google::Apis::VisionV1::Image
    end
  end
end
