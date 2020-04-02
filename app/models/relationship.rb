class Relationship < ApplicationRecord
#課題4に記述ないため一旦コメントアウト
#belongs_to :user

#user.index フォローフォロワー一覧表示のために追記
  belongs_to :following, class_name:'User'
  belongs_to :followed, class_name:'User'
end
