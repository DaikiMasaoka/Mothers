class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :trouble
  validates :comment, presence: true

end
