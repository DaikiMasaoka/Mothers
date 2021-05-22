class Diary < ApplicationRecord
	has_many :diary_comments, dependent: :destroy
	has_many :diary_images, dependent: :destroy
	accepts_attachments_for :diary_images, attachment: :image
	has_many :likes, dependent: :destroy
	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true
	# タイトルボディの内容が空で無いこと

def liked_by?(user)
    likes.where(user_id: user.id).exists?
end

def self.search(search, word)
	@diary = Diary.where("title LIKE? OR body LIKE?","%#{word}%","%#{word}%")
end
end
