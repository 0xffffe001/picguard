require 'spec_helper'

describe Services::Analyzer do
  subject { described_class.new(
    result = ResultHashStub.new.api_hash_result,
    threshold_adult = 'POSSIBLE',
    threshold_violence = 'POSSIBLE',
    threshold_face = 0.8
    ) }
  describe '#call' do
    let(:analyzed_result) { subject.call }

    it 'returns a valid hash' do
      expect(analyzed_result).to be_an_instance_of(Hash)
      expect(analyzed_result).to have_key(:safe_search)
      expect(analyzed_result[:safe_search]).to have_key(:adult)
      expect(analyzed_result[:safe_search]).to have_key(:violence)
      expect(analyzed_result).to have_key(:face_recognised)
    end

    it 'returns adult content violation' do
      expect(analyzed_result[:safe_search][:adult]).to be(true)
    end

    it 'does not return violent content violation' do
      expect(analyzed_result[:safe_search][:violence]).to be(false)
    end

    it 'recognises face' do
      expect(analyzed_result[:face_recognised]).to be(true)
    end
  end
end
