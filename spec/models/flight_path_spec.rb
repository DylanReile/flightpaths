require "rails_helper"

RSpec.describe FlightPath do
  subject { described_class.new(tickets) }

  describe '#airport_endpoints' do
    subject { super().airport_endpoints }

    context 'when there is a single ticket' do
      let(:tickets) { [['SFO', 'EWR']] }
      it { is_expected.to eq(['SFO', 'EWR']) } 
    end

    context 'when there are two tickets' do
      let(:tickets) { [['ATL', 'EWR'], ['SFO', 'ATL']] }
      it { is_expected.to eq(['SFO', 'EWR']) } 
    end

    context 'when there are n tickets' do
      let(:tickets) { [['IND', 'EWR'], ['SFO', 'ATL'], ['GSO', 'IND'], ['ATL', 'GSO']] }
      it { is_expected.to eq(['SFO', 'EWR']) } 
    end
  end
end
