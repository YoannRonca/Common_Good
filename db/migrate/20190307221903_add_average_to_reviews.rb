class AddAverageToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :average, :string
  end
end
