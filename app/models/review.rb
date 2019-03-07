class Review < ApplicationRecord
  belongs_to :mission
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :content, presence: true
  validates :transparency, inclusion: { in: 0..5 }
  validates :social_impact, inclusion: { in: 0..5 }
  validates :staff_note, inclusion: { in: 0..5 }

  TRANSPARENCY = [1, 2, 3, 4, 5]
  SOCIAL = [1, 2, 3, 4, 5]
  STAFF = [1, 2, 3, 4, 5]
end
