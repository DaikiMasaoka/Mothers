class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
  has_many :troubles, dependent: :destroy
  has_many :answers, dependent: :destroy
  attachment :profile_image
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  # 2文字以上20文字以下で一意性

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.search(search, word)
		@user = User.where("name LIKE? OR introduction LIKE?","%#{word}%","%#{word}%")
  end
end
