Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'relationships/following'
  get 'relationships/followed'
  get 'blog_comments/new'
  get 'blog_comments/create'
  get 'blog_comments/show'
  get 'blog_comments/edit'
  get 'blog_comments/update'
  get 'blog_comments/destroy'
  get 'blogs/new'
  get 'blogs/create'
  get 'blogs/index'
  get 'blogs/show'
  get 'blogs/edit'
  get 'blogs/update'
  get 'blogs/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/withdraw'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
