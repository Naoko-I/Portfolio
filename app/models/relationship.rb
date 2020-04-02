class Relationship < ApplicationRecord
#課題4に記述ないため一旦コメントアウト
#belongs_to :user

#user.index フォローフォロワー一覧表示のために追記
  belongs_to :followings, class_name:'User'
  belongs_to :followeds, class_name:'User'
end
