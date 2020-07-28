Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts

  root 'image_posts#new'
end
