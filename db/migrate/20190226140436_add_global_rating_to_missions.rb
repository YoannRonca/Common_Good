class AddGlobalRatingToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :global_rating, :integer
  end
end
