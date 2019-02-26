class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :city
      t.string :continent
      t.string :country
      t.string :climate
      t.string :great_for
      t.string :cost_of_life
      t.string :satefy
      t.string :tolerance
      t.string :skill
      t.string :language
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
