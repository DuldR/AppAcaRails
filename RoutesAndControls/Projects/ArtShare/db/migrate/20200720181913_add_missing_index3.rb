class AddMissingIndex3 < ActiveRecord::Migration[5.2]
  def change
    add_column :artwork_shares, :created_at, :datetime, null: false
    add_column :artwork_shares, :updated_at, :datetime, null: false
  end
end
