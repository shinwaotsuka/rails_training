Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # namespace :admin do
  #   get 'users/new'
  # end

  # namespace :admin do
  #   get 'users/edit'
  # end

  # namespace :admin do
  #   get 'users/show'
  # end

  # namespace :admin do
  #   get 'users/index'
  # end

  # ユーザ画面
  namespace :admin do
    resources :users
  end

  # get 'tasks/index'
  # get 'tasks/show'
  # get 'tasks/new'
  # get 'tasks/edit'
  # タスク画面
  root to: 'tasks#index'
  resources :tasks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
