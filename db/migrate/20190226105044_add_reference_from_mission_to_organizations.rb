class AddReferenceFromMissionToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_reference :missions, :organization, index: true
  end
end
