Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :channels, :messages, :users


  get '/channels/:channel_id/leave', to: 'channels#user_leave'
  get '/channels/:channel_id/join', to: 'channels#user_join', as: 'join_channel'

  devise_scope :user do
    root to: "users/sessions#new"
  end

  authenticated :user do
    root to: "home#index", :as => "profile"
  end

  unauthenticated do
    root to: "users/registrations#new", :as => "unauthenticated"
  end


end
