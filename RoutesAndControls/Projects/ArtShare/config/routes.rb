Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :artworks, only: [:show, :update, :create, :destroy]
  resources :artworkshares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]

  # resource :comments do
  #   resources :users, only: :index
  #   resources :artworks, only: :index
  # end

  get 'users/:user_id/artworks', to: 'artworks#index'

end
