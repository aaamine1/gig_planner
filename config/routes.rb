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


  # get 'bookings(/:booking_id)', to: 'pages#accept', as: :accept_booking

# current_user.bookings # (my bookings of other venues)
# current_user.venues # (my venues)
# current_user.venues.each do |venue|
#   venue.bookings # bookings others made for a venue of mine
#   # link_to 'accept this booking', accept_booking_path, method: :patch, status: "accepted"
#   # link_to 'reject this booking', reject_booking_path, method: :patch, status: "rejected"


# <%= link_to 'Accept this booking', accept_booking_path, method: :patch, status: "accepted" %>
# <%= link_to 'Reject this booking', reject_booking_path, method: :patch, status: "rejected" %>
