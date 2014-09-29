Football::Application.routes.draw do

  root 'homes#show'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :leagues, only: [:index, :new, :create, :show] do
    member do
      post "join" => "league_memberships#create"
      delete "leave" => "league_memberships#destroy"
    end
    resources :teams, only: [:new, :create]
  end

  resource :dashboard, only: [:show]

  resources :pro_teams, only: [:index, :show]

  resources :teams, only: [:show] do
    member do
      post "pick/:player_id" => "team_player_relationships#create", as: "pick"
      delete "drop/:player_id" => "team_player_relationships#destroy", as: "drop"
    end
    resources :players, only: [:index]
  end


  resources :players, only: [:index, :show]

  resources :quarterbacks, only: [:index]
  resources :runningbacks, only: [:index]
  resources :widereceivers, only: [:index]
  resources :tightends, only: [:index]
  resources :kickers, only: [:index]
  resources :defenses, only: [:index]

end
