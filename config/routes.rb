Rails.application.routes.draw do
  resources :task_checklists
  resources :user_checklists
  resources :categories
  resources :timers
  resources :tasks
  resources :checklists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#welcome', as: 'welcome'
  post '/checklists/:id/follow', to: 'checklists#follow', as: 'follow_checklist'
  post '/checklists/:id/unfollow', to: 'checklists#unfollow', as: 'unfollow_checklist'

  get '/checklists', to: 'checklists#index', as: 'checklists_path'
  get '/new_checklist_path', to: 'checklists#new', as: 'new_checklist_path'

  get 'welcome', to: 'sessions#welcome'
  get '/sessions/new', to: 'sessions#login', as: 'new_login'  
  delete '/sessions/logout', to: 'sessions#logout', as: 'sessions_logout'  

  get 'login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post 'login', to: 'sessions#create'

  # get 'sessions/new', to: 'sessions#new'
  # get 'sessions/create', to: 'sessions#create'

  get 'authorized', to: 'sessions#page_requires_login'

end

