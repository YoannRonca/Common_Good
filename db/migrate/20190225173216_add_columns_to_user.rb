class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone_number, :integer
    add_column :users, :description, :text
  end
end
