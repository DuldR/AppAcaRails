class AddTimeStampsToRequest < ActiveRecord::Migration[5.2]
  def change
      add_column :cat_rental_requests, :created_at, :datetime, null: false
      add_column :cat_rental_requests, :updated_at, :datetime, null: false
  end
end
