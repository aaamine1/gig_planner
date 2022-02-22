Rails.application.routes.draw do
  resources :venues
  devise_for :users
  root to: 'pages#home'
  resources :venues do
    resources :bookings, only: [:new, :create]
  end
  # get 'bookings(/:booking_id)', to: 'pages#accept', as: :accept_booking
end
