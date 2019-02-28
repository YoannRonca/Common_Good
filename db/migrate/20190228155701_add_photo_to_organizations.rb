class AddPhotoToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :photo, :string
  end
end
