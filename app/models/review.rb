class Review < ApplicationRecord
  belongs_to :mission
  belongs_to :user

  validates :content, presence: true
  validates :transparency, inclusion: { in: 0..5 }
  validates :social_impact, inclusion: { in: 0..5 }
  validates :staff_note, inclusion: { in: 0..5 }
end
