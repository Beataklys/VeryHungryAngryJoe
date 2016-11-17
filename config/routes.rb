Rails.application.routes.draw do

  resources :orders 

  root 'orders#index'

  get 'sessions/create'
  get 'sessions/destroy'

  get '/finalize/:id', to: 'orders#finalize', as: 'finalize'


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]


end
