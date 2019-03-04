class Organization < ApplicationRecord
  has_many :missions, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  # mount_uploaders :photos, PhotoUploader

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
