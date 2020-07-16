Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :superheroes, only: [:index, :show, :create, :updates, :destroy]

  get 'silly', to: 'silly#fun'
  post 'silly', to: 'silly#time'
  post 'silly/:id', to: 'silly#super'


  resources :superheroes do
    resources :abilities, only: [:index]
  end

  resources :abilities, only: [:show, :update, :create, :destroy]




end
