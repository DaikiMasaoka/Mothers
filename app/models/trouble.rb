class Trouble < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :title, presence: true
	validates :body, presence: true
	# タイトルボディの内容が空で無いこと
end
