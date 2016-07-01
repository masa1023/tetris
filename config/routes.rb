Rails.application.routes.draw do
  root 'rooms#index'
  resources :bookings, only: :index
  resources :maps, only: :index
  resources :books, only: :index
  resources :contacts, only: :index
end
