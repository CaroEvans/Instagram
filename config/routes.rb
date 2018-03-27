Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :posts
  root to: "posts#index"
  get '/posts/:id/comment', to: 'posts#comment', as: 'comment_post'
  # post '/posts/:id', to: 'post#comment'
end
