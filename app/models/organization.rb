class Organization < ApplicationRecord
  has_many :missions, dependent: :destroy
  has_many :sectors, as: :sectorable

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
