require 'spec_helper'

describe Services::Builders::Feature do
  let(:type) { 'SAFE_SEARCH_DETECTION' }
  let(:max_results) { '3' }

  context 'max_results is defined' do
    subject { described_class.new(type, max_results) }

    describe '#call' do
      it 'creates valid Google::Apis::VisionV1::Feature object' do
        expect(subject.call).to be_an_instance_of Google::Apis::VisionV1::Feature
      end
    end
  end

  context 'max_results is not defined' do
    subject { described_class.new(type) }

    describe '#call' do
      it 'creates valid Google::Apis::VisionV1::Feature object' do
        expect(subject.call).to be_an_instance_of Google::Apis::VisionV1::Feature
      end
    end
  end
end
