Rails.application.routes.draw do
  get 'welcome/index'

  resources :image_posts

  root 'image_posts#new'
end
