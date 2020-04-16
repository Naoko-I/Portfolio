class BlogComment < ApplicationRecord
	belongs_to :blog
	belongs_to :user

	validates :comments, presence: true, length: { minimum: 5,maximum: 80}
end
