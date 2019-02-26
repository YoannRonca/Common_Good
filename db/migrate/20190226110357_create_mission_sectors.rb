class CreateMissionSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_sectors do |t|
      t.references :mission, foreign_key: true
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
