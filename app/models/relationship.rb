class Relationship < ApplicationRecord
  belongs_to :user

  #user.index フォローフォロワー一覧表示のために追記
  #has_many :followings, class_name :'User'
  #has_many :followeds, class_name :'User'
end
