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

  include PgSearch
  pg_search_scope :globar_search
  :against [:title, :city, :continent, :country, :climate, :great_for, :cost_of_life, :safety, :tolerance, :skill, :language]

  CONTINENT = ["Africa", "Asia", "Europe", "North America", "Middle East" "South America", "Oceania"]
  CLIMATE = ["Tropical", "Dry", "Temperate", "Continental", "Polar"]
  GREATFOR = ["Families", "Single", "Couple", "Retirees", "Men", "Women"]
  SAFETY = ["Safe", "Safe for Women", "Cool but be careful", "Low murder rate"]
  LANGUAGE = ["English", "Spanish", "Portuguese", "French", "Chinese", "German"]
  COSTOFLIFE = ["<$500/month", "<$1000/month", "<$2000/month"]
  SECTOR = ["Agriculture", "Arts & Music", " Children & Youth", "Civic Engagement", "Climate change", "Community Development", "Conflict Resolution", "Consumer Protection", "Crime & Safety", "Disability", "Economic Development", "Education", "Energy", "Environment", "Health & Medicine", "Human Rights & Civil Liberties", "Immigrants or Refugees", "LGBTQ", "Poverty", "Race & Ethnicity", "Religion & Spirituality", "Reproductive Health/Rights", "Sexual Abuse & Human Trafficking", "Transparency & Oversight", "Victim Support", "Water & Sanitation", "Women", "Wildlife Protection"]
end
