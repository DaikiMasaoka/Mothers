class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_comments
  has_many :likes
  attachment :image
end
