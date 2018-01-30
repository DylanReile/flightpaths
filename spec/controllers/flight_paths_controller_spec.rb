require "rails_helper"

RSpec.describe FlightPathsController do
  describe 'POST endpoints' do
    def make_request
      post :endpoints, as: :json, params: { "tickets" => tickets }
    end

    let(:tickets) { [["SFO", "EWR"]] }

    it 'passes the tickets parameter to FlightPath' do
      expect(FlightPath).to receive(:new).with(tickets)
      make_request
    end

    it 'returns the output of FlightPath#airport_endpoints as json' do
      make_request
      expect(JSON.parse(response.body)).to eq(tickets[0])
    end

    context 'when FlightPath#airport_endpoints raises an error' do
      it 'prompts the user to ensure their input is properly formatted' do
        allow_any_instance_of(FlightPath).to receive(:airport_endpoints).and_raise
        make_request
        expect(response.body).to eq(described_class::ENDPOINTS_MALFORMED_INPUT_ERROR)
      end
    end
  end
end
