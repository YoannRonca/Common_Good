class AddStatusToMissionUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :mission_users, :status, :string
  end
end
