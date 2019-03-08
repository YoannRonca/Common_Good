class Mission < ApplicationRecord
  include PgSearch

  pg_search_scope :search, against: [:title, :city, :continent, :country, :climate, :great_for, :cost_of_life, :safety, :tolerance, :skill, :language],
    associated_against: {
      organization: :name,
      sectors: :name
    },
    using: {
      tsearch: { prefix: true },
      # ignoring: :accents,
      # ranked_by: ":trigram"
    }

  # mount_uploaders :photos, PhotoUploader

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  belongs_to :organization
  has_many :mission_users
  has_many :users, through: :mission_users
  has_many :reviews, dependent: :destroy
  has_many :mission_sectors
  has_many :sectors, through: :mission_sectors
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  COSTOFLIFE = ["< $500", "< $1000", "< $2000"]
  HOME_CATEGORY = ["urgent", "trustyworth", "recent"]
  CONTINENT = ["Africa", "Asia", "Europe", "North America", "Middle East", "South America", "Oceania"]
  CLIMATE = ["Tropical", "Dry", "Temperate", "Continental", "Polar"]
  GREATFOR = ["Families", "Single", "Couple", "Retirees", "Men", "Women"]
  SAFETY = ["Low", "Medium", "High"]
  LANGUAGE = ["English", "Spanish", "Portuguese", "French", "Chinese", "German"]
  SECTOR = ["Agriculture", "Arts & Music", " Children & Youth", "Education", "Environment", "Health & Medicine", "Refugees", "Water & Sanitation", "Wildlife Protection"]

  SECTOR = ["Agriculture", "Arts & Music", " Children & Youth", "Civic Engagement", "Climate change", "Community Development", "Conflict Resolution", "Consumer Protection", "Crime & Safety", "Disability", "Economic Development", "Education", "Energy", "Environment", "Health & Medicine", "Human Rights & Civil Liberties", "Immigrants or Refugees", "LGBTQ", "Poverty", "Race & Ethnicity", "Religion & Spirituality", "Reproductive Health/Rights", "Sexual Abuse & Human Trafficking", "Transparency & Oversight", "Victim Support", "Water & Sanitation", "Women", "Wildlife Protection"]

  # validates :cost_of_life, inclusion: { in: COSTOFLIFE }
  # validates :city, presence: true
  # validates :country, presence: true
  # validates :continent, presence: true
  # validates :climate, presence: true
  # validates :great_for, presence: true
  # validates :safety, presence: true
  # validates :tolerance, presence: true
  # validates :skill, presence: true
  # validates :language, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true

  def self.perform_search(keyword)
    if keyword.present?
      keywords = keyword.split('|').join(' ')
      Mission.search(keywords)
      # Mission.search(keyword)
    else
      Mission.all
    end.sort
  end
end
