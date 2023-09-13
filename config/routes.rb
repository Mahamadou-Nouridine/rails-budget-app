Rails.application.routes.draw do
  devise_for :users

  get '/auth', to: 'auth#index'
  root "categorys#index"
  resources :categorys, only: [:show, :index, :new, :create] do
    resources :transactions, only: [:new, :create]
  end
end
