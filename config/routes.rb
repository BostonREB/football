Football::Application.routes.draw do

  root 'homes#show'

  resources :pro_teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :quarterbacks, only: [:index]
  resources :runningbacks, only: [:index]
  resources :widereceivers, only: [:index]
  resources :tightends, only: [:index]
  resources :kickers, only: [:index]

end
