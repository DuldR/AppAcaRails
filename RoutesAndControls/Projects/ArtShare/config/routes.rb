Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :artworks, only: [:show, :index, :update, :create, :destroy]
  resources :artworkshares, only: [:create, :destroy]

end
