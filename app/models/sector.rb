class Sector < ApplicationRecord
  has_many :mission_sectors
  has_many :missions, through: :mission_sectors


  validates :name, presence: true, uniqueness: true
end
