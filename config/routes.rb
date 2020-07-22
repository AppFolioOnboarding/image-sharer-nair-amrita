Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts

  root 'posts#new'
end
