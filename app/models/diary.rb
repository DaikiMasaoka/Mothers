class Diary < ApplicationRecord
	has_many :diary_comments, dependent: :destroy
	has_many :diary_images, dependent: :destroy
	accepts_attachments_for :diary_images, attachment: :image
	has_many :likes, dependent: :destroy
	belongs_to :user
	
def liked_by?(user)
    likes.where(user_id: user.id).exists?
end
end
