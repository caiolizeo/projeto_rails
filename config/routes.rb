Rails.application.routes.draw do
  root 'home#index'

  resources :products, only: [:show, :new, :create, :update]

  get '/checkout', to: 'products#checkout'
  delete '/checkout/finish', to: 'products#finish'

end
