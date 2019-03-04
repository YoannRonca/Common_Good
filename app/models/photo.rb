class Photo < ApplicationRecord
  belongs_to :mission, optional: true
  belongs_to :organization, optional: true

  mount_uploader :photo, PhotoUploader
end
