class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :relationship, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2,maximum: 20}
  validates :introduction, length: { maximum: 50}
end
