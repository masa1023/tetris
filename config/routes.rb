Rails.application.routes.draw do
  resources :rooms, only: :index
  resources :bookings, only: :index
  resources :maps, only: :index
  resources :books, only: :index
  resources :contacts, only: :index
end
