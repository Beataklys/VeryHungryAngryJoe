Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'


  resources :orders

  root 'orders#index'

  get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]


end
