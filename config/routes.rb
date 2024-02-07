Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/", to: "welcome#index"
  get '/basketball_teams', to: 'basketball_teams#index'
  get '/basketball_teams/:id', to: 'basketball_teams#show'
  
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  
  get '/basketball_teams/:basketball_team_id/players', to: 'basketball_team_players#index'
  
end
