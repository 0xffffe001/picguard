require 'spec_helper'
require 'mini_magick'

describe Services::ImagePreparator do
  describe '#call' do
    context 'image is too big' do
      let(:image_path) { 'spec/support/img/face-example.jpg' }

      context 'with face detection' do
        subject { described_class.new(image_path, true, true).call }
        it 'resizes picture to 1600x' do
          expect(MiniMagick::Image.open(subject).dimensions.first).to equal 1600
        end
      end

      context 'without face detection' do
        subject { described_class.new(image_path, false, true).call }
        it 'resizes picture to 640x' do
          expect(MiniMagick::Image.open(subject).dimensions.first).to equal 640
        end
      end
    end

    context 'image is below the threshold' do
      let(:image_path) do
        img = MiniMagick::Image.open('spec/support/img/face-example.jpg')
        img.resize(800).path
      end
      subject { described_class.new(image_path, true, true).call }
      it 'does not resize the picture' do
        original_dimensions = MiniMagick::Image.open(image_path).dimensions
        expect(MiniMagick::Image.open(subject).dimensions).to match_array(original_dimensions)
      end
    end
  end
end
