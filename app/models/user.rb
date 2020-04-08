class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20}

  #???sign upでintroductionのバリデーションがかかるのでコメントアウト
  # validates :introduction, length: {minimum: 2, maximum: 200}

  #user.index フォローフォロワー一覧表示のために追記
  has_many :followings, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy # フォロー取得
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :followings_user, through: :followings, source: :followeds # 自分がフォローしている人
  has_many :followeds_user, through: :followeds, source: :followings # 自分をフォローしている人

  def follow(user_id)
    following.create(followed_id: user_id)
  end
  # ユーザーのフォローを外す
  def unfollow(user_id)
    following.find_by(followed_id: user_id).destroy
  end
  # フォローしていればtrueを返す
  def following?(user)
    followings.include?(user)
  end


end

