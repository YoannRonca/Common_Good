class Review < ApplicationRecord
  belongs_to :mission_id
  belongs_to :user_id

  validates :content, presence: true
  validates :transparency, inclusion: { in: 0..5 }
end
