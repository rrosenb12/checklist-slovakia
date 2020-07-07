Rails.application.routes.draw do
  resources :task_checklists
  resources :user_checklists
  resources :categories
  resources :timers
  resources :tasks
  resources :checklists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/sessions/new', to: 'sessions#login', as: 'new_login'  
  post '/sessions', to: 'sessions#create', as: 'sessions'  
  delete '/sessions/logout', to: 'sessions#logout', as: 'sessions_logout'  
end
