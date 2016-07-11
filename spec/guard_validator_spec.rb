require 'active_model'
require 'spec_helper'

class ImageStruct
  def initialize(path)
    @path = path
  end

  def img_path
    @path
  end
end

class ModelStruct
  include ActiveModel::Validations
  def initialize(image_struct)
    @image = image_struct
  end

  attr_accessor :image

  validates :image, guard: {
    safe_search: true,
    face_detection: true,
    method_name: :img_path }
end

describe GuardValidator do
  before(:all) do
    Picguard.configure do |config|
      config.google_api_key = ENV['GCLOUD_KEY']
      config.threshold_adult = "POSSIBLE"
      config.threshold_violence = "UNLIKELY"
      config.threshold_face = 0.8
    end
  end

  after(:each) { sleep 1 }

  subject { ModelStruct.new(image_struct) }

  context 'with valid picture' do
    let(:image_struct) { ImageStruct.new("spec/support/img/face-example.jpg") }
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'face unrecognised' do
    let(:image_struct) { ImageStruct.new("spec/support/img/cat.jpg") }
    it 'is invalid' do
      expect(subject).not_to be_valid
      expect(subject.errors[:image].size).to eq(1)
      expect(subject.errors.messages[:image].first).to eq("Face could not be recognised on given picture.")
    end
  end

  context 'violent content' do
    let(:image_struct) { ImageStruct.new("spec/support/img/gun-violence.jpg") }
    it 'is invalid' do
      expect(subject).not_to be_valid
      expect(subject.errors[:image].size).to eq(1)
      expect(subject.errors.messages[:image].first).to eq("Picture shows inappropriate content.")
    end
  end

  context 'path to picture invalid' do
    let(:image_struct) { ImageStruct.new("") }
    it 'is invalid' do
      expect(subject).not_to be_valid
      expect(subject.errors[:image].size).to eq(1)
      expect(subject.errors.messages[:image].first).to eq ("Picture doesn't exist.")
    end
  end
end
