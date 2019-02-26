class Mission < ApplicationRecord
  belongs_to :organization

  has_may :sectors, as: :sectorable
  has_many :favorites, through: :users
  has_many :reviews, through: :users
  has_many :mission_users, through: :users

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
end
