class Mission < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :organization
  has_many :mission_users
  has_many :users, through: :mission_users
  has_many :reviews
  has_many :mission_sectors
  has_many :sectors, through: :mission_sectors

  validates :city, presence: true
  validates :country, presence: true
  validates :continent, presence: true
  validates :climate, presence: true
  validates :great_for, presence: true
  validates :safety, presence: true
  validates :tolerance, presence: true
  validates :skill, presence: true
  validates :language, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  CONTINENT = ["Africa", "Asia", "Europe", "North America", "Middle East" "South America", "Oceania"]
  CLIMATE = ["Tropical", "Dry", "Temperate", "Continental", "Polar"]
  GREATFOR = ["Families", "Single", "Couple", "Retirees", "Men", "Women"]
  SAFETY = ["Safe", "Safe for Women", "Cool but be careful"]
end
