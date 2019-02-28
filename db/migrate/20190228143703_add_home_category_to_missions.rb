class AddHomeCategoryToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :home_category, :string
  end
end
