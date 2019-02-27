class ChangeSatefyToSafetyinMissions < ActiveRecord::Migration[5.2]
  def change
    rename_column :missions, :satefy, :safety
  end
end
