class FlightPathsController < ApplicationController
  ENDPOINTS_MALFORMED_INPUT_ERROR = 
      'Please ensure your input is in the proper format.
       This endpoint accepts an array of ticket arrays that contain two elements, an airport source and an airport destination.
       At least one ticket must be provided.
       e.g. [ [source, destination], [source, destination] ]'

  def endpoints
    render json: FlightPath.new(tickets).airport_endpoints
  rescue
    render plain: ENDPOINTS_MALFORMED_INPUT_ERROR 
  end

  private

  def tickets
    params.require(:tickets)
  end
end
