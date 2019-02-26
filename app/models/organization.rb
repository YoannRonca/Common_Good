class Organization < ApplicationRecord
  has_many :missions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
