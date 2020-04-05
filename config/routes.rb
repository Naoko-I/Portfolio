Rails.application.routes.draw do
  root 'homes#top'
  get '/homes/about' => 'homes#about'

  resources :blogs do
   resource :favorites, only: [:index,:create, :destroy]
   resource :blog_comments, only: [:new, :create, :edit, :update, :destroy]
   # resource :blog_images, only: [:new, :create, :edit, :update, :destroy]
  end

  post '/relationships/:user_id/create' => 'relationships#create', as:'create_relation'
  delete '/relationships/:user_id/destroy' => 'relationships#destroy', as:'destroy_relation'
  #if文で場合分けできる？<%= if following_userなら「フォローを外す」→「外しますか？メッセージ表示、else「フォローする」%> if followerdなら「followする」→followingへ移動
  #get '/relationships/show' => 'relationships#show'

  # フォローフォロワー一覧ページ作成のため作成
  get '/users/followings' => 'users#followings'
  get '/users/followeds' => 'users#followeds'
  # 退会確認。最終必要なければ削除
  get '/users/withdraw' => 'users#withdraw'

  devise_for :users
  resources :users, only: [:create, :index, :show, :edit, :update] do
   get "/favorites" => "favorites#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
