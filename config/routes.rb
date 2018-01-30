Rails.application.routes.draw do
  post '/flightpaths', to: 'flight_paths#endpoints'
end
