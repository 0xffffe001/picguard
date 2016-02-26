require 'spec_helper'

describe Services::Builders::Vision do
  subject { described_class.new }

  before { Picguard.configure { |config| config.google_api_key = "google_api_key" } }

  describe '#call' do
    it 'creates valid Google::Apis::VisionV1::VisionService object with given key' do
      expect(subject.call).to be_an_instance_of Google::Apis::VisionV1::VisionService
      expect(subject.call.key).to eq "google_api_key"
    end
  end
end
