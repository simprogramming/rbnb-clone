Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/manage', to: 'pages#manage'
  get 'manage/confirm/', to: 'pages#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, only: [ :create, :new, :show]
  end
  resources :bookings, only: [:index, :edit, :update]
end
