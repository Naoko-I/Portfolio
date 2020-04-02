class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #user.index フォローフォロワー一覧表示のために追記
  has_many :followings, through: :relationships, class_name: 'User'
  has_many :followeds, through: :relationships, class_name: 'User'
  #ログインエラー回復用(必要なければ削除) → has_many :relationships, :foreign_key :following_id, :foreign_key :followed_id, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20}
  #???sign upでintroductionのバリデーションがかかるのでコメントアウト
  # validates :introduction, length: {minimum: 2, maximum: 200}
end

