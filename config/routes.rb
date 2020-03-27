Rails.application.routes.draw do
  root to: 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :blogs
  get 'relationships/following'
  get 'relationships/followed'

  resources :blog_comments

  resources :blogs

  resources :favorites

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
