Rails.application.routes.draw do
  #resources :timers, only: [:create, :show]
  get '/timers/:id/timing', to: "timers#timing"
  get '/timers/:id/showtime', to: "timers#showtime"
  resources :follows
  resources :users, only: [:index, :show]
  get '/users/:id/follow/:target_id', to: "users#follow", as: "follow_user"
  get '/users/:id/unfollow/:target_id', to: "users#unfollow", as: "unfollow_user"
end
