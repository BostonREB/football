Football::Application.routes.draw do

  root 'homes#show'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :leagues, only: [:index, :new, :create, :show] do
    resources :teams, only: [:new, :create, :show]
  end

  resource :dashboard, only: [:show]

  resources :pro_teams, only: [:index, :show]
  resources :players, only: [:index, :show] do
    member do
      post "pick" => "team_player_relationships#create"
      delete "drop" => "team_player_relationships#destroy"
    end
  end

  resources :quarterbacks, only: [:index]
  resources :runningbacks, only: [:index]
  resources :widereceivers, only: [:index]
  resources :tightends, only: [:index]
  resources :kickers, only: [:index]
  resources :defenses, only: [:index]

end
