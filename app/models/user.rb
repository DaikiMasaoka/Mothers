class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :diarys, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
  has_many :troubles, dependent: :destroy
  has_many :answers, dependent: :destroy
end
