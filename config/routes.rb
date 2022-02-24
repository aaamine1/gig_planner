Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :venues do
    resources :bookings, only: [:new, :create]
  end
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  patch 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch 'bookings/:id/reject', to: 'bookings#reject', as: :reject_booking
end

# current_user.bookings # (my bookings of other venues)
# current_user.venues # (my venues)
# current_user.venues.each do |venue|
#   venue.bookings # bookings others made for a venue of mine
