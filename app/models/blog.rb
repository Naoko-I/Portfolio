class Blog < ApplicationRecord
	belongs_to :user
	has_many :blog_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
		def favorited_by?(user)
	    favorites.where(user_id: user.id).exists?
	  end

	attachment :image
	validates :body, presence: true, length: { minimum: 2,maximum: 200}
	validates :image, presence: true
end
