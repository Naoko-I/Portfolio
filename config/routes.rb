Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :blogs do
    resource :favorites, only: [:index,:create, :destroy]
    resource :blog_comments, only: [:new, :create, :edit, :update, :destroy]
  end

  # フォローフォロワー一覧ページ作成のため作成
  # get '/users/follower' => 'users#follower'
  # get '/users/followed' => 'users#followed'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'favorites' => 'favorites#index'
    get 'follows' => 'relationships#follower', as: 'follows' # フォローする
    get 'followers' => 'relationships#followed', as: 'unfollows' # フォロー外す
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
