class MissionUser < ApplicationRecord
  belongs_to :user
  belongs_to :mission

  STATUS = ["pending", "accepted", "declined"]
end
