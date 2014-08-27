Football::Application.routes.draw do

  root 'homes#show'

  resources :pro_teams, only: [:index, :show]
  resources :players, only: [:show]
end
