Rails.application.routes.draw do
  resources :follows
  resources :users, only: [:index, :show]
  get '/users/:id/follow/:target_id', to: "users#follow", as: "follow_user"
  get '/users/:id/unfollow/:target_id', to: "users#unfollow", as: "unfollow_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
