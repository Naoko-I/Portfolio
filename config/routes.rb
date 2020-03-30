Rails.application.routes.draw do
  root 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :blogs do
   resource :favorites, only: [:create, :destroy]
   resource :blog_comments, only: [:new, :create, :edit, :update, :destroy]
   resource :blog_images, only: [:new, :create, :edit, :update, :destroy]
  end

  # get 'relationships/following'
  # get 'relationships/followed'

  devise_for :users
  resources :users, only: [:create, :index, :show, :edit] do
   get "/favorites" => "favorites#index"
  end
  # 退会確認ページ用
  get '/users/withdraw' => 'users#withdraw'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
