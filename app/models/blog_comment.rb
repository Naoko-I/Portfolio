class BlogComment < ApplicationRecord
	belongs_to :blogs
	belongs_to :user

	validates :comment, presence: true, length: { minimum: 2,maximum: 80}
end
