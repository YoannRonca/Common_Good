class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :organization_id
      t.integer :mission_id
      t.string :photo

      t.timestamps
    end
  end
end
