Rails.application.routes.draw do
  root 'rooms#index'
  resources :maps, only: :index
  resources :books, only: :index
  resources :contacts, only: :index
  resources :bookings, only: :index             # 入力画面
  post 'bookings/confirm' => 'bookings#confirm'   # 確認画面
  post 'bookings/thanks' => 'bookings#thanks'     # 送信完了画面
end
