Rails.application.routes.draw do
  root to: "welcome#index"

  get '/register', to: 'users#new', as: "register"

  post '/users', to: 'users#create'

  get '/users/:id', to: 'users#show', as: "user"

  get 'users/:id/edit', to: 'users#edit', as: "edit_user"

  patch 'users/:id', to: 'users#update'

  get '/users/:id/survey', to: 'users#survey', as: "new_survey"

  get '/login', to: "sessions#new", as: "login"
  post '/sessions', to: "sessions#create"
  delete "/logout", to: "sessions#delete", as: "logout"

  get '/pets', to: "pets#index", as: "pets"

  get '/pets/:id', to: 'pets#show', as: "pet"

  get '/preferences/users/:id', to: 'preferences#survey'

  post '/preferences', to: 'preferences#create'

  get '/preferences/users/:id/edit', to: 'preferences#edit', as: "edit_preferences"

  patch '/preferences/users/:id', to: 'preferences#update', as: "preference"

  get '/users/:id/matches', to: 'users#matches', as: "matches"

  post 'users/:id/matches', to: 'users#refresh_pets'

  get '/about', to: 'welcome#about'

  get '/contact', to: 'welcome#contact'

  post '/user_pets/:id', to: 'user_pets#create'

  post '/user_pets/delete/:id', to: 'user_pets#delete'


#   Prefix Verb   URI Pattern          Controller#Action
#     root GET    /                    welcome#index
# new_user GET    /users/new(.:format) users#new
#    users POST   /users(.:format)     users#create
#     user GET    /users/:id(.:format) users#show
#    login GET    /login(.:format)     sessions#new
#          POST   /login(.:format)     sessions#create
#   logout DELETE /logout(.:format)    sessions#delete

end
