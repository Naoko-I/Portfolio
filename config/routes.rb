Rails.application.routes.draw do
  root 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :blogs do
    resource :favorites, only: [:index,:create, :destroy]
    resource :blog_comments, only: [:new, :create, :edit, :update, :destroy]
  end

  # フォローフォロワー一覧ページ作成のため作成
  get '/users/followings' => 'users#followings'
  get '/users/followeds' => 'users#followeds'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    get "/favorites" => "favorites#index"
    post '/relationships' => 'relationships#create', as:'create_relation'
    delete '/relationships' => 'relationships#destroy', as:'destroy_relation'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

