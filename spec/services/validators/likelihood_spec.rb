require 'spec_helper'

describe Services::Validators::Likelihood do
  subject { described_class.new(response, threshold) }
  let(:threshold) { 'possible' }

  context 'response is below the threshold' do
    let(:response) { 'unlikely' }

    describe '#call' do
      it 'checks whether response is acceptable' do
        expect(subject.call).to eq false
      end
    end
  end

  context 'response is above the threshold' do
    let(:response) { 'likely' }

    describe '#call' do
      it 'checks whether response is acceptable' do
        expect(subject.call).to eq true
      end
    end
  end
end
