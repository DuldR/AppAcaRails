Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [ :index, :show, :create, :new ]
  resource :session, only: [ :destroy, :create, :new ]
  resources :goals, only: [ :update, :destroy, :show, :create ]

  resources :user_comments, only: [ :update, :destroy, :show, :create, :new ]

  resources :goal_comments, only: [ :update, :destroy, :show, :create, :new ]

end
