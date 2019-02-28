class Organization < ApplicationRecord
  has_many :missions, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
