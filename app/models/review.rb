class Review < ApplicationRecord
  belongs_to :mission
  belongs_to :user

  validates :content, presence: true
  validates :transparency, inclusion: { in: 0..5 }
end
