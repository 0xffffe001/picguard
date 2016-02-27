require 'spec_helper'

describe Picguard do
  before(:all) do
    Picguard.configure do |config|
      config.google_api_key = ENV['GCLOUD_KEY']
      config.threshold_adult = "POSSIBLE"
      config.threshold_violence = "UNLIKELY"
      config.threshold_face = 0.8
    end
  end
  it 'has a version number' do
    expect(Picguard::VERSION).not_to be nil
  end

  describe '#analyze' do
    subject { described_class.analyze(image_path: "spec/support/img/face-example.jpg") }
    it 'returns a result as hash' do
      expect(subject).to be_an_instance_of(Hash)
    end
  end
end
