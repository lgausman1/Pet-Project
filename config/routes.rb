Rails.application.routes.draw do
  root to: "welcome#index"

  get '/users/new', to: 'users#new', as: "new_user"

  post '/users', to: 'users#create'

  get '/users/:id', to: 'users#show', as: "user"

  get 'users/:id/edit', to: 'users#edit', as: "edit_user"

  patch 'users/:id', to: 'users#update'

<<<<<<< HEAD
  get 'users/survey', to: 'users#survey', as: "new_survey"
=======
  get 'users/:id/survey', to: 'users#survey', as: "new_survey"
>>>>>>> 79526335ed2a90d77a01db1e55f9463897838b62

  get 'login', to: "sessions#new", as: "login"

  post 'sessions', to: "sessions#create"

  delete "logout", to: "sessions#delete", as: "logout"




#   Prefix Verb   URI Pattern          Controller#Action
#     root GET    /                    welcome#index
# new_user GET    /users/new(.:format) users#new
#    users POST   /users(.:format)     users#create
#     user GET    /users/:id(.:format) users#show
#    login GET    /login(.:format)     sessions#new
#          POST   /login(.:format)     sessions#create
#   logout DELETE /logout(.:format)    sessions#delete

end
