class DiaryImage < ApplicationRecord
	belongs_to :diary
	attachment :image
	validates :image, presence: true
	# 画像が選ばれてなければエラー
end
