Rails.application.routes.draw do
  resources :task_checklists
  resources :user_checklists
  resources :categories
  resources :timers
  resources :tasks
  resources :checklists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
