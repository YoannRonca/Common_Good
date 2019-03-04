class RemovePhotoAttributeToOrganizationAndMission < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :photo, :string
    remove_column :missions, :photo, :string
  end
end
