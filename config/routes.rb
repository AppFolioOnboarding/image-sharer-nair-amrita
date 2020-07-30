Rails.application.routes.draw do
  get 'welcome/index'
  get '/tagged', to: 'image_posts#tagged', as: :tagged
  resources :image_posts

  root 'image_posts#index'
end
