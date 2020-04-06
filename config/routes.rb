Rails.application.routes.draw do
  root 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :blogs do
    resource :favorites, only: [:index,:create, :destroy]
    resource :blog_comments, only: [:new, :create, :edit, :update, :destroy]
  end

  post '/relationships/:user_id/create' => 'relationships#create', as:'create_relation'
  delete '/relationships/:user_id/destroy' => 'relationships#destroy', as:'destroy_relation'

  # フォローフォロワー一覧ページ作成のため作成
  get '/users/followings' => 'users#followings'
  get '/users/followeds' => 'users#followeds'

  devise_for :users
  resources :users, only: [:create, :index, :show, :edit, :update] do
    get "/favorites" => "favorites#index"
    # 退会確認。最終必要なければ削除
    get '/withdraw' => 'users#withdraw'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
