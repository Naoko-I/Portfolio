class Relationship < ApplicationRecord
#user.index フォローフォロワー一覧表示のために追記
  belongs_to :follower, class_name:'User'
  belongs_to :followed, class_name: 'User'
end
