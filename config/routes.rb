Rails.application.routes.draw do
  get 'welcome/index'
  resources :image_posts

  root 'image_posts#index'

  resources :feedbacks, only: [:new]

  namespace :api do
    resource :feedbacks, only: [:create]
  end
end
