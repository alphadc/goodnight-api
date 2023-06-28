Rails.application.routes.draw do
  resources :timers
  resources :follows
  resources :users, only: [:index, :show]
  get '/users/:id/follow/:target_id', to: "users#follow", as: "follow_user"
  get '/users/:id/unfollow/:target_id', to: "users#unfollow", as: "unfollow_user"
end
