Rails.application.routes.draw do

  resource :user
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'


end
