Rails.application.routes.draw do
  root to: 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :blogs
  get 'relationships/following'
  get 'relationships/followed'

  resources :blog_comments
  #get 'blog_comments/new'
  #get 'blog_comments/create'
  #get 'blog_comments/show'
  #get 'blog_comments/edit'
  #get 'blog_comments/update'
  #get 'blog_comments/destroy'
  resources :blogs
  #get 'blogs/new'
  #get 'blogs/create'
  #get 'blogs/index'
  #get 'blogs/show'
  #get 'blogs/edit'
  #get 'blogs/update'
  #get 'blogs/destroy'
  resources :users
  #get 'users/index'
  #get 'users/show'
  #get 'users/edit'
  ##get 'users/withdraw'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
