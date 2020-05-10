Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get '/search', to: 'search#search'

  resources :blogs do
    resource :favorites, only: [:index, :create, :destroy]
      get 'favorites/index' => 'favorites#index'
    resource :blog_comments, only: [:new, :create, :destroy]
      post 'blog_comments/create' => 'blogs#show'
  end

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows' # フォローする
    get 'followers' => 'relationships#followed', as: 'unfollows' # フォロー外す
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
