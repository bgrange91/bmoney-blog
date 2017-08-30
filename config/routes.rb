Rails.application.routes.draw do
  resources :users
  resources :blogs
  resources :posts do
    resources :comments
  end

  root "posts#index"

  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get   '/login', to: 'user_sessions#new'
  post  '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  # get '/create_blog', to: 'blogs#new'
  # post '/create_blog', to: 'blogs#create'
end
